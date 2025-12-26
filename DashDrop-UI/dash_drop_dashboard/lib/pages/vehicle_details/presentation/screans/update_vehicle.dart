import 'package:dash_drop_dashboard/components/tost.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/components/update_vehicle_form.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/controller/vehicle/vehicle_bloc.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateVehiclePage extends LayoutWidget {
  const UpdateVehiclePage({super.key});

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
        BlocListener<VehicleBloc, VehicleState>(
          listenWhen: (previous, current) => current.nameState== NameState.update,
          listener: (context, state) {
            if (state.state == RequestState.loaded) {
              Tost().success(context, "Update successfuly.");
              Navigator.pushNamed(context, "/vehicle");
            }
          },
          child: const SizedBox(),
        ),
        BlocConsumer<VehicleBloc, VehicleState>(
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
                  Expanded(child: UpdateVehicleForm(vehicle: state.getData)),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              );
            }
            return Center(child: Text("Error: ${state.message}"));
          },
          listener: (BuildContext context, VehicleState state) {
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
    return BlocConsumer<VehicleBloc, VehicleState>(
      builder: (BuildContext context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: UpdateVehicleForm(vehicle: state.getData)),
            const SizedBox(
              width: 16,
            ),
          ],
        );
      },
      listener: (BuildContext context, VehicleState state) {},
    );
  }
}
