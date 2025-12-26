import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:dash_drop_dashboard/pages/customers/presentation/controller/customer_bloc.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:flutter/material.dart';

import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dash_drop_dashboard/core/theme/global_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/tost.dart';
import '../../domain/entities/customer.dart';

class CustomersTableWidget extends StatelessWidget {
  const CustomersTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerBloc, CustomerState>(
      listener: (BuildContext context, CustomerState state) {
        if (state.deleteCustomerState == RequestState.loaded) {
          Tost().success(context, "Delete Customer completed successfully");
        }
        if (state.deleteCustomerState == RequestState.error) {
          Tost().error(context, state.deleteCustomerMessage);
        }
      },
      buildWhen: (previous, current) =>
          previous.getCustomersState != current.getCustomersState ||
          current.deleteCustomerState == RequestState.loaded,
      builder: (context, state) {
        return _buildWidget(context, state);
      },
    );
  }

  Widget _buildWidget(BuildContext context, CustomerState state) {
    switch (state.getCustomersState) {
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
                rows: state.getCustomers.map((e) {
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
            child: Center(child: Text("${state.getCustomersMessage}")));
    }
  }

  List<DataColumn> _buildTableColumns(BuildContext context) {
    return [
      DataColumn(label: Text(AppLocalizations.of(context)!.id)),
      DataColumn(label: Text(AppLocalizations.of(context)!.firstName)),
      DataColumn(label: Text(AppLocalizations.of(context)!.lastName)),
      DataColumn(label: Text(AppLocalizations.of(context)!.email)),
      DataColumn(label: Text(AppLocalizations.of(context)!.phoneNumber)),
      DataColumn(label: Text(AppLocalizations.of(context)!.gender)),
      DataColumn(label: Text(AppLocalizations.of(context)!.birthdate)),
      DataColumn(label: Text(AppLocalizations.of(context)!.createdAt)),
      DataColumn(label: Text(AppLocalizations.of(context)!.lastUpdatedAt)),
      DataColumn(label: Text(AppLocalizations.of(context)!.actions)),
    ];
  }

  List<DataCell> _buildDataCells(BuildContext context, Customer e) {
    return [
      DataCell(Text("${e.id}")),
      DataCell(Text(e.firstName)),
      DataCell(Text(e.lastName)),
      DataCell(Text(e.email)),
      DataCell(Text(e.phoneNumber)),
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
              context.read<CustomerBloc>().add(DeleteCustomerEvent(id: e.id));
            },
            icon: Icon(Icons.delete, color: Colors.red[900]),
          ),
        ],
      )),
    ];
  }
}
