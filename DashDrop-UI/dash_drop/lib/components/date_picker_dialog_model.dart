import 'package:get/get.dart';
import 'package:dash_drop/custom_widgets/custom_calendar.dart';

import 'package:flutter/material.dart';

class DatePickerDialogController extends GetxController {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
