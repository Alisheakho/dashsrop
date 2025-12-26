import 'package:get/get.dart';

import 'package:flutter/material.dart';

class EditProfileScreenController extends GetxController{
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for custom_appbar component.
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for custom_button component.

  /// Initialization and disposal methods.



  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
