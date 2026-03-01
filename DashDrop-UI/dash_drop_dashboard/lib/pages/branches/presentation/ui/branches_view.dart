import 'package:dashdrop_uikit/components/buttons/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart'; // Uncomment if you have localization set up

import '../controller/branch_bloc.dart';
import 'branches_table.dart';

class BranchesPage extends LayoutWidget {
  const BranchesPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    // return AppLocalizations.of(context)!.branches; // Use this if you added "branches" to your arb file
    return "Branches";
  }

  @override
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    // Trigger the event to load data when the page opens
    context.read<BranchBloc>().add(GetBranchesEvent());

    return Column(
      children: [
        SizedBox(
          height: 50,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Builder(
                builder: (context) {
                  return SizedBox(
                    width: 200,
                    child: ButtonWidget(
                      btnText: 'Add New Branch',
                      color: Colors.white,
                      borderRadius: 5,
                      borderColor: Theme.of(context).colorScheme.primary,
                      textColor: Theme.of(context).colorScheme.primary,
                      onTap: () {
                        // Open your Add Dialog or Page here
                        // Navigator.of(context).pushNamed("/branches/create");
                        print("Add Branch Clicked");
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const BranchesTableWidget()
      ],
    );
  }
}
