import 'package:dash_drop_dashboard/core/theme/global_theme.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:dash_drop_dashboard/pages/drivers/presentation/controller/driver/driver_bloc.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/controller/hiering/hiering_bloc.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/controller/vehicle/vehicle_bloc.dart';
import 'package:dash_drop_dashboard/routes.dart';
import 'package:dashdrop_uikit/service/localization_provider.dart';
import 'package:dashdrop_uikit/service/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

import 'core/observer/app_observer.dart';
import 'core/services/services_locator.dart';
import 'pages/auth/presentation/controller/auth_bloc.dart';
import 'pages/customers/presentation/controller/customer_bloc.dart';
import 'pages/employees/presentation/controller/employee_bloc.dart';
import 'pages/job_offers/presentation/controller/job_offer_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  Bloc.observer = AppBlocObserver();
  await GetStorage.init();

  if (GetPlatform.isDesktop && !GetPlatform.isWeb) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1633, 735),
      minimumSize: Size(480, 360),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      // titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          //theme
          ChangeNotifierProvider(create: (_) => ThemeProvider(_)),
          //localizationen
          ChangeNotifierProvider(create: (_) => LocalizationProvider(_)),
          // authentication
          BlocProvider(
              create: (context) => sl<AuthBloc>()..add(IsAuthorizedEvent())),
          // employees
          BlocProvider(
            create: (context) => sl<EmployeeBloc>(),
          ),
          // customers
          BlocProvider(
            create: (context) => sl<CustomerBloc>(),
          ),
          // job offers
          BlocProvider(
            create: (context) => sl<JobOfferBloc>(),
          ),
          // Drivers
          BlocProvider(create: (context) => sl<DriverBloc>()),
          // Vehicle
          BlocProvider(
            create: (context) => sl<VehicleBloc>(),
          ),
          //HieringRequests
          BlocProvider(create: (context) => sl<HieringBloc>())
        ],
        child: Builder(builder: (context) {
          context.read<LocalizationProvider>().supportedLocales =
              AppLocalizations.supportedLocales;
          return MaterialApp(
            navigatorKey: RouteConfiguration.navigatorKey,
            restorationScopeId: 'rootDashDrop',
            title: 'DashDrop',
            debugShowCheckedModeBanner: false,
            initialRoute: '/checking',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            locale: context.watch<LocalizationProvider>().locale,
            supportedLocales: AppLocalizations.supportedLocales,
            onGenerateRoute: (settings) =>
                RouteConfiguration.onGenerateRoute(settings),
            themeMode: context.watch<ThemeProvider>().isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: GlobalTheme.lightThemeData,
            darkTheme: GlobalTheme.darkThemeData,
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.noScaling),
                child: widget!,
              );
            },
          );
        }));
  }
}
