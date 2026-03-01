import 'package:dash_drop_dashboard/deferred_widget.dart';

import 'package:dash_drop_dashboard/pages/landing/landing_page.dart';

import 'package:dash_drop_dashboard/pages/modal/modal_page.dart'
    deferred as modal;

import 'package:dash_drop_dashboard/pages/table/contacts_page.dart'
    deferred as contacts;

import 'package:dash_drop_dashboard/pages/toast/toast_page.dart'
    deferred as toast;

import 'package:dash_drop_dashboard/pages/tools/tools_page.dart'
    deferred as tools;

import 'package:flutter/material.dart';

import 'package:dash_drop_dashboard/pages/alerts/alert_page.dart'
    deferred as alert;

import 'package:dash_drop_dashboard/pages/button/button_page.dart'
    deferred as button;

import 'package:dash_drop_dashboard/pages/form/form_elements_page.dart'
    deferred as formElements;

import 'package:dash_drop_dashboard/pages/form/form_layout_page.dart'
    deferred as formLayout;

import 'package:dash_drop_dashboard/pages/auth/presentation/screens/login_screen.dart'
    deferred as login;

import 'package:dash_drop_dashboard/pages/calendar/calendar_page.dart'
    deferred as calendar;

import 'package:dash_drop_dashboard/pages/chart/chart_page.dart'
    deferred as chart;

import 'package:dash_drop_dashboard/pages/dashboard/dashdrop_page.dart';

import 'package:dash_drop_dashboard/pages/inbox/index.dart' deferred as inbox;

import 'package:dash_drop_dashboard/pages/invoice/invoice_page.dart'
    deferred as invoice;

import 'package:dash_drop_dashboard/pages/profile/profile_page.dart'
    deferred as profile;

import 'package:dash_drop_dashboard/pages/resetpwd/reset_pwd_page.dart'
    deferred as resetPwd;

import 'package:dash_drop_dashboard/pages/setting/settings_page.dart'
    deferred as settings;

import 'package:dash_drop_dashboard/pages/table/tables_page.dart'
    deferred as tables;

import 'package:dash_drop_dashboard/pages/employees/presentation/screens/employees.dart'
    deferred as employee;

import 'package:dash_drop_dashboard/pages/employees/presentation/screens/create_employee.dart'
    deferred as create_employee;

import 'package:dash_drop_dashboard/pages/employees/presentation/screens/update_employee.dart'
    deferred as update_employee;

import 'package:dash_drop_dashboard/pages/customers/presentation/screen/costomer.dart'
    deferred as customers;

import 'package:dash_drop_dashboard/pages/job_offers/presentation/screens/job_offers.dart'
    deferred as job_offers;

import 'package:dash_drop_dashboard/pages/job_offers/presentation/screens/create_job_offer.dart'
    deferred as create_job_offer;

import 'package:dash_drop_dashboard/pages/job_offers/presentation/screens/update_job_offer.dart'
    deferred as update_job_offer;

import 'pages/check_auth.dart';

import 'package:dash_drop_dashboard/pages/drivers/presentation/screens/driver_screen.dart'
    deferred as drivers;

import 'package:dash_drop_dashboard/pages/drivers/presentation/screens/create_driver.dart'
    deferred as create_driver;

import 'package:dash_drop_dashboard/pages/drivers/presentation/screens/view_details_screen.dart'
    deferred as view_driver;

import 'package:dash_drop_dashboard/pages/drivers/presentation/screens/update_driver.dart'
    deferred as update_driver;

import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/screans/vehicle_screen.dart'
    deferred as vehicle;

import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/screans/view_details_screen.dart'
    deferred as vehicle_view;

import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/screans/create_vehicle.dart'
    deferred as vehicle_create;

import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/screans/update_vehicle.dart'
    deferred as vehicle_update;

import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/screans/hiering_screen.dart'
    deferred as hiering;

import 'package:dash_drop_dashboard/pages/hieringRequests//presentation/screans/view_details_screen.dart'
    deferred as hiering_view;

import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/screans/create_hiering.dart'
    deferred as hiering_create;

import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/screans/update_hiering.dart'
    deferred as hiering_update;

import 'package:dash_drop_dashboard/pages/branches/presentation/ui/branches_view.dart'
    deferred as branch;

typedef PathWidgetBuilder = Widget Function(BuildContext, String?);

final List<Map<String, Object>> MAIN_PAGES = [
  {'routerPath': '/checking', 'widget': const CheckAuth()},
  {'routerPath': '/', 'widget': const DashDropPage()},
  {
    'routerPath': '/landing',
    'widget': const LandingPage(
      title: 'DashDarop',
    )
  },
  {
    'routerPath': '/calendar',
    'widget':
        DeferredWidget(calendar.loadLibrary, () => calendar.CalendarPage())
  },
  {
    'routerPath': '/employees',
    'widget':
        DeferredWidget(employee.loadLibrary, () => employee.EmployeesPage())
  },
  {
    'routerPath': '/branches',
    'widget': DeferredWidget(branch.loadLibrary, () => branch.BranchesPage())
  },
  {
    'routerPath': '/employees/create',
    'widget': DeferredWidget(
        create_employee.loadLibrary, () => create_employee.CreateEmployeePage())
  },
  {
    'routerPath': '/employees/update',
    'widget': DeferredWidget(
        update_employee.loadLibrary, () => update_employee.UpdateEmployeePage())
  },
  {
    'routerPath': '/customers',
    'widget':
        DeferredWidget(customers.loadLibrary, () => customers.CustomersPage())
  },
  {
    'routerPath': '/jobOffers',
    'widget':
        DeferredWidget(job_offers.loadLibrary, () => job_offers.JobOffersPage())
  },
  {
    'routerPath': '/jobOffers/create',
    'widget': DeferredWidget(create_job_offer.loadLibrary,
        () => create_job_offer.CreateJobOfferPage())
  },
  {
    'routerPath': '/JobOffers/update',
    'widget': DeferredWidget(update_job_offer.loadLibrary,
        () => update_job_offer.UpdateJobOfferPage())
  },
  {
    'routerPath': '/drivers',
    'widget': DeferredWidget(drivers.loadLibrary, () => drivers.DriverScreen())
  },
  {
    'routerPath': '/drivers/create',
    'widget': DeferredWidget(
        create_driver.loadLibrary, () => create_driver.CreateDriverPage())
  },
  {
    'routerPath': '/drivers/update',
    'widget': DeferredWidget(
        update_driver.loadLibrary, () => update_driver.UpdateDriverPage())
  },
  {
    'routerPath': '/drivers/view',
    'widget': DeferredWidget(
        view_driver.loadLibrary, () => view_driver.ViewDriverPage())
  },
  {
    'routerPath': '/vehicle',
    'widget': DeferredWidget(vehicle.loadLibrary, () => vehicle.VehicleScreen())
  },
  {
    'routerPath': '/vehicle/view',
    'widget': DeferredWidget(
        vehicle_view.loadLibrary, () => vehicle_view.ViewVehiclePage())
  },
  {
    'routerPath': '/vehicle/update',
    'widget': DeferredWidget(
        vehicle_update.loadLibrary, () => vehicle_update.UpdateVehiclePage())
  },
  {
    'routerPath': '/vehicle/create',
    'widget': DeferredWidget(
        vehicle_create.loadLibrary, () => vehicle_create.CreateVehiclePage())
  },
  {
    'routerPath': '/hiering',
    'widget': DeferredWidget(hiering.loadLibrary, () => hiering.HieringScreen())
  },
  {
    'routerPath': '/hiering/view',
    'widget': DeferredWidget(
        hiering_view.loadLibrary, () => hiering_view.ViewHieringPage())
  },
  {
    'routerPath': '/hiering/update',
    'widget': DeferredWidget(
        hiering_update.loadLibrary, () => hiering_update.UpdateHieringPage())
  },
  {
    'routerPath': '/hiering/create',
    'widget': DeferredWidget(
        hiering_create.loadLibrary, () => hiering_create.CreateHieringPage())
  },
  {
    'routerPath': '/profile',
    'widget': DeferredWidget(profile.loadLibrary, () => profile.ProfilePage())
  },
  {
    'routerPath': '/formElements',
    'widget': DeferredWidget(
        formElements.loadLibrary, () => formElements.FormElementsPage()),
  },
  {
    'routerPath': '/formLayout',
    'widget': DeferredWidget(
        formLayout.loadLibrary, () => formLayout.FormLayoutPage())
  },
  {
    'routerPath': '/login',
    'widget': DeferredWidget(login.loadLibrary, () => login.LoginPage())
  },
  {
    'routerPath': '/resetPwd',
    'widget':
        DeferredWidget(resetPwd.loadLibrary, () => resetPwd.ResetPwdWidget()),
  },
  {
    'routerPath': '/invoice',
    'widget': DeferredWidget(invoice.loadLibrary, () => invoice.InvoicePage())
  },
  {
    'routerPath': '/inbox',
    'widget': DeferredWidget(inbox.loadLibrary, () => inbox.InboxWidget())
  },
  {
    'routerPath': '/tables',
    'widget': DeferredWidget(tables.loadLibrary, () => tables.TablesPage())
  },
  {
    'routerPath': '/settings',
    'widget':
        DeferredWidget(settings.loadLibrary, () => settings.SettingsPage())
  },
  {
    'routerPath': '/basicChart',
    'widget': DeferredWidget(chart.loadLibrary, () => chart.ChartPage())
  },
  {
    'routerPath': '/buttons',
    'widget': DeferredWidget(button.loadLibrary, () => button.ButtonPage())
  },
  {
    'routerPath': '/alerts',
    'widget': DeferredWidget(alert.loadLibrary, () => alert.AlertPage())
  },
  {
    'routerPath': '/contacts',
    'widget':
        DeferredWidget(contacts.loadLibrary, () => contacts.ContactsPage())
  },
  {
    'routerPath': '/tools',
    'widget': DeferredWidget(tools.loadLibrary, () => tools.ToolsPage())
  },
  {
    'routerPath': '/toast',
    'widget': DeferredWidget(toast.loadLibrary, () => toast.ToastPage())
  },
  {
    'routerPath': '/modal',
    'widget': DeferredWidget(modal.loadLibrary, () => modal.ModalPage())
  },
];

class RouteConfiguration {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'Rex');

  static BuildContext? get navigatorContext =>
      navigatorKey.currentState?.context;

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    String path = settings.name!;

    dynamic map =
        MAIN_PAGES.firstWhere((element) => element['routerPath'] == path);

    if (map == null) {
      return null;
    }

    Widget targetPage = map['widget'];

    builder(context, match) {
      return targetPage;
    }

    return NoAnimationMaterialPageRoute<void>(
      builder: (context) => builder(context, null),
      settings: settings,
    );
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required super.builder,
    super.settings,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
