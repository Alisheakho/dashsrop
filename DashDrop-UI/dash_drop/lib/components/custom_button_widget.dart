// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';

class CustomButtonWidget extends StatefulWidget {
  const CustomButtonWidget({
    super.key,
    String? tittle
 
  }) : this.tittle = tittle ?? 'tittle';

  final String tittle;

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.0,
      decoration: BoxDecoration(
        color: CustomTheme.of(context).primaryTheme,
        borderRadius: BorderRadius.circular(12.0),
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Text(
          widget.tittle,
          style: CustomTheme.of(context).bodyMedium.override(
                fontFamily: 'SF Pro Text',
                color: CustomTheme.of(context).white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                useGoogleFonts: false,
                lineHeight: 1.5,
              ),
        ),
      ),
    );
  }
}
