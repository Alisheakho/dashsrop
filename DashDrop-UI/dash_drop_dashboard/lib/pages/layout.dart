import 'package:dashdrop_uikit/components/toolbar/toolbar.dart';
import 'package:dashdrop_uikit/service/localization_provider.dart';
import 'package:dashdrop_uikit/widget/dashdrop_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/presentation/controller/auth_bloc.dart';

abstract class LayoutWidget extends DashDropLayoutWidget {
  const LayoutWidget({super.key});

  @override
  String sideBarAsset(BuildContext context) {
    return 'assets/routes/menu_route_${context.watch<LocalizationProvider>().languageCode}.json';
  }

  @override
  Widget? toolbarWidget(BuildContext context, bool showDrawer) {
    return ToolBarWidget(
      showMore: showDrawer,
      showChangeTheme: true,
      userInfoWidget: _userInfoWidget(context),
      onLogoutClick: () {
        context.read<AuthBloc>().add(LogoutEvent());
        Navigator.of(context).popAndPushNamed('/login');
      },
    );
  }

  Widget _userInfoWidget(BuildContext context) {
    return const Row(
      children: [
        Column(
          children: [
            Text('Hadi'),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/icon/Untitled.png'),
          radius: 22,
        )
      ],
    );
  }
}
