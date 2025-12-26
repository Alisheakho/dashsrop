
// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
import 'package:country_code_picker/country_code_picker.dart';

class CountryCodeWidget extends StatefulWidget {
  const CountryCodeWidget({
    Key? key,
    this.width,
    this.height,
    required this.color,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color color;

  @override
  _CountryCodeWidgetState createState() => _CountryCodeWidgetState();
}

class _CountryCodeWidgetState extends State<CountryCodeWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
            child: Container(
          height: widget.height,
          width: widget.width,
          // margin: EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            color: widget.color,
            //  borderRadius: BorderRadius.circular(22)
          ),
          child: CountryCodePicker(
            onChanged: print,
            backgroundColor: widget.color,
            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
            initialSelection: 'TR',
            favorite: const ['+90', 'TR'],
            padding: EdgeInsets.zero,

            // optional. Shows only country name and flag
            showCountryOnly: false,
            showFlag: false,

            showDropDownButton: true,
            // optional. Shows only country name and flag when popup is closed.
            showOnlyCountryWhenClosed: false,
            // optional. aligns the flag and the Text left
            alignLeft: false,
          ),
        )),
      );
}
