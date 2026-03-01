import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';

import '../components/create_job_offer_form.dart';

class CreateJobOfferPage extends LayoutWidget {
  const CreateJobOfferPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    return "${AppLocalizations.of(context)!.create} ${AppLocalizations.of(context)!.jobOffer}";
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
        Expanded(child: CreateJobOfferForm()),
        const SizedBox(
          width: 300,
        ),
      ],
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return CreateJobOfferForm();
  }
}
