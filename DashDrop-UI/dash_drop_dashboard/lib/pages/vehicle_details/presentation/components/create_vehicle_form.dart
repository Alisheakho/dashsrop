import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/controller/vehicle/vehicle_bloc.dart';
import 'package:dashdrop_uikit/components/buttons/button_widget.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/forms/outborder_text_form_field.dart';
import 'package:dashdrop_uikit/components/forms/select_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/tost.dart';
import '../../../../flutter_gen/app_localizations.dart';

class CreateVehicleForm extends StatelessWidget {
  CreateVehicleForm({super.key});

  final _formKey = GlobalKey<FormState>();

  double? costPerKm;
  int? avgSpeedKm;
  int? maxRangekm;
  double? maxCapacityCubicM;
  int? maxWeightKg;
  SensitivityLevels? sensitivityLevel;
  VehicleTypes? type;
  String? specifications;

  ValueNotifier<String> dateNotifier = ValueNotifier("");

  bool isValidate = true;
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
                labelText: lang.profitPerKm,
                hintText: lang.profitPerKm,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Tost().warning(context, "Please enter cost");
                    isValidate = false;
                    return;
                  }
                  return;
                },
                onSave: (value) {
                  costPerKm = double.parse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                  labelText: lang.avgSpeedKm,
                  hintText: lang.avgSpeedKm,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      Tost().warning(context, "Please enter avg speed");
                      isValidate = false;
                      return;
                    }
                    return;
                  },
                  onSave: (value) {
                    avgSpeedKm = int.tryParse(value!);
                  }),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                labelText: lang.maxRangekm,
                hintText: lang.maxRangekm,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Tost().warning(context, "Please retype max Range");
                    isValidate = false;
                    return;
                  }
                  return;
                },
                onSave: (value) {
                  maxRangekm = int.tryParse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                labelText: lang.maxCapacityCubicM,
                hintText: lang.maxCapacityCubicM,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Tost().warning(context, "Please enter max Capacity ");
                    isValidate = false;
                    return;
                  }

                  return;
                },
                onSave: (value) {
                  maxCapacityCubicM = double.parse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                labelText: lang.maxWeightKg,
                hintText: lang.maxWeightKg,
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
                  maxWeightKg = int.tryParse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                labelText: lang.specifications,
                hintText: lang.specifications,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Tost().warning(context, "Please enter the specifications");
                    isValidate = false;
                    return;
                  }
                  return;
                },
                onSave: (value) {
                  specifications = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  lang.regions,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 16,
                ),
                SelectWidget(
                  selectionList:
                      SensitivityLevels.values.map((e) => e.name).toList(),
                  onDropdownChanged: (value) {
                    sensitivityLevel = SensitivityLevels.values.map((e) {
                      //print("'${e.name}' '$value'");
                      if (e.name == value) {
                        return e;
                      } 
                    }).nonNulls.first;
                  },
                ),
                Text(
                  lang.vehicleDetail,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 16,
                ),
                SelectWidget(
                  selectionList:
                      VehicleTypes.values.map((e) => e.name).toList(),
                  onDropdownChanged: (value) {
                    
                    final v = VehicleTypes.values.map((e) {
                     // print("'${e.name}' '$value'");
                      if (e.name == value) {
                        return e;
                      } 
                    //  return e;
                    }).nonNulls.first;
                    //print(v);
                    type = v;
                  },
                ),
              ]),
              const SizedBox(
                height: 16,
              ),
              ButtonWidget(
                btnText: lang.createAccount,
                type: ButtonType.primary.type,
                onTap: () {
                  _createNew(context);
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

  void _createNew(BuildContext context) {
    _formKey.currentState?.validate();

    if (isValidate) {
      _formKey.currentState?.save();

      try {
        context.read<VehicleBloc>().add(CreateVehicleEvent(
            costPerKm: costPerKm!,
            avgSpeedKm: avgSpeedKm!,
            maxRangekm: maxRangekm!,
            maxCapacityCubicM: maxCapacityCubicM!,
            maxWeightKg: maxWeightKg!,
            sensitivityLevel: sensitivityLevel!,
            type: type!,
            specifications: specifications!));
      } catch (e) {
        Tost().error(context, '$e');
        //print(e);
      }
    }
  }
}
