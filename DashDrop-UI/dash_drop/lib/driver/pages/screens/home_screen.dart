import 'package:dash_drop/components/exit_dialog_widget.dart';
import 'package:dash_drop/driver/pages/widgets/home_page.dart';
import 'package:dash_drop/pages/profile_screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dash_drop/driver/controllers/home_page_controller.dart';
import 'package:dash_drop/driver/pages/widgets/custom_bottom_page.dart';

import '../order/presentation/screens/orders.dart';

class HomepageDriverScreen extends StatefulWidget {
  const HomepageDriverScreen({super.key});

  @override
  State<HomepageDriverScreen> createState() => _HomepageDriverScreenState();
}

class _HomepageDriverScreenState extends State<HomepageDriverScreen> {
  HomepageLongDriverController homepageLongDriverController =
      Get.put(HomepageLongDriverController());

  List<Widget> pages = [
    const HomeDriverPage(),
    const MyOrderDriverScreen(),
    const ProfilePageWidget(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (homepageLongDriverController.selectIndex.value == 0) {
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
                  onTap: () =>
                      homepageLongDriverController.unfocusNode.canRequestFocus
                          ? FocusScope.of(context).requestFocus(
                              homepageLongDriverController.unfocusNode)
                          : FocusScope.of(context).unfocus(),
                  child: const ExitDialogWidget(),
                ),
              );
            },
          ).then((value) => setState(() {}));
        } else {
          homepageLongDriverController.selectBottomMethod(0);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFEFEFE),
        body: SafeArea(
          child:
              Obx(() => pages[homepageLongDriverController.selectIndex.value]),
        ),
        bottomNavigationBar: const CustomBottomDriverBar(),
      ),
    );
  }
}
