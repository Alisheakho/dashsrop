import 'package:dash_drop_dashboard/pages/landing/views/pricing_page/desktop_pricing.dart';
import 'package:dash_drop_dashboard/pages/landing/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';

import 'views/landing_page/desktop_landing/desktop_landing.dart';
import 'views/landing_page/mobile_landing.dart';
import 'views/landing_page/tablet_landing.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, required this.title});
  final String title;
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveLayout(
        mobile: LandingPageMobileView(),
        tablet: LandingTabletView(),
         desktop: LandingDesktopView(), 
      /*   desktop: PricingDesktopView(),  */
        //desktop: DeskTopHeader()
      ),
    );
  }
}
