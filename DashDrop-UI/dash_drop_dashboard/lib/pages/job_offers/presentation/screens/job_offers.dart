import 'package:dashdrop_uikit/components/buttons/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/job_offers_table.dart';
import '../controller/job_offer_bloc.dart';

class JobOffersPage extends LayoutWidget {
  const JobOffersPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.jobOffers;
  }

  @override
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    context.read<JobOfferBloc>().add(GetJobOffersEvent());
    return Column(children: [
      SizedBox(
          height: 50,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Builder(
                builder: (crateJOFContext) {
                  return SizedBox(
                    width: 200,
                    child: ButtonWidget(
                      btnText: 'Add New JobOffer',
                      color: Colors.white,
                      borderRadius: 5,
                      borderColor: Theme.of(context).colorScheme.primary,
                      textColor: Theme.of(context).colorScheme.primary,
                      onTap: () {
                        Navigator.of(crateJOFContext).pushNamed("/jobOffers/create");
                      },
                    ),
                  );
                }
              ),
            ],
          )),
      const SizedBox(
        height: 16,
      ),
      const JobOffersTableWidget()
    ]);
  }
}
