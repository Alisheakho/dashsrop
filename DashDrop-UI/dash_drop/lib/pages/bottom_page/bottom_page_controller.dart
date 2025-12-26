


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageLongContainerController extends GetxController {

  final unfocusNode = FocusNode();

  RxInt selectIndex = 0.obs;

  void selectBottomMethod( int value){
    selectIndex.value = value;
    update();
  }

}
