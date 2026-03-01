import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dashdrop_uikit/components/buttons/button_widget.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/forms/outborder_text_form_field.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:dashdrop_uikit/core/theme/dashdrop_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/tost.dart';
import '../../../../flutter_gen/app_localizations.dart';
import '../../domain/entities/job_offer.dart';
import '../controller/job_offer_bloc.dart';

class UpdateJobOfferForm extends StatelessWidget {
  UpdateJobOfferForm({super.key});

  final _formKey = GlobalKey<FormState>();
  ValueNotifier<String> dateNotifier = ValueNotifier("");

  String? description;
  String? requestDeadlineDate;
  String? vehicleDetailId;
  String? regionId;

  bool isValidate = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobOfferBloc, JobOfferState>(
        listener: (context, state) {
          if (state.updateJobOfferState == RequestState.loaded) {
            Tost().success(context, "Update JobOffer success");
            Navigator.popAndPushNamed(context, '/jobOffers');
          } else if (state.updateJobOfferState == RequestState.error) {
            Tost().error(context, state.updateJobOfferMessage);
            if (state.updateJobOfferErrors != null) {
              state.updateJobOfferErrors?.forEach(
                  (name, info) => Tost().warning(context, "$name : $info"));
            }
          }
        },
        buildWhen: (previous, current) => current.getJobOfferState != previous.getJobOfferState,
        builder: (context, state) => _buildWidgt(context, state));
  }

  _buildWidgt(BuildContext context, JobOfferState state) {
    JobOffer jobOffer = state.getJobOffer;

    if (state.getJobOfferState == RequestState.loading) {
      return const Center(
          child: CommonCard(
        height: 300,
        child: LoadingWidget(),
      ));
    }
    return CommonCard(
      child: _titleWidget(
          AppLocalizations.of(context)!.info,
          Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              OutBorderTextFormField(
                initialValue: jobOffer.description,
                labelText: AppLocalizations.of(context)!.description,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Tost().warning(context, "Please enter first name");
                    isValidate = false;
                  }
                  return;
                },
                onSave: (value) => description = value,
              ),
              const SizedBox(
                width: 16,
              ),
              _buildrequestDeadlineDateSelector(context, jobOffer),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                initialValue: jobOffer.vehicleDetailId.toString(),
                labelText: AppLocalizations.of(context)!.vehicleDetail,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Tost().warning(context, "Please enter vehicleDetailId");
                    isValidate = false;
                    return;
                  }
                  return;
                },
                onSave: (value) => vehicleDetailId = value,
              ),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                initialValue: jobOffer.regionId.toString(),
                labelText: AppLocalizations.of(context)!.regions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Tost().warning(context, "Please enter regionId");
                    isValidate = false;
                    return;
                  }
                  return;
                },
                onSave: (value) => regionId = value,
              ),
              const SizedBox(
                height: 12,
              ),
              _updateButton(context, jobOffer)
            ]),
          )),
    );
  }

  _titleWidget(String title, Widget childWidget) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 50,
        padding: const EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
      const Divider(
        height: 1,
      ),
      Padding(padding: const EdgeInsets.all(16), child: childWidget)
    ]);
  }

  Widget _buildrequestDeadlineDateSelector(
      BuildContext context, JobOffer jobOffer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.requestDeadlineDate,
            style: const TextStyle(fontSize: 14)),
        const SizedBox(
          height: 10,
        ),
        InkWell(
            onTap: () async {
              List<DateTime?>? results = await showCalendarDatePicker2Dialog(
                context: context,
                config: CalendarDatePicker2WithActionButtonsConfig(),
                dialogSize: const Size(325, 400),
                borderRadius: BorderRadius.circular(15),
              );
              dateNotifier.value = (results != null && results.isNotEmpty
                  ? (results
                          .elementAt(0)
                          ?.toLocal()
                          .toString()
                          .substring(0, 10) ??
                      '')
                  : "");
              requestDeadlineDate = (results != null && results.isNotEmpty
                  ? (results
                          .elementAt(0)
                          ?.toLocal()
                          .toString()
                          .substring(0, 10) ??
                      '')
                  : "");
            },
            child: ValueListenableBuilder(
                valueListenable: dateNotifier,
                builder: (c, val, child) {
                  return Container(
                      alignment: Alignment.centerLeft,
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: DashDropColors.border, width: 1)),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          dateNotifier.value == ""
                              ? Text(jobOffer.requestDeadlineDate)
                              : Text(val),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.calendar_month),
                          )
                        ],
                      ));
                }))
      ],
    );
  }

  Widget _updateButton(BuildContext context, JobOffer jobOffer) {
    return ButtonWidget(
      btnText: AppLocalizations.of(context)!.update,
      type: ButtonType.primary.type,
      onTap: () {
        isValidate = true;
        _formKey.currentState?.validate();

        if (isValidate) {
          _formKey.currentState?.save();
          try {
            context.read<JobOfferBloc>().add(UpdateJobOfferEvent(
                  id: jobOffer.id,
                  description: description ?? jobOffer.description,
                  requestDeadlineDate: requestDeadlineDate ??
                      jobOffer.requestDeadlineDate,
                  vehicleDetailId: int.tryParse(vehicleDetailId!) ??
                      jobOffer.vehicleDetailId,
                  regionId: int.tryParse(regionId!) ?? jobOffer.regionId,
                ));
          } catch (e) {
            Tost().error(context, e.toString());
            print(e);
          }
        }
      },
    );
  }
}
