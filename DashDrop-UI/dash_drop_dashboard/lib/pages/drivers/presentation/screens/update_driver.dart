import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import '../components/update_driver_form.dart';

class UpdateDriverPage extends LayoutWidget {
  const UpdateDriverPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
     final lang = AppLocalizations.of(context)!;
    return "${lang.update} ${lang.drivers}";
  }

  @override
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: UpdateDriverForm()),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return UpdateDriverForm();
  }
}
