import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:dash_drop_dashboard/pages/employees/presentation/controller/employee_bloc.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:flutter/material.dart';

import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dash_drop_dashboard/core/theme/global_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/tost.dart';
import '../../domain/entities/employee.dart';

class EmployeesTableWidget extends StatelessWidget {
  const EmployeesTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeBloc, EmployeeState>(
      listener: (BuildContext context, EmployeeState state) {
        if (state.deleteEmployeeState == RequestState.loaded) {
          Tost().success(context, "Delete employee completed successfully");
        }
        if (state.deleteEmployeeState == RequestState.error) {
          Tost().error(context, state.deleteEmployeeMessage);
        }
      },
      buildWhen: (previous, current) =>
          previous.getEmployeesState != current.getEmployeesState ||
          current.deleteEmployeeState == RequestState.loaded,
      builder: (context, state) => _buildWidget(context, state),
    );
  }

  Widget _buildWidget(BuildContext context, EmployeeState state) {
    switch (state.getEmployeesState) {
      case RequestState.loaded:
        return CommonCard(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 1000),
              child: DataTable(
                headingRowColor: WidgetStateProperty.resolveWith(
                    (states) => GlobalColors.lightGray),
                horizontalMargin: 8,
                showBottomBorder: true,
                showCheckboxColumn: false,
                headingTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                dividerThickness: 0.5,
                columns: _buildTableColumns(context),
                rows: state.getEmployees.map((e) {
                  return DataRow(
                    onSelectChanged: (selected) {},
                    cells: _buildDataCells(context, e),
                  );
                }).toList(),
              ),
            ),
          ),
        );

      case RequestState.loading:
        return const CommonCard(
            height: 300, child: Center(child: LoadingWidget()));

      case RequestState.error:
        return CommonCard(
            height: 300,
            child: Center(child: Text("${state.getEmployeeMessage}")));
    }
  }

  List<DataColumn> _buildTableColumns(BuildContext context) {
    return [
      DataColumn(label: Text(AppLocalizations.of(context)!.id)),
      DataColumn(label: Text(AppLocalizations.of(context)!.firstName)),
      DataColumn(label: Text(AppLocalizations.of(context)!.lastName)),
      DataColumn(label: Text(AppLocalizations.of(context)!.userID)),
      DataColumn(label: Text(AppLocalizations.of(context)!.phoneNumber)),
      DataColumn(label: Text(AppLocalizations.of(context)!.title)),
      DataColumn(label: Text(AppLocalizations.of(context)!.gender)),
      DataColumn(label: Text(AppLocalizations.of(context)!.birthdate)),
      DataColumn(label: Text(AppLocalizations.of(context)!.createdAt)),
      DataColumn(label: Text(AppLocalizations.of(context)!.lastUpdatedAt)),
      DataColumn(label: Text(AppLocalizations.of(context)!.actions)),
    ];
  }

  List<DataCell> _buildDataCells(BuildContext context, Employee e) {
    return [
      DataCell(Text("${e.id}")),
      DataCell(Text(e.firstName)),
      DataCell(Text(e.lastName)),
      DataCell(Text(e.userID)),
      DataCell(Text(e.phoneNumber)),
      DataCell(Text(e.title)),
      DataCell(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            color: e.gender == Gender.male
                ? Colors.green.shade50
                : Colors.pink.shade50,
          ),
          child: Text(
            e.gender.name,
            style: TextStyle(
              color: e.gender == Gender.male ? Colors.green : Colors.red,
              fontSize: 13,
            ),
          ),
        ),
      ),
      DataCell(Text(e.birthdate)),
      DataCell(Text(
          DateTime.parse(e.createdAt).toLocal().toString().substring(0, 19))),
      DataCell(Text(DateTime.parse(e.lastUpdatedAt)
          .toLocal()
          .toString()
          .substring(0, 19))),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () {
              context.read<EmployeeBloc>().add(GetEmployeeEvent(id: e.id));
              Navigator.pushNamed(context, "/employees/update");
            },
            icon: Icon(Icons.edit, color: Colors.yellow[800]),
          ),
          IconButton(
            onPressed: () {
              context.read<EmployeeBloc>().add(DeleteEmployeeEvent(id: e.id));
            },
            icon: Icon(Icons.delete, color: Colors.red[900]),
          ),
        ],
      )),
    ];
  }
}
