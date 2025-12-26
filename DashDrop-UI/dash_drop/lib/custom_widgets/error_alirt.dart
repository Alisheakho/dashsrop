import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ErrorAlirt extends StatelessWidget {
  const ErrorAlirt({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomTheme.of(context).secondaryTheme,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(14.0, 12.0, 14.0, 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: SvgPicture.asset(
                'assets/images/info.svg',
                width: 18.0,
                height: 18.0,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Text(
                  message,
                  maxLines: 2,
                  style: CustomTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Text',
                        color: CustomTheme.of(context).primaryTheme,
                        useGoogleFonts: false,
                        lineHeight: 1.5,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
