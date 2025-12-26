import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final unfocusNode = FocusNode();

  // Model for dialog_button component.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 3));

  @override
  void onClose() {
    super.onClose();
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();
  }
}
