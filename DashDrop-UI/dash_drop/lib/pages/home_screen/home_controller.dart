import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePageController extends GetxController {

  final unfocusNode = FocusNode();

  // track text field
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;


  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void onClose() {
    super.onClose();
    unfocusNode.dispose();

    textFieldFocusNode?.dispose();
    textController?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}