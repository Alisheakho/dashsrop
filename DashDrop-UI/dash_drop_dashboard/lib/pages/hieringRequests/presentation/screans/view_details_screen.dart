import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/components/view_hiering_form.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/controller/hiering/hiering_bloc.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewHieringPage extends LayoutWidget {
  const ViewHieringPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return "${lang.view} ${lang.vehicleDetail}";
  }

  @override
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    final int arg = ModalRoute.of(context)!.settings.arguments as int;
    context.read<HieringBloc>().add(GetHieringEvent(id: arg));
    return BlocConsumer<HieringBloc, HieringState>(
      buildWhen: (previous, current) {
       // print("${previous.nameState}  ${current.nameState}");
        return current.nameState == NameState.getDetails;
      },
      listener: (context, state) {
        
      }, 
      builder: (context, state) {
        if (state.state == RequestState.loading ) {
          return const Center(
              child: CommonCard(
            height: 200,
            child: LoadingWidget(),
          ));
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ViewHieringForm(hiering: state.getData),
                ),
              ],
            )),
          ],
        );
      },
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    final int arg = ModalRoute.of(context)!.settings.arguments as int;
    context.read<HieringBloc>().add(GetHieringEvent(id: arg));

    return BlocBuilder<HieringBloc, HieringState>(
      buildWhen: (previous, current) =>
          current.nameState == NameState.getDetails,
      builder: (context, state) {
      if(state.state == RequestState.loading){
        return const Center(child: CircularProgressIndicator(),);
      }
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ViewHieringForm(hiering: state.getData),
              ),
            ],
          )),
        ],
      );
    });
  }
}
