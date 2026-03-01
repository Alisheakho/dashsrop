import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';

import '../components/update_employee_form.dart';

class UpdateEmployeePage extends LayoutWidget {
  const UpdateEmployeePage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    return "${AppLocalizations.of(context)!.update} ${AppLocalizations.of(context)!.employee}";
  }

  @override
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return UpdateEmployeeForm();
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return UpdateEmployeeForm();
  }
}
