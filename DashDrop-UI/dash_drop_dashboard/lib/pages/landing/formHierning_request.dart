import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
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

class CreateHierningForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  int jobOfferId;
  CreateHierningForm({required this.jobOfferId});
  String? firstName;
  String? lastName;
  String? userID;
  String? vehiclePlateNumber;
  String? phoneNumber;
  Gender gender = Gender.male;
  String idNumber = '';
  String? birthdate;
  ValueNotifier<String> dateNotifier = ValueNotifier("");

  bool isValidate = true;

  RegExp get _userIDRegex =>
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  RegExp get _phoneRegex => RegExp(r'^(\+90\d{10}|\+963\d{10}|\d{11})$');

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HieringBloc, HieringState>(
      buildWhen: (previous, current) =>
          previous.createHierningState != current.createHierningState,
      listener: (context, state) {
        if (state == RequestState.loaded) {
          Tost().success(context, "create employee success");
          Navigator.popAndPushNamed(context, '/employees');
        } else if (state.createHierningState == RequestState.error) {
          Tost().error(context, state.createHierningMessage);
          if (state.createHierningErrors != null) {
            state.createHierningErrors?.forEach(
                (name, info) => Tost().warning(context, "$name : $info"));
          }
        }
      },
      builder: (BuildContext context, HieringState state) => CommonCard(
        child: _titleWidget(
            AppLocalizations.of(context)!.info,
            Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: OutBorderTextFormField(
                          focusColor: Color(0xFF885AF8),
                          labelText: AppLocalizations.of(context)!.firstName,
                          hintText: AppLocalizations.of(context)!.firstNameHint,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              Tost()
                                  .warning(context, "Please enter first name");
                              isValidate = false;
                            }
                            return;
                          },
                          onSave: (value) {
                            firstName = value;
                          },
                        )),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: OutBorderTextFormField(
                          focusColor: Color(0xFF885AF8),
                          labelText: AppLocalizations.of(context)!.lastName,
                          hintText: AppLocalizations.of(context)!.lastNameHint,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              Tost().warning(context, "Please enter last name");
                              isValidate = false;
                              return;
                            }
                            return;
                          },
                          onSave: (value) {
                            lastName = value;
                          },
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OutBorderTextFormField(
                      focusColor: Color(0xFF885AF8),
                      labelText: AppLocalizations.of(context)!.userID,
                      hintText: AppLocalizations.of(context)!.userIDHint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          Tost().warning(context, "Please enter userID");
                          isValidate = false;
                          return;
                        } else if (!_userIDRegex.hasMatch(value)) {
                          Tost()
                              .warning(context, "userID address is not valid");
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
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OutBorderTextFormField(
                      focusColor: Color(0xFF885AF8),
                      labelText: AppLocalizations.of(context)!.phoneNumber,
                      hintText: AppLocalizations.of(context)!.phoneNumberHint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          Tost().warning(context, "Please enter phone number");
                          isValidate = false;
                          return;
                        } else if (!_phoneRegex.hasMatch(value)) {
                          Tost().warning(
                              context, "Please enter correct phone number");
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
                      focusColor: Color(0xFF885AF8),
                      labelText: 'ehicle Plate Number',
                      hintText: 'Please enter vehicle Plate Number',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          Tost().warning(
                              context, "Please enter vehicle Plate Number");
                          isValidate = false;
                          return;
                        } else
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
                      focusColor: Color(0xFF885AF8),
                      labelText: 'idNumber',
                      hintText: 'Please enter idNumber',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          Tost().warning(context, "Please enter idNumber");
                          isValidate = false;
                          return;
                        } else
                          return;
                      },
                      onSave: (value) {
                        idNumber != value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      AppLocalizations.of(context)!.title,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SelectWidget(
                      selectionList: const ['Male', 'Female'],
                      onDropdownChanged: (value) {
                        gender =
                            value == 'Female' ? Gender.female : Gender.male;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.birthdate,
                            style: const TextStyle(fontSize: 14)),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () async {
                              List<DateTime?>? results =
                                  await showCalendarDatePicker2Dialog(
                                context: context,
                                config:
                                    CalendarDatePicker2WithActionButtonsConfig(),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
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
                    ButtonWidget(
                      color: Color(0xFF885AF8),
                      btnText: 'Aply now',
                      type: ButtonType.primary.type,
                      onTap: () {
                        _createNew(context);
                      },
                    )
                  ]),
            )),
      ),
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

  void _createNew(BuildContext context) {
    isValidate = true;
    _formKey.currentState?.validate();

    if (birthdate == "" || birthdate == null) {
      Tost().warning(context, "Please set birthdate");
      isValidate = false;
    }

    if (isValidate) {
      _formKey.currentState?.save();

      try {
        context.read<HieringBloc>().add(CreateHieringEvent(
            firstName: firstName!,
            lastName: lastName!,
            userID: userID!,
            phoneNumber: phoneNumber!,
            gender: gender,
            birthdate: birthdate!,
            vehiclePlateNumber: vehiclePlateNumber!,
            idNumber: idNumber,
            isAccepted: false,
            jobOfferId: jobOfferId));
      } catch (e) {
        Tost().error(context, '$e');
        print(e);
      }
    }
  }
}
