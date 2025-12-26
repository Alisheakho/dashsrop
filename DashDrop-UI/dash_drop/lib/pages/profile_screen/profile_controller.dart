

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProfilePageController extends GetxController {
  final unfocusNode = FocusNode();

  @override
  void onClose() {
    super.onClose();
    unfocusNode.dispose();
  }
}