import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dash_drop_dashboard/core/theme/global_colors.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dashdrop_uikit/components/buttons/button_widget.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/forms/checkbox_widget.dart';
import 'package:dashdrop_uikit/components/forms/outborder_text_form_field.dart';
import 'package:dashdrop_uikit/components/forms/select_widget.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:dashdrop_uikit/core/theme/dashdrop_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/tost.dart';
import '../../../../flutter_gen/app_localizations.dart';
import '../../domain/entities/employee.dart';
import '../controller/employee_bloc.dart';

class UpdateEmployeeForm extends StatelessWidget {
  UpdateEmployeeForm({super.key});

  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  ValueNotifier<String> dateNotifier = ValueNotifier("");

  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? title;
  Gender? gender;
  String? birthdate;
  String? password;

  bool isValidate = true;

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


  List<String> gnd = ['Male', 'Female'];
  List<String> ttl = ['Admin', 'Drivers-Manager', 'HR-Manager','HR-Customers-Support'];

  RegExp get _emailRegex => RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); //RegExp(r'^\S+@\S+$')
  RegExp get _phoneRegex => RegExp(r'^(\+90\d{10}|\+963\d{10}|\d{11})$');

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeBloc, EmployeeState>(
        listener: (context, state) {
          if (state.updateEmployeeState == RequestState.loaded) {
            Tost().success(context, "Update employee success");
            Navigator.popAndPushNamed(context, '/employees');
          } else if (state.updateEmployeeState == RequestState.error) {
            Tost().error(context, state.updateEmployeeMessage);
            if (state.updateEmployeeErrors != null) {
              state.updateEmployeeErrors?.forEach(
                  (name, info) => Tost().warning(context, "$name : $info"));
            }
          }
        },
        buildWhen: (previous, current) =>
            current.getEmployeeState != previous.getEmployeeState,
        builder: (context, state) => _buildWidgt(context, state));
  }

  _buildWidgt(BuildContext context, EmployeeState state) {
    Employee employee = state.getEmployee;

    if (state.getEmployeeState == RequestState.loading) {
      return const Center(
          child: CommonCard(
        child: LoadingWidget(),
      ));
    }
    gnd = employee.gender == Gender.female ? gnd.reversed.toList() : gnd;
    ttl.removeWhere((e) => e == employee.title);
    ttl.insert(0, employee.title);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CommonCard(
            child: _titleWidget(
          AppLocalizations.of(context)!.info,
          Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                      child: OutBorderTextFormField(
                    initialValue: employee.firstName,
                    labelText: AppLocalizations.of(context)!.firstName,
                    hintText: AppLocalizations.of(context)!.firstNameHint,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        Tost().warning(context, "Please enter first name");
                        isValidate = false;
                      }
                      return;
                    },
                    onSave: (value) => firstName = value,
                  )),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: OutBorderTextFormField(
                    initialValue: employee.lastName,
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
                    onSave: (value) => lastName = value,
                  ))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                initialValue: employee.email,
                labelText: AppLocalizations.of(context)!.email,
                hintText: AppLocalizations.of(context)!.emailHint,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Tost().warning(context, "Please enter Email");
                    isValidate = false;
                    return;
                  } else if (!_emailRegex.hasMatch(value)) {
                    Tost().warning(context, "Email address is not valid");
                    isValidate = false;
                    return;
                  }
                  return;
                },
                onSave: (value) => email = value,
              ),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                controller: passwordController,
                labelText: AppLocalizations.of(context)!.password,
                hintText: AppLocalizations.of(context)!.passwordHint,
                validator: (value) {
                  if (value.length < 8 && value.length > 0) {
                    Tost().warning(context, "the password must be 8 character");
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
                labelText: AppLocalizations.of(context)!.retypePassword,
                hintText: AppLocalizations.of(context)!.retypePasswordHint,
                validator: (value) {
                  if (value != passwordController.text) {
                    Tost().warning(context, "the password must same");
                    isValidate = false;
                    return;
                  }
                  return;
                },
                onSave: (value) => password = value,
              ),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                initialValue: employee.phoneNumber,
                labelText: AppLocalizations.of(context)!.phoneNumber,
                hintText: AppLocalizations.of(context)!.phoneNumberHint,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Tost().warning(context, "Please enter phone number");
                    isValidate = false;
                    return;
                  } else if (!_phoneRegex.hasMatch(value)) {
                    Tost()
                        .warning(context, "Please enter correct phone number");
                    isValidate = false;
                    return;
                  }
                  return;
                },
                onSave: (value) => phoneNumber = value,
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
                selectionList: ttl,
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
                selectionList: gnd,
                onDropdownChanged: (value) {
                  gender = value == 'Female' ? Gender.female : Gender.male;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              _buildBirthdateSelector(context, employee),
              const SizedBox(
                height: 16,
              ),
              _updateButton(context, employee)
            ]),
          )),
    
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(child: _employeePermissions(context))
      ],
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

  Widget _buildBirthdateSelector(BuildContext context, Employee? employee) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.birthdate,
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
                              ? Text(employee?.birthdate ?? "")
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

  Widget _updateButton(BuildContext context, Employee employee) {
    return ButtonWidget(
      btnText: AppLocalizations.of(context)!.update,
      type: ButtonType.primary.type,
      onTap: () {
        isValidate = true;
        _formKey.currentState?.validate();

        if (isValidate) {
          _formKey.currentState?.save();

          try {
            context.read<EmployeeBloc>().add(UpdateEmployeeEvent(
                id: employee.id,
                firstName: firstName ?? employee.firstName,
                lastName: lastName ?? employee.lastName,
                email: email ?? employee.email,
                password: password!,
                phoneNumber: phoneNumber ?? employee.phoneNumber,
                title: title ?? employee.title,
                gender: gender ?? employee.gender,
                birthdate: birthdate ?? employee.birthdate));
          } catch (e) {
            print(e);
          }
        }
      },
    );
  }
}
