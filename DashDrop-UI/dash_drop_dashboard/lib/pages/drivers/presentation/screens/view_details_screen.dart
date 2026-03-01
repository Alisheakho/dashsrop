import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/regions.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/vehicle_details.dart';
import 'package:dash_drop_dashboard/pages/drivers/presentation/components/view_Rogion_form.dart';
import 'package:dash_drop_dashboard/pages/drivers/presentation/components/view_VehicleDetails_form.dart';
import 'package:dash_drop_dashboard/pages/drivers/presentation/controller/driver/driver_bloc.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/view_driver_form.dart';

class ViewDriverPage extends LayoutWidget {
  const ViewDriverPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return "${lang.view} ${lang.driver}";
  }

  @override
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    final int arg = ModalRoute.of(context)!.settings.arguments as int;
    context.read<DriverBloc>().add(GetDriverEvent(id: arg));
    return BlocBuilder<DriverBloc, DriverState>(
      builder: (context, state) {
        if (state.getDriverstate == RequestState.loading) {
          return const Center(
              child: CommonCard(
                height: 200,
            child: LoadingWidget(),
          ));
        }
    
        final VehicleDetails vecile = state.getVehicleDetails.map((e) {
          if (e.id == state.getDriver.vehicleDetailId) {
            return e;
          } else {
            return e;
          }
        }).first;
        final Regions region = state.getRegions.map((e) {
          if (e.id == state.getDriver.regionId) {
            return e;
          } else {
            return e;
          }
        }).first;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ViewDriverForm(driver: state.getDriver),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ViewRegionForm(region: region),
                )
              ],
            )),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ViewVehicleDetailsForm(vehicleDetails: vecile),
            ))
          ],
        );
      },
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    final int arg = ModalRoute.of(context)!.settings.arguments as int;
    context.read<DriverBloc>().add(GetDriverEvent(id: arg));
    return BlocBuilder<DriverBloc, DriverState>(
      builder: (context, state) {
        final VehicleDetails vecile = state.getVehicleDetails.map((e) {
          if (e.id == state.getDriver.vehicleDetailId) {
            return e;
          } else {
            return e;
          }
        }).first;
        final Regions region = state.getRegions.map((e) {
          if (e.id == state.getDriver.regionId) {
            return e;
          } else {
            return e;
          }
        }).first;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              children: [
                ViewDriverForm(driver: state.getDriver),
                const SizedBox(
                  width: 16,
                ),
               ViewRegionForm(region: region)
              ],
            )),
            Expanded(child:ViewVehicleDetailsForm(vehicleDetails: vecile) )
          ],
        );
      },
    );
  }
}
