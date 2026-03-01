import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/entities/hiering.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/controller/hiering/hiering_bloc.dart';
import 'package:dashdrop_uikit/components/buttons/button_widget.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/forms/outborder_text_form_field.dart';
import 'package:dashdrop_uikit/components/forms/select_widget.dart';
import 'package:dashdrop_uikit/core/theme/dashdrop_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/tost.dart';
import '../../../../flutter_gen/app_localizations.dart';

class UpdateHieringForm extends StatelessWidget {
  UpdateHieringForm({super.key, required this.hiering});

  final _formKey = GlobalKey<FormState>();
  final Hiering hiering;

  String? firstName;
  String? lastName;
  String? userID;
  String? phoneNumber;
  String? vehiclePlateNumber;
  String? idNumber;
  Gender? gender;
  int? jobOfferId;
  String? birthdate;
  //bool? isAccepted;

  ValueNotifier<String> dateNotifier = ValueNotifier("");

  bool isValidate = true;

  RegExp get _userIDRegex =>
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  RegExp get _phoneRegex => RegExp(r'^(\+90\d{10}|\+963\d{10}|\d{11})$');

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return CommonCard(
      child: _titleWidget(
          lang.info,
          Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              OutBorderTextFormField(
                initialValue: hiering.firstName,
                labelText: lang.firstName,
                hintText: lang.firstName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Tost().warning(context, "Please enter first name");
                    isValidate = false;
                    return;
                  }
                  return;
                },
                onSave: (value) {
                  firstName = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                  initialValue: hiering.lastName,
                  labelText: lang.lastName,
                  hintText: lang.lastName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      Tost().warning(context, "Please enter lastName");
                      isValidate = false;
                      return;
                    }
                    return;
                  },
                  onSave: (value) {
                    lastName = value;
                  }),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                initialValue: hiering.userID,
                labelText: lang.userID,
                hintText: lang.userID,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Tost().warning(context, "Please retype userID");
                    isValidate = false;
                    return;
                  }
                  if (!_userIDRegex.hasMatch(value)) {
                    Tost().warning(context, "userID address is not valid");
                    isValidate = false;
                    return;
                  }
                  return;
                },
                onSave: (value) {
                  userID = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                initialValue: hiering.phoneNumber,
                labelText: lang.phoneNumber,
                hintText: lang.phoneNumber,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Tost().warning(context, "Please enter phoneNumber");
                    isValidate = false;
                    return;
                  }
                  if (!_phoneRegex.hasMatch(value)) {
                    Tost()
                        .warning(context, "Please enter correct phone number");
                    isValidate = false;
                    return;
                  }
                  return;
                },
                onSave: (value) {
                  phoneNumber = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                initialValue: hiering.vehiclePlateNumber,
                labelText: lang.vehiclePlateNumber,
                hintText: lang.vehiclePlateNumber,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Tost().warning(
                        context, "Please enter the vehiclePlateNumber");
                    isValidate = false;
                    return;
                  }
                  return;
                },
                onSave: (value) {
                  vehiclePlateNumber = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                initialValue: hiering.idNumber,
                labelText: lang.idNumber,
                hintText: lang.idNumber,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Tost().warning(context, "Please enter the idNumber");
                    isValidate = false;
                    return;
                  }
                  return;
                },
                onSave: (value) {
                  idNumber = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  lang.gender,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 16,
                ),
                SelectWidget(
                  selectionList: Gender.values.map((e) => e.name).toList(),
                  onDropdownChanged: (value) {
                    gender = Gender.values
                        .map((e) {
                          if (e.name == value) {
                            return e;
                          }
                        })
                        .nonNulls
                        .first;
                    print(Gender.values
                        .map((e) {
                          if (e.name == value) {
                            return e;
                          }
                        })
                        .nonNulls
                        .first);
                  },
                ),
                Text(
                  lang.jobOffer,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocBuilder<HieringBloc, HieringState>(
                  builder: (context, state) {
                    return SelectWidget(
                      selectionList:
                          state.getSDatas.map((e) => e.id.toString()).toList(),
                      onDropdownChanged: (value) {
                        jobOfferId = int.tryParse(value);
                      },
                    );
                  },
                ),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lang.birthdate, style: const TextStyle(fontSize: 14)),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () async {
                        List<DateTime?>? results =
                            await showCalendarDatePicker2Dialog(
                          context: context,
                          config: CalendarDatePicker2WithActionButtonsConfig(),
                          dialogSize: const Size(325, 400),
                          borderRadius: BorderRadius.circular(15),
                        );

                        dateNotifier.value =
                            (results != null && results.isNotEmpty
                                ? (results
                                        .elementAt(0)
                                        ?.toLocal()
                                        .toString()
                                        .substring(0, 10) ??
                                    '')
                                : "");
                        birthdate = (results != null && results.isNotEmpty
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: DashDropColors.border,
                                        width: 1)),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Text(val),
                                    const Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.calendar_month),
                                    )
                                  ],
                                ));
                          }))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonWidget(
                btnText: lang.update,
                type: ButtonType.primary.type,
                onTap: () {
                  _UpdateNew(context);
                },
              )
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

  void _UpdateNew(BuildContext context) {
    _formKey.currentState?.validate();
    if (birthdate == "" || birthdate == null) {
      Tost().warning(context, "Please set birthdate");
      isValidate = false;
    }
    if (isValidate) {
      _formKey.currentState?.save();

      try {
        context.read<HieringBloc>().add(UpdateHieringEvent(
            id: hiering.id,
            firstName: firstName!,
            lastName: lastName!,
            userID: userID!,
            phoneNumber: phoneNumber!,
            gender: gender!,
            birthdate: birthdate!,
            vehiclePlateNumber: vehiclePlateNumber!,
            idNumber: idNumber!,
            isAccepted: false,
            jobOfferId: jobOfferId!));
      } catch (e) {
        Tost().error(context, '$e');
        //print(e);
      }
    }
  }
}
