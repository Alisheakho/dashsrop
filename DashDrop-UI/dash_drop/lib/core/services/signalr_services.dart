import 'dart:async';
import 'package:dash_drop/core/network/api_constances.dart';
import 'package:get/get.dart';
import 'package:lg_signalr_client/lg_signalr_client.dart';

class SignalrServices extends GetxService {
  late final HubConnection hubConnection;

  static SignalrServices get to => Get.find<SignalrServices>();

  Future<SignalrServices> init() async {
    var url = ApiConstances.sginlRUrl(await ApiConstances.getToken());
    //print(url);
    hubConnection = HubConnectionBuilder()
        .withUrl(url, transportType: HttpTransportType.WebSockets)
        .build();

    return this;
  }

  //------------------------------
  //----------Accept Delivery
  //------------------------------
  Future<bool> acceptDeliveryOfferAsync(int id) async {
    return await hubConnection.invoke('AcceptDeliveryOfferAsync', args: [id])
        as bool;
  }

  //------------------------------
  //----------Decline Delivery
  //------------------------------
  Future<void> declineDeliveryOfferAsync(int id) async {
    print(id);
    await hubConnection.invoke('DeclineDeliveryOfferAsync', args: [id]);
  }

  //------------------------------
  //----------Accept Delivery
  //------------------------------
  Future<void> joinToGroupAsync(int orderId) async {
    await hubConnection.invoke('JoinToGroupAsync', args: [orderId]);
  }

  //------------------------------
  //----------Update Location
  //------------------------------
  Future<void> updateLocation(int orderId, String newLocation) async {
    await hubConnection.invoke('UpdateLocation', args: [orderId, newLocation]);
  }

  //------------------------------
  //----------Update Delivery Order Status
  //------------------------------
  Future<void> updateDeliveryOrderStatus(int orderId, int newStatus) async {
    await hubConnection
        .invoke('UpdateDeliveryOrderStatus', args: [orderId, newStatus]);
  }

  //------------------------------
  //----------Finish Delivering
  //------------------------------
  Future<void> finishDelivering(int orderId, String recivingCode) async {
    await hubConnection
        .invoke('FinishDelivering', args: [orderId, recivingCode]);
  }

  //------------------------------
  //----------  Emergency Finish Delivering
  //------------------------------
  Future<void> emergencyFinishDelivering(int orderId) async {
    await hubConnection.invoke('EmergencyFinishDelivering', args: [orderId]);
  }

  //------------------------------
  //----------  Leave Group Async
  //------------------------------
  Future<void> leaveGroupAsync(int orderId) async {
    await hubConnection.invoke('LeaveGroupAsync', args: [orderId]);
  }

  Future<void> stopHub() async {
    try {
      await hubConnection.stop();
      print('stop connection');
    } catch (e) {
      print(e);
    }
  }
}
