import 'package:dash_drop_dashboard/pages/hieringRequests/domain/entities/hiering.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../flutter_gen/app_localizations.dart';

class ViewHieringForm extends StatelessWidget {
  const ViewHieringForm({required this.hiering, super.key});

  final Hiering hiering;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return CommonCard(
      child: _titleWidget(
          lang.firstName,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: hiering.firstName.toString(),
              labelText: lang.firstName,
              hintText: lang.firstName,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: hiering.lastName.toString(),
              labelText: lang.lastName,
              hintText: lang.lastName,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: hiering.email.toString(),
              labelText: lang.email,
              hintText: lang.email,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: hiering.idNumber.toString(),
              labelText: lang.idNumber,
              hintText: lang.idNumber,
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 12,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: hiering.vehiclePlateNumber.toString(),
              labelText: lang.vehiclePlateNumber,
              hintText: lang.vehiclePlateNumber,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue:hiering.phoneNumber,
              labelText: lang.phoneNumber,
              hintText: lang.phoneNumber,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: hiering.gender.name,
              labelText: lang.gender,
              hintText: lang.gender,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: hiering.birthdate.toString(),
              labelText: lang.birthdate,
              hintText: lang.birthdate,
            ),
            const SizedBox(
              height: 16,
            ),
             OutBorderTextFormField(
              readOnly: true,
              initialValue: hiering.jobOfferId.toString(),
              labelText: lang.jobOffer,
              hintText: lang.jobOffer,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              readOnly: true,
              initialValue: hiering.createdAt.toString(),
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
