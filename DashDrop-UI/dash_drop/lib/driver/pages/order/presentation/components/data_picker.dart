import 'package:dash_drop/pages/authentication/presentation/screens/login_screen/login_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dash_drop/custom_widgets/custom_calendar.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/custom_widgets/custom_widgets.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  LoginScreenController controller = Get.find<LoginScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: CustomTheme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 48.0, 20.0, 48.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  AppLocalizations.of(context).getText(
                    '5nwiuevf' /* Filter Date */,
                  ),
                  style: CustomTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Text',
                        color: CustomTheme.of(context).primaryTextColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Expanded(
                child: CustomCalendar(
                  initialDate: controller.birthdate,
                  color: CustomTheme.of(context).primaryTheme,
                  iconColor: CustomTheme.of(context).primaryTextColor,
                  weekFormat: false,
                  weekStartsMonday: false,
                  rowHeight: 46.0,
                  onChange: (DateTimeRange? newSelectedDate) {
                    setState(() => controller.birthdate =
                        newSelectedDate?.end);
                  },
                  titleStyle: CustomTheme.of(context).headlineSmall.override(
                        fontFamily: 'SF Pro Text',
                        color: CustomTheme.of(context).primaryTextColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                  dayOfWeekStyle: CustomTheme.of(context).labelLarge.override(
                        fontFamily: 'SF Pro Text',
                        color: CustomTheme.of(context).primaryTextColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                  dateStyle: CustomTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Text',
                        color: CustomTheme.of(context).primaryTextColor,
                        useGoogleFonts: false,
                      ),
                  selectedDateStyle:
                      CustomTheme.of(context).titleSmall.override(
                            fontFamily: 'SF Pro Text',
                            color: CustomTheme.of(context).white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                  inactiveDateStyle:
                      CustomTheme.of(context).labelMedium.override(
                            fontFamily: 'SF Pro Text',
                            color: CustomTheme.of(context).black40,
                            useGoogleFonts: false,
                          ),
                  locale: AppLocalizations.of(context).languageCode,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      onPressed: () {
                        Get.back();
                        
                      },
                      text: AppLocalizations.of(context).getText(
                        'w9t88mxe' /* Cancel */,
                      ),
                      options: ButtonOptions(
                        height: 56.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: CustomTheme.of(context).backgroundColor,
                        textStyle: CustomTheme.of(context).titleSmall.override(
                              fontFamily: 'SF Pro Text',
                              color: CustomTheme.of(context).primaryTheme,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: CustomTheme.of(context).primaryTheme,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ButtonWidget(
                      onPressed: () async {
                        Get.back();
                      },
                      text: AppLocalizations.of(context).getText(
                        '0dl85rrf' /* Apply */,
                      ),
                      options: ButtonOptions(
                        height: 56.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: CustomTheme.of(context).primaryTheme,
                        textStyle: CustomTheme.of(context).titleSmall.override(
                              fontFamily: 'SF Pro Text',
                              color: CustomTheme.of(context).white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: CustomTheme.of(context).primaryTheme,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(width: 16.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
