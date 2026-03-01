import 'package:dashdrop_uikit/components/buttons/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/employee_bloc.dart';
import '../components/employee_table.dart';

class EmployeesPage extends LayoutWidget {
  const EmployeesPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.employees;
  }

  @override
  // TODO: implement isContentScroll
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    context.read<EmployeeBloc>().add(GetEmployeesEvent());
    return Column(children: [
      SizedBox(
          height: 50,
          width: double.maxFinite,
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Builder(
                builder: (crateEmpContext) {
                  return SizedBox(
                    width: 200,
                    child: ButtonWidget(
                      btnText: 'Add New Employee',
                      color: Colors.white,
                      borderRadius: 5,
                      borderColor: Theme.of(context).colorScheme.primary,
                      textColor: Theme.of(context).colorScheme.primary,
                      onTap: () {
                        Navigator.of(crateEmpContext).pushNamed("/employees/create");
                      },
                    ),
                  );
                }
              ),
            ],
          )),
      const SizedBox(
        height: 16,
      ),
      EmployeesTableWidget()
    ]);
  }
}
