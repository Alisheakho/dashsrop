import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/create_employee_form.dart';
import '../../../../core/services/services_locator.dart';
import '../controller/employee_bloc.dart';

class CreateEmployeePage extends LayoutWidget {
  const CreateEmployeePage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    return "${AppLocalizations.of(context)!.create} ${AppLocalizations.of(context)!.employee}";
  }

  @override
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<EmployeeBloc>(),
      child: CreateEmployeeForm(),
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<EmployeeBloc>(),
      child: CreateEmployeeForm(),
    );
  }
}
