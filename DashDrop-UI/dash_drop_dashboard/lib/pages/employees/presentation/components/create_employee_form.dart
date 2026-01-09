import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dash_drop_dashboard/core/theme/global_colors.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dashdrop_uikit/components/buttons/button_widget.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/forms/checkbox_widget.dart';
import 'package:dashdrop_uikit/components/forms/outborder_text_form_field.dart';
import 'package:dashdrop_uikit/components/forms/select_widget.dart';
import 'package:dashdrop_uikit/core/theme/dashdrop_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/tost.dart';
import '../../../../flutter_gen/app_localizations.dart';
import '../controller/employee_bloc.dart';

class CreateEmployeeForm extends StatelessWidget {
  CreateEmployeeForm({super.key});

  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();

  String? firstName;
  String? lastName;
  String? userID;
  String? password;
  String? phoneNumber;
  Gender gender = Gender.male;
  String title = "Admin";
  String? birthdate;
  ValueNotifier<String> dateNotifier = ValueNotifier("");

  Map<dynamic, dynamic> titles = {
    'Admin': [
      'Can Manage JobOffers',
      'Can Manage Employees',
      'Can Manage Hiering Requests',
      'Can Manage Drivers',
      'Can Manage Reports'
    ],
    'Drivers-Manager': [
      'Can Manage JobOffers',
      'Can Manage Hiering Requests',
      'Can Manage Drivers',
    ],
    'HR-Manager': ['Can Manage Employees'],
    'HR-Customers-Support': ['Can Manage Reports']
  };

  ValueNotifier<String> checkedNotifier = ValueNotifier('');

  bool isValidate = true;

  RegExp get _userIDRegex =>
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  RegExp get _phoneRegex => RegExp(r'^(\+90\d{10}|\+963\d{10}|\d{11})$');

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeBloc, EmployeeState>(
      listener: (context, state) {
        if (state.createEmployeeState == RequestState.loaded) {
          Tost().success(context, "create employee success");
          Navigator.popAndPushNamed(context, '/employees');
        } else if (state.createEmployeeState == RequestState.error) {
          Tost().error(context, state.createEmployeeMessage);
          if (state.createEmployeeErrors != null) {
            state.createEmployeeErrors?.forEach(
                (name, info) => Tost().warning(context, "$name : $info"));
          }
        }
      },
      builder: (BuildContext context, EmployeeState state) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CommonCard(
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
                                labelText:
                                    AppLocalizations.of(context)!.firstName,
                                hintText:
                                    AppLocalizations.of(context)!.firstNameHint,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    Tost().warning(
                                        context, "Please enter first name");
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
                                labelText:
                                    AppLocalizations.of(context)!.lastName,
                                hintText:
                                    AppLocalizations.of(context)!.lastNameHint,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    Tost().warning(
                                        context, "Please enter last name");
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
                            labelText: AppLocalizations.of(context)!.userID,
                            hintText: AppLocalizations.of(context)!.userIDHint,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                Tost().warning(context, "Please enter userID");
                                isValidate = false;
                                return;
                              } else if (!_userIDRegex.hasMatch(value)) {
                                Tost().warning(
                                    context, "userID address is not valid");
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
                            controller: passwordController,
                            labelText: AppLocalizations.of(context)!.password,
                            hintText:
                                AppLocalizations.of(context)!.passwordHint,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                Tost()
                                    .warning(context, "Please enter password");
                                isValidate = false;
                                return;
                              } else if (value.length < 8) {
                                Tost().warning(context,
                                    "the password must be 8 character");
                                isValidate = false;
                                return;
                              }
                              return;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          OutBorderTextFormField(
                            labelText:
                                AppLocalizations.of(context)!.retypePassword,
                            hintText: AppLocalizations.of(context)!
                                .retypePasswordHint,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                Tost()
                                    .warning(context, "Please retype password");
                                isValidate = false;
                                return;
                              } else if (value != passwordController.text) {
                                Tost()
                                    .warning(context, "the password must same");
                                isValidate = false;
                                return;
                              }
                              return;
                            },
                            onSave: (value) {
                              password = value;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          OutBorderTextFormField(
                            labelText:
                                AppLocalizations.of(context)!.phoneNumber,
                            hintText:
                                AppLocalizations.of(context)!.phoneNumberHint,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                Tost().warning(
                                    context, "Please enter phone number");
                                isValidate = false;
                                return;
                              } else if (!_phoneRegex.hasMatch(value)) {
                                Tost().warning(context,
                                    "Please enter correct phone number");
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
                          Text(
                            AppLocalizations.of(context)!.title,
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SelectWidget(
                            selectionList: [
                              'Admin',
                              'Drivers-Manager',
                              'HR-Manager',
                              'HR-Customers-Support'
                            ],
                            onDropdownChanged: (value) {
                              title = value;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            AppLocalizations.of(context)!.gender,
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SelectWidget(
                            selectionList: const ['Male', 'Female'],
                            onDropdownChanged: (value) {
                              gender = value == 'Female'
                                  ? Gender.female
                                  : Gender.male;
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
                                    birthdate =
                                        (results != null && results.isNotEmpty
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
                                                    color:
                                                        DashDropColors.border,
                                                    width: 1)),
                                            child: Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                Text(val),
                                                const Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Icon(
                                                      Icons.calendar_month),
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
                            btnText:
                                AppLocalizations.of(context)!.createAccount,
                            type: ButtonType.primary.type,
                            onTap: () {
                              _createNew(context);
                            },
                          )
                        ]),
                  )),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(child: _employeePermissions(context))
        ],
      ),
    );
  }

  Widget _employeePermissions(BuildContext context) {
    return CommonCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 50,
          padding: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: Text(AppLocalizations.of(context)!.permissions),
        ),
        const Divider(
          height: 1,
        ),
        Padding(
            padding: const EdgeInsets.all(16),
            child: ValueListenableBuilder(
                valueListenable: checkedNotifier,
                builder: (ctx, checkedValue, child) {
                  return Wrap(
                    direction: Axis.vertical,
                    spacing: 20,
                    runSpacing: 10,
                    children: titles[title].map<Widget>((e) {
                      return CheckBoxWidget(
                        checked: true,
                        text: e,
                        checkedColor: GlobalColors.success,
                        size: 30,
                        value: e,
                        onChanged: (checked, v) {
                          // if (checked ?? false) {
                          //   checkedNotifier.value = v ?? '';
                          // } else {
                          //   checkedNotifier.value = '';
                          // }
                        },
                      );
                    }).toList(),
                  );
                }))
      ]),
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
        context.read<EmployeeBloc>().add(CreateEmployeeEvent(
            firstName: firstName!,
            lastName: lastName!,
            userID: userID!,
            password: password!,
            phoneNumber: phoneNumber!,
            title: title,
            gender: gender,
            birthdate: birthdate!));
      } catch (e) {
        Tost().error(context, '$e');
        print(e);
      }
    }
  }
}
