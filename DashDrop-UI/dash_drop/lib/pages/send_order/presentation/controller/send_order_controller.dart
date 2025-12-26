import 'package:dash_drop/core/utils/enums.dart';
import 'package:dash_drop/custom_widgets/loading_dialog.dart';
import 'package:dash_drop/custom_widgets/show_dialog.dart';
import 'package:dash_drop/pages/send_order/data/model/create_order_model.dart';

import 'package:dash_drop/pages/send_order/domain/usecase/create_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../components/copy_receiveing_code_dialog.dart';

class SendOrderController extends GetxController {
  final CreateOrderUseCase _createOrderUseCase;

  SendOrderController(
    this._createOrderUseCase,
  );

  Rx<CreateOrderModel> createOrderModel = CreateOrderModel(
          sourceLocation: '',
          sourceLocationDescription: 'Near Azaz, Sryia',
          vehicleDetailId: null,
          paymentResponsibility: false,
          vehicleDetailSearch: VehicleDetailSearch(
              heightM: 0,
              lenghtM: 0,
              widthM: 0,
              weightKg: 0,
              vehicleType: VehicleTypes.bicyle,
              sensitivityLevel: SensitivityLevels.low))
      .obs;

  RxString receivingCode = RxString('');
  static SendOrderController get to => Get.find<SendOrderController>();

  Future<void> createOrder() async {
    Get.dialog(const LoadingDialogWidget());
    refresh();
    final result = await _createOrderUseCase(
        CreateOrderParameters(createOrderModel: createOrderModel.value));
    result.fold(
      (error) {
        if (Get.isDialogOpen == true) Get.back();
        Get.snackbar('Error', error.message,
            colorText: const Color(0xFFF57625));
      },
      (data) {
        if (Get.isDialogOpen == true) Get.back();
        receivingCode.value = data;
        print(data);
        refresh();
        Get.back();
        if (Get.context != null) {
          ShowDialog(dialogWidget: CopyReceiveingCodeDialog());
        }
      },
    );
  }
}
