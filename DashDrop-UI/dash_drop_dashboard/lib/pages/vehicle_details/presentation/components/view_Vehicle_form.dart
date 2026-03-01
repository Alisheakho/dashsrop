import 'package:dash_drop_dashboard/pages/vehicle_details/domain/entities/vehicle.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../flutter_gen/app_localizations.dart';

class ViewVehicleForm extends StatelessWidget {
  const ViewVehicleForm({required this.vehicle, super.key});

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return CommonCard(
      child: _titleWidget(
          lang.vehicleDetail,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: vehicle.avgSpeedKm.toString(),
              labelText: lang.avgSpeedKm,
              hintText: lang.avgSpeedKm,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: vehicle.maxCapacityCubicM.toString(),
              labelText: lang.maxCapacityCubicM,
              hintText: lang.maxCapacityCubicM,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: vehicle.maxRangekm.toString(),
              labelText: lang.maxRangekm,
              hintText: lang.maxRangekm,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: vehicle.maxWeightKg.toString(),
              labelText: lang.maxWeightKg,
              hintText: lang.maxWeightKg,
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 12,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: vehicle.costPerKm.toString(),
              labelText: lang.profitPerKm,
              hintText: lang.profitPerKm,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue:vehicle.sensitivityLevel.name,
              labelText: lang.sensitivityLevel,
              hintText: lang.sensitivityLevel,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: vehicle.type.name,
              labelText: lang.sensitivityLevel,
              hintText: lang.sensitivityLevel,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: vehicle.specifications.toString(),
              labelText: lang.specifications,
              hintText: lang.specifications,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: vehicle.createdAt.toString(),
              labelText: lang.createdAt,
              hintText: lang.createdAt,
            ),
            const SizedBox(
              height: 16,
            ),
          ])),
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
}
