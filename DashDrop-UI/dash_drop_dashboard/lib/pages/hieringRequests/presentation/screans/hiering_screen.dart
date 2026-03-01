import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/components/tost.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/components/hiering_table.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/controller/hiering/hiering_bloc.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dashdrop_uikit/components/buttons/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HieringScreen extends LayoutWidget {
  const HieringScreen({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.hierings;
  }

  @override
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    context.read<HieringBloc>().add(GetHieringsEvent());

    var lang = AppLocalizations.of(context)!;
    return Column(children: [
      BlocListener<HieringBloc, HieringState>(
        listenWhen: (previous, current) => (previous.state != current.state) &&
            current.nameState == NameState.delete,
        listener: (context, state) {
          if (state.state == RequestState.loaded) {
            Tost().success(context, "delete successfuly.");
            Navigator.popAndPushNamed(context, "/hiering");
          }
        },
        child: const SizedBox(),
      ),
      SizedBox(
          height: 50,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Builder(builder: (crateEmpContext) {
                return SizedBox(
                  width: 200,
                  child: ButtonWidget(
                    btnText: lang.addHiering,
                    color: Colors.white,
                    borderRadius: 5,
                    borderColor: Theme.of(context).colorScheme.primary,
                    textColor: Theme.of(context).colorScheme.primary,
                    onTap: () {
                      Navigator.of(crateEmpContext)
                          .pushNamed("/hiering/create");
                    },
                  ),
                );
              }),
            ],
          )),
      const SizedBox(
        height: 16,
      ),
      const HieringTableWidget()
    ]);
  }
}
