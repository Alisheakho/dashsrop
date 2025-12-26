import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/custom_widgets/error_alirt.dart';
import 'package:dash_drop/custom_widgets/loading_dialog.dart';
import 'package:dash_drop/pages/receive_order/domain/entities/cost_info.dart';
import 'package:dash_drop/pages/receive_order/domain/entities/polyline_info.dart';
import 'package:dash_drop/pages/receive_order/domain/entities/sender_location.dart';
import 'package:dash_drop/pages/receive_order/domain/usecase/calc_cost.dart';
import 'package:dash_drop/pages/receive_order/domain/usecase/confirm_order.dart';
import 'package:dash_drop/pages/receive_order/domain/usecase/get_polyline.dart';
import 'package:dash_drop/pages/receive_order/domain/usecase/sender_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../components/cost_info_dialog.dart';
import '../components/receving_location_widget.dart';
import '../../../../custom_widgets/show_dialog.dart';

class ReceiveOrderController extends GetxController {
  final SenderLocationUseCase _senderLocationUseCase;
  final GetPolylineUseCase _getPolylineUseCase;
  final CalcCostUseCase _calcCostUseCase;
  final ConfirmOrderUseCase _confirmOrderUseCase;

  ReceiveOrderController(
    this._senderLocationUseCase,
    this._getPolylineUseCase,
    this._calcCostUseCase,
    this._confirmOrderUseCase,
  );

  Rx<SenderLocation> senderLocation = const SenderLocation(
          id: 0,
          sourceLocation: LatLng1(0, 0),
          sourceLocationDescription: '',
          receivingCode: '')
      .obs;
  Rx<CostInfo> costInfo = CostInfo(
          cost: 0, paymentResponsibility: 0, firstName: '', estimatedTime: '')
      .obs;

  RxString receiverAddress = RxString('Address of receiving');
  RxString overviewPolyline = RxString('');
  RxString destinationLocation = RxString('');
  RxInt pathLength = RxInt(0);

  static ReceiveOrderController get to => Get.find<ReceiveOrderController>();

  Future<void> receiveSenderLocation(String receivingCode) async {
    Get.dialog(const LoadingDialogWidget());
    final result = await _senderLocationUseCase(
        SenderLocationParameters(receivingCode: receivingCode));
    result.fold(
      (error) {
        if (Get.isDialogOpen == true) Get.back();
        ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(SnackBar(
          content: ErrorAlirt(message: error.message),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ));
      },
      (data) {
        if (Get.isDialogOpen == true) Get.back();
        senderLocation.value = data;
        refresh();
        print(data.sourceLocation);
        if (Get.context != null) {
          ShowDialog(dialogWidget: ReceivingLocationDialogWidget());
        }
      },
    );
  }

  Future<PolylineInfo?> getPolyline(
      {required LatLng1 origin, required LatLng1 destination}) async {
    PolylineInfo? polyline;
    final result = await _getPolylineUseCase(
        GetPolylineParameters(origin: origin, destination: destination));
    result.fold(
      (error) {
        Get.snackbar('Error', error.message,
            colorText: const Color(0xFFF57625));
      },
      (data) {
        polyline = data;
      },
    );
    return polyline;
  }

  Future<void> calcCost() async {
    Get.dialog(const LoadingDialogWidget());
    double pathLengthKm = pathLength.value / 1000;
    final result = await _calcCostUseCase(CalcCostParameters(
        receivingCode: senderLocation.value.receivingCode,
        pathLengthKm: pathLengthKm));
    result.fold(
      (error) {
        if (Get.isDialogOpen == true) Get.back();
        Get.snackbar('Error', error.message,
            colorText: const Color(0xFFF57625));
      },
      (data) {
        if (Get.isDialogOpen == true) Get.back();
        costInfo.value = data;
        refresh();
        if (Get.context != null) {
          ShowDialog(dialogWidget: CostInfoDialogWidget());
        }
      },
    );
  }

  Future<void> confirmOrder() async {
    Get.dialog(const LoadingDialogWidget());
    double pathLengthKm = pathLength / 1000;
    final result = await _confirmOrderUseCase(ConfirmOrderParameters(
        destinationLocation: destinationLocation.value,
        destinationAddress: receiverAddress.value,
        receivingCode: senderLocation.value.receivingCode,
        polyline: overviewPolyline.value,
        pathLengthKm: pathLengthKm));
    result.fold(
      (error) {
        if (Get.isDialogOpen == true) Get.back();
        Get.snackbar('Error', error.message,
            colorText: const Color(0xFFF57625));
      },
      (data) {
        if (Get.isDialogOpen == true) Get.back();
        Get.snackbar('Success', 'The Order is confirm',
            colorText: Colors.green);
      },
    );
  }
}
