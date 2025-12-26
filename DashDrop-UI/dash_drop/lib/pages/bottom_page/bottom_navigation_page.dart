import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:dash_drop/components/exit_dialog_widget.dart';
import 'package:dash_drop/pages/bottom_page/bottom_page_controller.dart';
import 'package:dash_drop/pages/bottom_page/custom_bottom_page.dart';
import 'package:dash_drop/pages/home_screen/home_page.dart';
import 'package:dash_drop/pages/order/presentation/screens/orders.dart';
import 'package:dash_drop/pages/profile_screen/profile_page.dart';

class HomepageContainerScreen extends StatefulWidget {
  const HomepageContainerScreen({super.key});

  @override
  State<HomepageContainerScreen> createState() =>
      _HomepageContainerScreenState();
}

class _HomepageContainerScreenState extends State<HomepageContainerScreen> {
  HomepageLongContainerController homepageLongContainerController =
      Get.put(HomepageLongContainerController());
  List<Widget> pages = [
    const HomePage(),
    const MyOrderScreen(),
    const ProfilePageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (homepageLongContainerController.selectIndex.value == 0) {
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
                  onTap: () => homepageLongContainerController
                          .unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(
                          homepageLongContainerController.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: const ExitDialogWidget(),
                ),
              );
            },
          ).then((value) => setState(() {}));
        } else {
          homepageLongContainerController.selectBottomMethod(0);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFEFEFE),
        body: SafeArea(
          child: Obx(
              () => pages[homepageLongContainerController.selectIndex.value]),
        ),
        bottomNavigationBar: const CustomBottomBar(),
      ),
    );
  }
}
