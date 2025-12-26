import 'package:get/get_state_manager/src/simple/get_controllers.dart';


import 'package:flutter/material.dart';

class OnboardingPageController extends GetxController {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for custom_button component.


  /// Initialization and disposal methods.


  void initState(BuildContext context) {

  }

  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();

  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
