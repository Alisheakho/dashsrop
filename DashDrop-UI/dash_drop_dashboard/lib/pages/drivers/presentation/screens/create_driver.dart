import 'package:dash_drop_dashboard/components/tost.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/drivers/presentation/controller/driver/driver_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/create_driver_form.dart';

class CreateDriverPage extends LayoutWidget {
  const CreateDriverPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return "${lang.create} ${lang.drivers}";
  }

  @override
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocConsumer<DriverBloc,DriverState>(
          listenWhen: (previous, current) => previous.updateDriverstate != current.updateDriverstate,
          builder: (context, state) {
          return const SizedBox(
          width: 16,
        );
        },listener: (context, state) {
          if(state.createDriverstate == RequestState.loaded){
            Tost().success(context,"created successfuly.");
            Navigator.pushNamed(context, "/drivers");
          }
        },),
        Expanded(child: CreateDriverForm()),
        
      ],
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return CreateDriverForm();
  }
}
