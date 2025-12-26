import 'package:dash_drop_dashboard/components/tost.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/components/create_vehicle_form.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/controller/vehicle/vehicle_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateVehiclePage extends LayoutWidget {
  const CreateVehiclePage({super.key});

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
        BlocConsumer<VehicleBloc,VehicleState>(
          listenWhen: (previous, current) => previous.state != current.state && current.nameState == NameState.create,
           buildWhen: (previous, current) => previous.state != current.state && current.nameState == NameState.create,
          builder: (context, state) {
          return const SizedBox(
          width: 16,
        );
        },listener: (context, state) {
          if(state.state == RequestState.loaded){
            Tost().success(context,"created successfuly.");
            Navigator.pushNamed(context, "/vehicle");
          }
        },),
        Expanded(child: CreateVehicleForm()),
        
      ],
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return CreateVehicleForm();
  }
}
