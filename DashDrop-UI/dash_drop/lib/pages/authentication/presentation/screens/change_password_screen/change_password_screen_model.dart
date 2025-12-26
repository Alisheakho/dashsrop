import 'package:get/get.dart';

import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreenController extends GetxController {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isShowPassword1 = true.obs;
  Rx<bool> isShowPassword2 = true.obs;

  // Model for custom_appbar component.
// State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return AppLocalizations.of(context).getText(
        '1ff4uo27' /* Please enter a valid old passw... */,
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
        'we2n37jw' /* Please enter a valid new passw... */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return AppLocalizations.of(context).getText(
        'q6s4wvtc' /* Please enter a valid confirm p... */,
      );
    }

    return null;
  }

  // Model for custom_button component.

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
  }

  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
