import 'package:dash_drop_dashboard/components/tost.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/components/update_hiering_form.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/controller/hiering/hiering_bloc.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateHieringPage extends LayoutWidget {
  const UpdateHieringPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return "${lang.update} ${lang.vehicleDetail}";
  }

  @override
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [
        BlocListener<HieringBloc, HieringState>(
          listenWhen: (previous, current) => current.nameState== NameState.update,
          listener: (context, state) {
            if (state.state == RequestState.loaded) {
              Tost().success(context, "Update successfuly.");
              Navigator.pushNamed(context, "/hiering");
            }
          },
          child: const SizedBox(),
        ),
        BlocConsumer<HieringBloc, HieringState>(
          buildWhen: (previous, current) =>
              current.nameState == NameState.getDetails,
          listenWhen: (previous, current) =>
              current.nameState == NameState.getDetails,
          builder: (BuildContext context, state) {
            if (state.state == RequestState.loading) {
              return const Center(child: LoadingWidget());
            }
            if (state.state == RequestState.loaded) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: UpdateHieringForm(hiering: state.getData)),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              );
            }
            return Center(child: Text("Error: ${state.message}"));
          },
          listener: (BuildContext context, HieringState state) {
            if (state.state == RequestState.error) {
              Tost().error(context, "error : ${state.message}");
            }
          },
        ),
      ],
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return BlocConsumer<HieringBloc, HieringState>(
      builder: (BuildContext context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: UpdateHieringForm(hiering: state.getData)),
            const SizedBox(
              width: 16,
            ),
          ],
        );
      },
      listener: (BuildContext context, HieringState state) {},
    );
  }
}
