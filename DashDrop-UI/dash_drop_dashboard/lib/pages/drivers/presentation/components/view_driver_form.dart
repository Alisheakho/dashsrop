
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/drivers.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../flutter_gen/app_localizations.dart';

class ViewDriverForm extends StatelessWidget {
  ViewDriverForm({required this.driver, super.key});
  final Drivers driver;
  List<String> gnd = ['Male','Female'];
  @override
  Widget build(BuildContext context) {
     final lang = AppLocalizations.of(context)!;
    return CommonCard(
        child: _titleWidget(
            lang.driver,
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: OutBorderTextFormField(
                        readOnly: true,
                        initialValue: driver.firstName,
                        labelText: lang.firstName,
                        hintText: lang.firstNameHint,
                      )),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: OutBorderTextFormField(
                        readOnly: true,
                        initialValue: driver.lastName,
                        labelText: lang.lastName,
                        hintText: lang.lastNameHint,
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OutBorderTextFormField(
                    readOnly: true,
                    initialValue: driver.email,
                    labelText: lang.email,
                    hintText: lang.emailHint,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  
                  OutBorderTextFormField(
                    readOnly: true,
                    initialValue: driver.phoneNumber,
                    labelText: lang.phoneNumber,
                    hintText: lang.phoneNumberHint,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OutBorderTextFormField(
                    readOnly: true,
                    initialValue: driver.vehiclePlateNumber,
                    labelText:
                        lang.vehiclePlateNumber,
                    hintText:
                        lang.vehiclePlateNumber,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OutBorderTextFormField(
                    readOnly: true,
                    initialValue: driver.idNumber,
                    labelText: lang.idNumber,
                    hintText: lang.idNumber,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  
                  OutBorderTextFormField(
                    readOnly: true,
                    initialValue: gnd[driver.gender],
                    labelText: lang.gender,
                    hintText: lang.gender,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OutBorderTextFormField(
                    readOnly: true,
                    initialValue: driver.birthdate.toString(),
                    labelText: lang.birthdate,
                    hintText: lang.birthdate,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                   OutBorderTextFormField(
                    readOnly: true,
                    initialValue: driver.createdAt.toString(),
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
