import 'package:dash_drop_dashboard/pages/drivers/presentation/components/driver_table.dart';
import 'package:dash_drop_dashboard/pages/drivers/presentation/controller/driver/driver_bloc.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dashdrop_uikit/components/buttons/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:provider/provider.dart';

class DriverScreen extends LayoutWidget{
  const DriverScreen({super.key});

   @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.drivers;
  }

  @override
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    context.read<DriverBloc>().add(GetDriversEvent());
    var lang = AppLocalizations.of(context)!;
      return Column(children: [
      SizedBox(
          height: 50,
          width: double.maxFinite,
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Builder(
                builder: (crateEmpContext) {
                  return SizedBox(
                    width: 200,
                    child: ButtonWidget(
                      btnText: lang.addDriver,
                      color: Colors.white,
                      borderRadius: 5,
                      borderColor: Theme.of(context).colorScheme.primary,
                      textColor: Theme.of(context).colorScheme.primary,
                      onTap: () {
                        Navigator.of(crateEmpContext).pushNamed("/drivers/create");
                      },
                    ),
                  );
                }
              ),
            ],
          )),
      const SizedBox(
        height: 16,
      ),
      const DriversTableWidget()
    ]);
  }
  
}