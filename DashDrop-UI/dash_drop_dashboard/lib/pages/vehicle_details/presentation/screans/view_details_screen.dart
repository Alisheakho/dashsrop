import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/components/view_Vehicle_form.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/controller/vehicle/vehicle_bloc.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewVehiclePage extends LayoutWidget {
  const ViewVehiclePage({super.key});

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
    context.read<VehicleBloc>().add(GetVehicleEvent(id: arg));
    return BlocConsumer<VehicleBloc, VehicleState>(
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
                  child: ViewVehicleForm(vehicle: state.getData),
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
    context.read<VehicleBloc>().add(GetVehicleEvent(id: arg));

    return BlocBuilder<VehicleBloc, VehicleState>(
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
                child: ViewVehicleForm(vehicle: state.getData),
              ),
            ],
          )),
        ],
      );
    });
  }
}
