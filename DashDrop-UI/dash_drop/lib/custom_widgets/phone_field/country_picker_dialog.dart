// ignore_for_file: library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';

import 'countries.dart';

class PickerDialogStyle {
  final Color? backgroundColor;

  final TextStyle? countryCodeStyle;

  final TextStyle? countryNameStyle;

  final Widget? listTileDivider;

  final EdgeInsets? listTilePadding;

  final EdgeInsets? padding;

  final Color? searchFieldCursorColor;

  final InputDecoration? searchFieldInputDecoration;

  final EdgeInsets? searchFieldPadding;

  final double? width;

  PickerDialogStyle({
    this.backgroundColor,
    this.countryCodeStyle,
    this.countryNameStyle,
    this.listTileDivider,
    this.listTilePadding,
    this.padding,
    this.searchFieldCursorColor,
    this.searchFieldInputDecoration,
    this.searchFieldPadding,
    this.width,
  });
}

class CountryPickerDialog extends StatefulWidget {
  final List<Country> countryList;
  final Country selectedCountry;
  final ValueChanged<Country> onCountryChanged;
  final String searchText;
  final List<Country> filteredCountries;
  final PickerDialogStyle? style;
  final String languageCode;

  const CountryPickerDialog({
    Key? key,
    required this.searchText,
    required this.languageCode,
    required this.countryList,
    required this.onCountryChanged,
    required this.selectedCountry,
    required this.filteredCountries,
    this.style,
  }) : super(key: key);

  @override
  _CountryPickerDialogState createState() => _CountryPickerDialogState();
}

class _CountryPickerDialogState extends State<CountryPickerDialog> {
  late List<Country> _filteredCountries;
  late Country _selectedCountry;

  @override
  void initState() {
    _selectedCountry = widget.selectedCountry;
    _filteredCountries = widget.filteredCountries.toList()
      ..sort(
        (a, b) => a
            .localizedName(widget.languageCode)
            .compareTo(b.localizedName(widget.languageCode)),
      );

    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomTheme.of(context).white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  color: CustomTheme.of(context).white),
              child: Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 22),
                child: Center(
                    child: Text(
                  "Select country",
                  style: CustomTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Text',
                        color: CustomTheme.of(context).primaryTextColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                )),
              )),
          const SizedBox(height: 12),
          Container(
            color: CustomTheme.of(context).white,
            height: 500,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 16, right: 16),
                shrinkWrap: true,
                itemCount: _filteredCountries.length,
                itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () {
                        _selectedCountry = _filteredCountries[index];
                        widget.onCountryChanged(_selectedCountry);
                        setState(() {
                          currentIndex = index;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 4),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              color: CustomTheme.of(context).black20,
                              width: 1.0,
                            ),
                          )),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      _filteredCountries[index]
                                          .localizedName(widget.languageCode),
                                      style: CustomTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: CustomTheme.of(context)
                                                .primaryTextColor,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Text(
                                      ' (+${_filteredCountries[index].dialCode})',
                                      style: CustomTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: CustomTheme.of(context)
                                                .primaryTextColor,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                                _selectedCountry == _filteredCountries[index]
                                    ? SvgPicture.asset(
                                        'assets/images/tick fill.svg',
                                        width: 24,
                                        height: 24,
                                        fit: BoxFit.cover,
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ),
                        ),
                      ),
                    )

                //     Column(
                //   children: <Widget>[
                //     ListTile(
                //       // leading:
                //       // kIsWeb
                //       //     ? Image.asset(
                //       //   'assets/flags/${_filteredCountries[index].code.toLowerCase()}.png',
                //       //   package: 'intl_phone_field',
                //       //   width: 32,
                //       // )
                //       //     : Text(
                //       //   _filteredCountries[index].flag,
                //       //   style: TextStyle(fontSize: 18),
                //       // ),
                //       // contentPadding: widget.style?.listTilePadding,
                //       title: Text(
                //         _filteredCountries[index]
                //             .localizedName(widget.languageCode),
                //         style: widget.style?.countryNameStyle ??
                //             TextStyle(fontWeight: FontWeight.w700),
                //       ),
                //       trailing: Text(
                //         '+${_filteredCountries[index].dialCode}',
                //         style: widget.style?.countryCodeStyle ??
                //             TextStyle(fontWeight: FontWeight.w700),
                //       ),
                //       onTap: () {
                //         _selectedCountry = _filteredCountries[index];
                //         widget.onCountryChanged(_selectedCountry);
                //         Navigator.of(context).pop();
                //       },
                //     ),
                //     widget.style?.listTileDivider ?? Divider(thickness: 1),
                //   ],
                // ),
                ),
          ),
        ],
      ),
    );
  }
}
