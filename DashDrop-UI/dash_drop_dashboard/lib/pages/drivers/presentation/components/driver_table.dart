import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/drivers.dart';
import 'package:dash_drop_dashboard/pages/drivers/presentation/controller/driver/driver_bloc.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:flutter/material.dart';

import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dash_drop_dashboard/core/theme/global_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/tost.dart';

class DriversTableWidget extends StatelessWidget {
  const DriversTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverBloc, DriverState>(
      listener: (BuildContext context, DriverState state) {
        if (state.deleteDriverstate == RequestState.loaded) {
          Tost().success(context, "Delete Driver completed successfully");
        }
        if (state.deleteDriverstate == RequestState.error) {
          Tost().error(context, state.deleteDriversMessage);
        }
      },
      buildWhen: (previous, current) =>
          previous.getDriversState != current.getDriversState ||
          current.deleteDriverstate == RequestState.loaded,
      builder: (context, state) => _buildWidget(context, state),
    );
  }

  Widget _buildWidget(BuildContext context, DriverState state) {
    switch (state.getDriversState) {
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
                rows: state.getDrivers.map((e) {
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
            height: 300, child: Center(child: Text(state.getDriverMessage)));
    }
  }

  List<DataColumn> _buildTableColumns(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return [
      DataColumn(label: Text(lang.id)),
      DataColumn(label: Text("${lang.firstName} ${lang.lastName}")),
      DataColumn(label: Text(lang.userID)),
      DataColumn(label: Text(lang.phoneNumber)),
      DataColumn(label: Text(lang.vehiclePlateNumber)),
      DataColumn(label: Text(lang.gender)),
      DataColumn(label: Text(lang.birthdate)),
      DataColumn(label: Text(lang.createdAt)),
      DataColumn(label: Text(lang.actions)),
    ];
  }

  List<DataCell> _buildDataCells(BuildContext context, Drivers e) {
    return [
      DataCell(Text("${e.id}")),
      DataCell(Text("${e.firstName} ${e.lastName}")),
      DataCell(Text(e.userID)),
      DataCell(Text(e.phoneNumber)),
      DataCell(Text(e.vehiclePlateNumber)),
      DataCell(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            color: e.gender == 0 ? Colors.green.shade50 : Colors.pink.shade50,
          ),
          child: Text(
            e.gender == 0 ? "Male" : "Female",
            style: TextStyle(
              color: e.gender == 0 ? Colors.blue : Colors.red,
              fontSize: 13,
            ),
          ),
        ),
      ),
      DataCell(Text(e.birthdate)),
      DataCell(Text(
          DateTime.parse(e.createdAt).toLocal().toString().substring(0, 19))),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () {
              context.read<DriverBloc>().add(GetDriverEvent(id: e.id));
              Navigator.pushNamed(context, "/drivers/update");
            },
            icon: Icon(Icons.edit, color: Colors.yellow[800]),
          ),
          IconButton(
            onPressed: () {
              context.read<DriverBloc>().add(DeleteDriverEvent(id: e.id));
            },
            icon: Icon(Icons.delete, color: Colors.red[900]),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/drivers/view", arguments: e.id);
            },
            icon: const Icon(Icons.question_mark,
                color: Color.fromARGB(255, 96, 199, 1)),
          ),
        ],
      )),
    ];
  }
}
