import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';

import '../components/update_employee_form.dart';

class UpdateJobOfferPage extends LayoutWidget {
  const UpdateJobOfferPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    return "${AppLocalizations.of(context)!.update} ${AppLocalizations.of(context)!.jobOffer}";
  }

  @override
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 300,
        ),
        Expanded(child: UpdateJobOfferForm()),
        const SizedBox(
          width: 300,
        ),
      ],
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return UpdateJobOfferForm();
  }
}
