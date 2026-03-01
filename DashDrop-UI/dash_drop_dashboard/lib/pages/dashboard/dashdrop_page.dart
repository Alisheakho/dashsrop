import 'package:flutter/material.dart';

import 'package:dash_drop_dashboard/pages/dashboard/grid_card.dart';
import 'package:dash_drop_dashboard/pages/dashboard/revenue_widget.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';

class DashDropPage extends LayoutWidget {
  const DashDropPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'DashDrop';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return const Column(children: [
      GridCard(),
      SizedBox(
        height: 16,
      ),
      RevenueWidget(),
    ]);
  }
}
