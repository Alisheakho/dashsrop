import 'package:get/get.dart';

import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreenController extends GetxController {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isShowPassword1 = true.obs;
  // Model for custom_appbar component.
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return AppLocalizations.of(context).getText(
        'utqobgt1' /* Please enter a valid new passw... */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return AppLocalizations.of(context).getText(
        'f98zsah1' /* Please enter a valid confirm p... */,
      );
    }

    return null;
  }

  // Model for custom_button component.

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

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
