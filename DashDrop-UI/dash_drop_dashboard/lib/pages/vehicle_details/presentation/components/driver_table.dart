import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/entities/vehicle.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/controller/vehicle/vehicle_bloc.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:flutter/material.dart';

import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dash_drop_dashboard/core/theme/global_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/tost.dart';

class VehicleTableWidget extends StatelessWidget {
  const VehicleTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehicleBloc, VehicleState>(
      listener: (BuildContext context, VehicleState state) {
        if (state.state == RequestState.loaded && state.nameState == NameState.delete) {
          Tost().success(context, "Delete Vehicle completed successfully");
        }
        if (state.state == RequestState.error) {
          Tost().error(context, state.message);
        }
      },
      buildWhen: (previous, current) {
        //print("${previous.nameState} - ${current.nameState}");
        return current.nameState == NameState.get;
      },
      listenWhen: (previous, current) => current.nameState == NameState.get,
      builder: (context, state) => _buildWidget(context, state),
    );
  }

  Widget _buildWidget(BuildContext context, VehicleState state) {
    switch (state.state) {
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
                rows: state.getDatas.map((e) {
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
            height: 300, child: Center(child: Text(state.message)));
    }
  }

  List<DataColumn> _buildTableColumns(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return [
      DataColumn(label: Text(lang.id)),
      DataColumn(label: Text(lang.vehicleType)),
      DataColumn(label: Text(lang.sensitivityLevel)),
      DataColumn(label: Text(lang.profitPerKm)),
      DataColumn(label: Text(lang.avgSpeedKm)),
      DataColumn(label: Text(lang.specifications)),
      DataColumn(label: Text(lang.createdAt)),
      DataColumn(label: Text(lang.actions)),
    ];
  }

  List<DataCell> _buildDataCells(BuildContext context, Vehicle e) {
    return [
      DataCell(Text("${e.id}")),
      DataCell(Text(e.type.name)),
      DataCell(Text(e.sensitivityLevel.name)),
      DataCell(Text("${e.costPerKm}")),
      DataCell(Text("${e.avgSpeedKm}")),
      DataCell(Text(e.specifications)),
      DataCell(Text(
          DateTime.parse(e.createdAt).toLocal().toString().substring(0, 19))),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () {
              context.read<VehicleBloc>().add(GetVehicleEvent(id: e.id));
              Navigator.pushNamed(context, "/vehicle/update");
            },
            icon: Icon(Icons.edit, color: Colors.yellow[800]),
          ),
          IconButton(
            onPressed: () {
              context.read<VehicleBloc>().add(DeleteVehicleEvent(id: e.id));
            },
            icon: Icon(Icons.delete, color: Colors.red[900]),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/vehicle/view", arguments: e.id);
            },
            icon: const Icon(Icons.question_mark,
                color: Color.fromARGB(255, 96, 199, 1)),
          ),
        ],
      )),
    ];
  }
}
