import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:dashdrop_uikit/components/modal/modal_dialog.dart';
import 'package:flutter/material.dart';

import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dash_drop_dashboard/core/theme/global_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/tost.dart';
import '../../domain/entities/job_offer.dart';
import '../controller/job_offer_bloc.dart';

class JobOffersTableWidget extends StatelessWidget {
  const JobOffersTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobOfferBloc, JobOfferState>(
      listener: (BuildContext context, JobOfferState state) {
        if (state.deleteJobOfferState == RequestState.loaded) {
          Tost().success(context, "Delete Driver completed successfully");
        }
        if (state.deleteJobOfferState == RequestState.error) {
          Tost().error(context, state.deleteJobOfferMessage);
        }
      },
      buildWhen: (previous, current) =>
          previous.getJobOffersState != current.getJobOffersState ||
          current.deleteJobOfferState == RequestState.loaded,
      builder: (context, state) => _buildWidget(context, state),
    );
  }

  Widget _buildWidget(BuildContext context, JobOfferState state) {
    switch (state.getJobOffersState) {
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
                rows: state.getJobOffers.map((e) {
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
            child: Center(child: Text("${state.getJobOfferMessage}")));
    }
  }

  List<DataColumn> _buildTableColumns(BuildContext context) {
    return [
      DataColumn(label: Text(AppLocalizations.of(context)!.id)),
      DataColumn(label: Text(AppLocalizations.of(context)!.description)),
      DataColumn(
          label: Text(AppLocalizations.of(context)!.requestDeadlineDate)),
      DataColumn(label: Text(AppLocalizations.of(context)!.employee)),
      DataColumn(label: Text(AppLocalizations.of(context)!.vehicleDetail)),
      DataColumn(label: Text(AppLocalizations.of(context)!.regions)),
      DataColumn(label: Text(AppLocalizations.of(context)!.createdAt)),
      DataColumn(label: Text(AppLocalizations.of(context)!.lastUpdatedAt)),
      DataColumn(label: Text(AppLocalizations.of(context)!.actions)),
    ];
  }

  List<DataCell> _buildDataCells(BuildContext context, JobOffer e) {
    return [
      DataCell(Text("${e.id}")),
      DataCell(InkWell(
        onTap: () {
          _showDescription(context, e.description);
        },
        child: Container(
          width: 200,
          child: Text(
            e.description,
            style: TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ),
      )),
      DataCell(Text(DateTime.parse(e.requestDeadlineDate)
          .toLocal()
          .toString()
          .substring(0, 11))),
      DataCell(Text("${e.employeeId}")),
      DataCell(Text("${e.vehicleDetailId}")),
      DataCell(Text("${e.regionId}")),
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
              context.read<JobOfferBloc>().add(GetJobOfferEvent(id: e.id));
              Navigator.pushNamed(context, "/JobOffers/update");
            },
            icon: Icon(Icons.edit, color: Colors.yellow[800]),
          ),
          IconButton(
            onPressed: () {
              context.read<JobOfferBloc>().add(DeleteJobOfferEvent(id: e.id));
            },
            icon: Icon(Icons.delete, color: Colors.red[900]),
          ),
        ],
      )),
    ];
  }

  _showDescription(BuildContext context, String text) {
    ModalDialog.show(
        context: context,
        title: AppLocalizations.of(context)!.description,
        showFooter: false,
        modalType: ModalType.large,
        showTitleDivider: true,
        child: Text(text));
  }
}
