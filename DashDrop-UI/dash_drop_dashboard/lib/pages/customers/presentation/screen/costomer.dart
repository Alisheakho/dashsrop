import 'package:dash_drop_dashboard/pages/customers/presentation/components/customer_table.dart';
import 'package:dash_drop_dashboard/pages/customers/presentation/controller/customer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dash_drop_dashboard/pages/layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomersPage extends LayoutWidget {
  const CustomersPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.customerPageTitle;
  }

  @override
  // TODO: implement isContentScroll
  bool get isContentScroll => true;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    context.read<CustomerBloc>().add(GetCustomersEvent());
    return const CustomersTableWidget();
  }
}
