import 'package:dash_drop/pages/send_order/presentation/controller/location_dialog_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class OrderDetailScreenController extends GetxController {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for custom_appbar component.
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;

  String? validate(String? val) {
    if (val == null || val == '' || !GetUtils.isNum(val)) {
      return 'valid value';
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    Get.delete<SendingLocationController>();
  }

  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
