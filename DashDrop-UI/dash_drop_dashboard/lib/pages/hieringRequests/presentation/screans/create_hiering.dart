import 'package:dash_drop_dashboard/components/tost.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/components/create_hiering_form.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/controller/hiering/hiering_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateHieringPage extends LayoutWidget {
  const CreateHieringPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return "${lang.create} ${lang.vehicleDetail}";
  }

  @override
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocConsumer<HieringBloc,HieringState>(
          listenWhen: (previous, current) => previous.state != current.state && current.nameState == NameState.create,
           buildWhen: (previous, current) => previous.state != current.state && current.nameState == NameState.create,
          builder: (context, state) {
          return const SizedBox(
          width: 16,
        );
        },listener: (context, state) {
          if(state.state == RequestState.loaded){
            Tost().success(context,"created successfuly.");
            Navigator.pushNamed(context, "/hiering");
          }
        },),
        Expanded(child: CreateHieringForm()),
        
      ],
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return CreateHieringForm();
  }
}
