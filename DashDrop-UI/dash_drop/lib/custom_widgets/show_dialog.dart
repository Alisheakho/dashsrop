import 'package:dash_drop/pages/send_order/presentation/controller/send_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home_screen/home_controller.dart';

class ShowDialog {
  HomePageController controller = Get.find<HomePageController>();

  final Widget dialogWidget;
  ShowDialog({required this.dialogWidget}) {
    _show(Get.context!);
  }

  void _show(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: const AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: GestureDetector(
            onTap: () => controller.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(controller.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: SizedBox(
              height: 500.0,
              child: dialogWidget,
            ),
          ),
        );
      },
    );
  }
}
