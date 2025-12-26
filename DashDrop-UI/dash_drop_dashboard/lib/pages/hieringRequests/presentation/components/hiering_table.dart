import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/entities/hiering.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/controller/hiering/hiering_bloc.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:flutter/material.dart';

import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dash_drop_dashboard/core/theme/global_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/tost.dart';

class HieringTableWidget extends StatelessWidget {
  const HieringTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HieringBloc, HieringState>(
      listener: (BuildContext context, HieringState state) {
        if (state.state == RequestState.loaded && state.nameState == NameState.delete) {
          Tost().success(context, "Delete Hiering completed successfully");
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

  Widget _buildWidget(BuildContext context, HieringState state) {
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
      DataColumn(label: Text(lang.firstName)),
      DataColumn(label: Text(lang.lastName)),
      DataColumn(label: Text(lang.email)),
      DataColumn(label: Text(lang.phoneNumber)),
      DataColumn(label: Text(lang.idNumber)),
      DataColumn(label: Text(lang.createdAt)),
      DataColumn(label: Text(lang.actions)),
    ];
  }

  List<DataCell> _buildDataCells(BuildContext context, Hiering e) {
    return [
      DataCell(Text("${e.id}")),
      DataCell(Text(e.firstName)),
      DataCell(Text(e.lastName)),
      DataCell(Text(e.email)),
      DataCell(Text(e.phoneNumber)),
      DataCell(Text(e.idNumber)),
      DataCell(Text(
          DateTime.parse(e.createdAt).toLocal().toString().substring(0, 19))),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () {
              context.read<HieringBloc>().add(GetHieringEvent(id: e.id));
              Navigator.pushNamed(context, "/hiering/update");
            },
            icon: Icon(Icons.edit, color: Colors.yellow[800]),
          ),
          IconButton(
            onPressed: () {
              context.read<HieringBloc>().add(DeleteHieringEvent(id: e.id));
            },
            icon: Icon(Icons.delete, color: Colors.red[900]),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/hiering/view", arguments: e.id);
            },
            icon: const Icon(Icons.question_mark,
                color: Color.fromARGB(255, 96, 199, 1)),
          ),
        ],
      )),
    ];
  }
}
