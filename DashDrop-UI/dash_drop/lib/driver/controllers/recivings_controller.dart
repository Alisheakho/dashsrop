import 'package:dash_drop/core/services/geolocator_services.dart';
import 'package:dash_drop/core/services/signalr_services.dart';
import 'package:dash_drop/core/utils/enums.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/driver/models/deliveryOrder.dart';
import 'package:dash_drop/driver/models/reciver.dart';
import 'package:dash_drop/driver/models/reciving.dart';
import 'package:dash_drop/driver/models/sender.dart';
import 'package:dash_drop/routes/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lg_signalr_client/lg_signalr_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomepageLongRecivingController extends GetxController
    with StateMixin<Reciving> {
  final unfocusNode = FocusNode();
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt selectIndex = 0.obs;
  Rx<DeliveryState> destinationStatus = DeliveryState.accepted.obs;
  RxInt destinationStatusInt = 3.obs;
  RxList<Reciving> recivings = const [
    Reciving(
        id: 98765,
        priority: 0,
        deliveryOrder: DeliveryOrder(
          id: 0,
          deliveryCost: 0,
          estimatedTime: '',
          receivingCode: '',
          extraProfitRate: 0,
          pathLengthKm: 0,
          polyLine: "",
          destinationLocation: '',
          destinationLocationDescription: '',
          sourceLocation: '',
          sourceLocationDescription: '',
          status: DeliveryState.pendding,
          paymentResponsibility: 0,
          reciverCustomer: Reciver(
              id: 0, firstName: '', lastName: '', phoneNumber: '', email: ''),
          senderCustomer: Sender(
              id: 0, firstName: '', lastName: '', phoneNumber: '', email: ''),
        ))
  ].obs;

  static HomepageLongRecivingController get to =>
      Get.find<HomepageLongRecivingController>();
  static Future<bool> get delete =>
      Get.delete<HomepageLongRecivingController>();

  void selectBottomMethod(int value) {
    selectIndex.value = value;
    update();
  }

  //------------------------------
  //----------Events
  //------------------------------
  Future<void> hubEvents() async {
    SignalrServices.to.hubConnection.on('ReceiveErrorMeesage', (p) {
      Get.defaultDialog(title: "Error", middleText: "${p.first}");
    });
    SignalrServices.to.hubConnection.on("RemoveDeliveryOffer", (param) {
      print("parapm: ${param.first}");
      recivings.removeWhere((f) => param.first == f.id);
      recivings.sort((a, b) {
        return b.priority.compareTo(a.priority);
      });
      refresh();
    });
    SignalrServices.to.hubConnection.on("ReceiveDeliveryOffer", (params) {
      var recivingItem =
          Reciving.fromJson(params.first as Map<String, dynamic>);
      if (kDebugMode) {
        print("parapm: ${recivingItem.id}");
      }
      recivings.removeWhere((f) => 98765 == f.id);
      bool isTekrar = recivings.any((f) => f.id == recivingItem.id);
      print("isnottekrar : $isTekrar");
      if (!isTekrar) {
        recivings.add(recivingItem);
        change(null, status: RxStatus.success());
      }
      recivings.sort((a, b) {
        return b.priority.compareTo(a.priority);
      });
    });
    print('events created');
  }

  //------------------------------
  //----------hub Start
  //------------------------------
  Future<bool> hubStart() async {
    try {
      if (SignalrServices.to.hubConnection.state !=
          HubConnectionState.Connected) {
        change(null, status: RxStatus.loading());
        await SignalrServices.to.hubConnection.start();
      } else {
        print("steel connectd");
        return false;
      }
      await hubEvents();
      print('connected.');
      change(null, status: RxStatus.empty());
      return true;
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      if (kDebugMode) {
        print('Error starting SignalR connection: $e');
      }
      return false;
    }
  }

  //------------------------------
  //----------  deliverring
  //------------------------------
  void deliverring(int orderId) {
    GeoService.to.getPositionStream((Position position) {
      print(position.toString());
      LatLng1 latLng1 = LatLng1(position.latitude, position.longitude);
      SignalrServices.to.updateLocation(orderId, latLng1.serialize());
    });
  }

  //------------------------------
  //----------  deliverring
  //------------------------------
  void atDestinationLocation(int odrderId, String odderCode) async {
    print("ualsti gel al");

    var prefs = await SharedPreferences.getInstance();
    prefs.remove('deliveryOrderId');
    await SignalrServices.to.finishDelivering(odrderId, odderCode);
    await SignalrServices.to.leaveGroupAsync(odrderId);
    Get.offNamed(AppRoutes.recivingsScreen);
  }

  //------------------------------
  //----------  Leave Group Async
  //------------------------------
  void stateChange(orderId, receivingCode) async {
    switch (destinationStatusInt.value) {
      case 3:
        destinationStatus.value = DeliveryState.accepted;
        break;
      case 4:
        destinationStatus.value = DeliveryState.atSourceLocation;
        break;
      case 5:
        destinationStatus.value = DeliveryState.deliverring;
        deliverring(orderId);
        break;
      case 6:
        Get.toNamed(AppRoutes.scanBarcodeScreenWidget,
            arguments: [orderId, receivingCode]);
        break;
      default:
        destinationStatus.value = DeliveryState.accepted;
        destinationStatusInt.value = 3;
        break;
    }
    if (destinationStatusInt.value <= 6) {
      await SignalrServices.to
          .updateDeliveryOrderStatus(orderId, destinationStatusInt.value);
      destinationStatusInt.value += 1;
    }
  }

  @override
  void onClose() async {
    try {
      await SignalrServices.to.hubConnection.stop();
      print('stoped');
    } catch (e) {
      print(e.toString());
    }
    print("onClose");
    super.onClose();
  }

  @override
  void dispose() async {
    await SignalrServices.to.hubConnection.stop();
    print("dispose");
    super.dispose();
  }
}
