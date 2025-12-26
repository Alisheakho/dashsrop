import 'package:dash_drop_dashboard/pages/drivers/domain/entities/regions.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../flutter_gen/app_localizations.dart';

class ViewRegionForm extends StatelessWidget {
  const ViewRegionForm({required this.region, super.key});

  final Regions region;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return CommonCard(
      child: _titleWidget(
          lang.regions,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            OutBorderTextFormField(
              readOnly: true,
              initialValue: region.id.toString(),
              labelText: lang.id,
              hintText: lang.id,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: region.name.toString(),
              labelText: lang.name,
              hintText: lang.name,
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
