import 'package:get/get.dart';

import 'package:flutter/material.dart';

class NearbyDropBottomSheetController extends GetxController{


  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;


  @override

  void dispose() {
    super.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
