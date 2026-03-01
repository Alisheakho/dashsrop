library dashdrop_uikit;

import 'package:dashdrop_uikit/core/theme/dashdrop_colors.dart';
import 'package:flutter/material.dart';

class OutBorderTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final int? maxLines;
  final TextEditingController? controller;
  final bool? enabled;
  final Widget? suffixWidget;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final bool readOnly;
  final Widget? icon;
  final FormFieldValidator? validator;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? focusColor;
  final void Function(String?)? onSave;
  final AutovalidateMode? autovalidateMode;
  const OutBorderTextFormField(
      {super.key,
      this.labelText,
      this.initialValue,
      this.hintText,
      this.hintStyle,
      this.maxLines = 1,
      this.enabled,
      this.controller,
      this.suffixWidget,
      this.obscureText,
      this.keyboardType,
      this.icon,
      this.validator,
      this.textInputAction,
      this.onFieldSubmitted,
      this.textStyle,
      this.focusColor,
      this.onSave,
      this.readOnly = false,
      this.autovalidateMode,
      FormFieldSetter<String>? onSaved});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText ?? '',
            style: const TextStyle(fontSize: 14),
          ),
        if (labelText != null)
          const SizedBox(
            height: 8,
          ),
        SizedBox(
          width: double.maxFinite,
          height: maxLines == 1 ? 50 : null,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: TextFormField(
                  keyboardType: keyboardType,
                  obscureText: obscureText ?? false,
                  enabled: enabled,
                  initialValue: initialValue,
                  controller: controller,
                  maxLines: maxLines,
                  validator: validator,
                  textInputAction: textInputAction,
                  onFieldSubmitted: onFieldSubmitted,
                  style: textStyle,
                  onSaved: onSave,
                  readOnly: readOnly,
                  decoration: InputDecoration(
                      prefixIcon: icon,
                      suffixIcon: suffixWidget != null
                          ? Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: suffixWidget)
                          : null,
                      prefixIconConstraints: const BoxConstraints(
                        maxWidth: 35,
                        maxHeight: 35,
                      ),
                      labelText: '',
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: DashDropColors.border, width: 1)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: DashDropColors.border, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: (focusColor ?? DashDropColors.primary),
                              width: 1)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1)),
                      errorStyle: const TextStyle(
                          color: Colors.red, fontSize: 12, height: 2),
                      error: null,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: hintText,
                      hintStyle: hintStyle),
                ),
              ),
              // if (suffixWidget != null)
              //   Align(
              //     alignment: Alignment.centerRight,
              //     child: Container(
              //       margin: const EdgeInsets.only(right: 10),
              //       child: suffixWidget,
              //     ),
              //   )
            ],
          ),
        )
      ],
    );
  }
}
