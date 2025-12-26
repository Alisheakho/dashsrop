
import 'package:get/get.dart';

import 'package:flutter/material.dart';


class SplashscreenController extends GetxController {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

