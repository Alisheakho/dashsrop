import 'package:get/get.dart';
import 'package:dash_drop/components/no_order_yet_container_model.dart';
import '/components/dialog_button_widget.dart';
import 'package:dash_drop/custom_widgets/custom_animations.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';

export 'no_order_yet_container_model.dart';

class NoOrderYetContainerWidget extends StatefulWidget {
  const NoOrderYetContainerWidget({super.key});

  @override
  State<NoOrderYetContainerWidget> createState() =>
      _NoOrderYetContainerWidgetState();
}

class _NoOrderYetContainerWidgetState extends State<NoOrderYetContainerWidget>
    with TickerProviderStateMixin {
  NoOrderYetContainerController controller =
      Get.put(NoOrderYetContainerController());

  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 500.ms,
          begin: 0.5,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: CustomTheme.of(context).backgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Image.asset(
              'assets/images/No_Order_yet!.png',
              width: 188.0,
              height: 188.0,
              fit: BoxFit.cover,
            ),
          ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 8.0),
            child: Text(
              AppLocalizations.of(context).getText(
                'ib5bqs6p' /* No Order yet! */,
              ),
              textAlign: TextAlign.center,
              style: CustomTheme.of(context).bodyMedium.override(
                    fontFamily: 'SF Pro Text',
                    color: CustomTheme.of(context).primaryTextColor,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                    lineHeight: 1.5,
                  ),
            ),
          ),
          Text(
            AppLocalizations.of(context).getText(
              'v58hc1ql' /* Add items to your order list */,
            ),
            textAlign: TextAlign.center,
            style: CustomTheme.of(context).bodyMedium.override(
                  fontFamily: 'SF Pro Text',
                  color: CustomTheme.of(context).black40,
                  fontSize: 16.0,
                  useGoogleFonts: false,
                ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(119.0, 40.0, 119.0, 0.0),
            child: DialogButtonWidget(
              tittle: 'Add',
            ),
          ),
        ],
      ),
    );
  }
}
