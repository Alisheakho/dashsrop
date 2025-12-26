import 'package:dash_drop/driver/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/internationalization.dart';

class CustomBottomDriverBar extends StatefulWidget {
  const CustomBottomDriverBar({super.key});

  @override
  State<CustomBottomDriverBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomDriverBar> {
  HomepageLongDriverController homepageLongContainerController =
      Get.put(HomepageLongDriverController());

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: 'assets/images/home.svg',
      activeIcon: 'assets/images/home_fill.svg',
    ),
    BottomMenuModel(
      icon: 'assets/images/My_Order.svg',
      activeIcon: 'assets/images/My_Order_fill.svg',
    ),
    BottomMenuModel(
      icon: 'assets/images/Profile.svg',
      activeIcon: 'assets/images/Profile_fill.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        // height: 91.0,
        decoration: BoxDecoration(
          color: CustomTheme.of(context).backgroundColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 12.0,
              color: Color(0x0A000000),
              offset: Offset(0.0, -2.0),
            )
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: homepageLongContainerController.selectIndex.value,
          onTap: (value) {
            homepageLongContainerController.selectIndex.value = value;
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: CustomTheme.of(context).primaryTextColor,
          unselectedLabelStyle: const TextStyle(
            color: Color(0xFf696969),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'SF Pro Text',
          ),
          selectedLabelStyle: const TextStyle(
            color: Color(0xFF030401),
            fontSize: 14,
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: homepageLongContainerController.selectIndex.value == 0
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 11),
                      child: SvgPicture.asset(
                        bottomMenuList[0].activeIcon,
                        height: 40,
                        width: 40,
                        //color: appTheme.gray800,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 11),
                      child: SvgPicture.asset(
                        bottomMenuList[0].icon,
                        height: 24,
                        width: 24,
                        //color: appTheme.gray800,
                      ),
                    ),
              label: AppLocalizations.of(context).getText(
                'j3z4fge7' /* Home */,
              ),
            ),
            BottomNavigationBarItem(
              icon: homepageLongContainerController.selectIndex.value == 1
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 11),
                      child: SvgPicture.asset(
                        bottomMenuList[1].activeIcon,
                        height: 40,
                        width: 40,
                        //color: appTheme.gray800,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 11),
                      child: SvgPicture.asset(
                        bottomMenuList[1].icon,
                        height: 24,
                        width: 24,
                        //color: appTheme.gray800,
                      ),
                    ),
              label: AppLocalizations.of(context).getText(
                'hz9rd07c' /* My Order */,
              ),
            ),
            BottomNavigationBarItem(
              icon: homepageLongContainerController.selectIndex.value == 2
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 11),
                      child: SvgPicture.asset(
                        bottomMenuList[2].activeIcon,
                        height: 40,
                        width: 40,
                        //color: appTheme.gray800,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 11),
                      child: SvgPicture.asset(
                        bottomMenuList[2].icon,
                        height: 24,
                        width: 24,
                        //color: appTheme.gray800,
                      ),
                    ),
              label: AppLocalizations.of(context).getText(
                'fgcbppf6' /* Profile */,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
  });

  String icon;

  String activeIcon;
}
