import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/drivers.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/regions.dart';
import 'package:dashdrop_uikit/components/buttons/button_widget.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/forms/outborder_text_form_field.dart';

import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:dashdrop_uikit/components/forms/select_widget.dart';
import 'package:dashdrop_uikit/core/theme/dashdrop_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/tost.dart';
import '../../../../flutter_gen/app_localizations.dart';
import '../controller/driver/driver_bloc.dart';

class UpdateDriverForm extends StatelessWidget {
  UpdateDriverForm({super.key});
  List<String> gnd = ['Male', 'Female'];
  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();

  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  int? gender;
  String? birthdate;
  String? vehiclePlateNumber;
  String? password;
  String? idNumber;
  int? regionId;
  int? vehicleDetailId;
  ValueNotifier<String> dateNotifier = ValueNotifier("");

  bool isValidate = true;

  RegExp get _emailRegex =>
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  RegExp get _phoneRegex => RegExp(r'^(\+90\d{10}|\+963\d{10}|\d{11})$');

  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<DriverBloc, DriverState>(
      listener: (context, state) {
      if (state.updateDriverstate == RequestState.loaded) {
        Tost().success(context, "Update Driver success");
        context.read<DriverBloc>().add(GetDriversEvent());
        Navigator.popAndPushNamed(context, '/drivers');
      } else if (state.updateDriverstate == RequestState.error) {
        Tost().error(context, state.updateDriversMessage);
        if (state.updateDriversErrors != null) {
          state.updateDriversErrors?.forEach(
              (name, info) => Tost().warning(context, "$name : $info"));
        }
      }
    }, builder: (BuildContext context, DriverState state) {
      final lang = AppLocalizations.of(context)!;
      Drivers driver = state.getDriver;
      List<String> regions = state.getRegions.map((e) => e.name).toList();
      List<String> vehicleDetails =
          state.getVehicleDetails.map((e) => e.id.toString()).toList();
      if (state.getDriverstate == RequestState.loading) {
        return const Center(
            child: CommonCard(
          child: LoadingWidget(),
        ));
      }
      gnd = driver.gender == 0 ? gnd.reversed.toList() : gnd;
      //print(driver.firstName);
      return CommonCard(
        child: _titleWidget(
            lang.info,
            Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: OutBorderTextFormField(
                          initialValue: driver.firstName,
                          labelText: lang.firstName,
                          hintText: lang.firstNameHint,
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
                          initialValue: driver.lastName,
                          labelText: lang.lastName,
                          hintText: lang.lastNameHint,
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
                      initialValue: driver.email,
                      labelText: lang.email,
                      hintText: lang.emailHint,
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
                      onSave: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OutBorderTextFormField(
                      controller: passwordController,
                      labelText: lang.password,
                      hintText: lang.passwordHint,
                      validator: (value) {
                        if (value.length < 8 && value.isNotEmpty) {
                          Tost().warning(
                              context, "the password must be 8 character");
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
                      labelText: lang.retypePassword,
                      hintText: lang.retypePasswordHint,
                      validator: (value) {
                        if (value != passwordController.text) {
                          Tost().warning(context, "the password must same");
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
                      initialValue: driver.phoneNumber,
                      labelText: lang.phoneNumber,
                      hintText: lang.phoneNumberHint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          Tost().warning(context, "Please enter phone number");
                          isValidate = false;
                          return;
                        }
                        if (!_phoneRegex.hasMatch(value)) {
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
                      initialValue: driver.vehiclePlateNumber,
                      labelText: lang.vehiclePlateNumber,
                      hintText: lang.vehiclePlateNumber,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          Tost().warning(
                              context, "Please enter the Vehicle Plate Number");
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
                      initialValue: driver.idNumber,
                      labelText: lang.idNumber,
                      hintText: lang.idNumber,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          Tost().warning(context, "Please enter the ID Number");
                          isValidate = false;
                          return;
                        }
                        return;
                      },
                      onSave: (value) {
                        idNumber = value;
                      },
                    ),
                    Text(
                      lang.regions,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SelectWidget(
                      selectionList: regions,
                      onDropdownChanged: (value) {
                        regionId = _valueToId(state.getRegions, value);
                      },
                    ),
                    Text(
                      lang.vehicleDetail,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SelectWidget(
                      selectionList: vehicleDetails,
                      onDropdownChanged: (value) {
                        vehicleDetailId = int.tryParse(value);
                        // _valueToIdV(state.getVehicleDetails,value);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      lang.gender,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SelectWidget(
                      selectionList: gnd,
                      onDropdownChanged: (value) {
                        gender = value == 'Female' ? 1 : 0;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(lang.birthdate,
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
                      btnText: lang.update,
                      type: ButtonType.primary.type,
                      onTap: () {
                        _updateInfo(context, driver);
                      },
                    )
                  ]),
            )),
      );
    });
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

  void _updateInfo(BuildContext context, Drivers driver) {
    // isValidate = true;
    _formKey.currentState?.validate();

    // if (birthdate == "" || birthdate == null) {
    //   Tost().warning(context, "Please set birthdate");
    //   isValidate = false;
    // }

    if (isValidate) {
      _formKey.currentState?.save();

      try {
        //print(driver.id);
        context.read<DriverBloc>().add(UpdateDriverEvent(
            id: driver.id,
            firstName: firstName!,
            lastName: lastName!,
            email: email!,
            password: password!,
            phoneNumber: phoneNumber!,
            gender: gender!,
            birthdate: birthdate!,
            vehiclePlateNumber: vehiclePlateNumber!,
            idNumber: idNumber!,
            regionId: regionId!,
            vehicleDetailId: vehicleDetailId!));
      } catch (e) {
        Tost().error(context, '$e');
      }
    }
  }

  int _valueToId(List<Regions> vals, String value) {
    return vals.map((e) {
      if (e.name == value) {
        return e.id;
      } else {
        return 0;
      }
    }).first;
  }
}
