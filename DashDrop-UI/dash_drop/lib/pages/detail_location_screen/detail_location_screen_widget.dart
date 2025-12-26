import 'package:dash_drop/core/utils/enums.dart';
import 'package:dash_drop/custom_widgets/show_dialog.dart';
import 'package:dash_drop/pages/detail_location_screen/presentation/widgets/qr_code_dialog.dart';
import 'package:dash_drop/pages/order/data/model/oeder_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '/components/custom_button_widget.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'presentation/controllers/track_location_controller.dart';

class DetailLocationScreenWidget extends StatefulWidget {
  const DetailLocationScreenWidget({super.key});

  @override
  State<DetailLocationScreenWidget> createState() {
    return _DetailLocationScreenWidgetState();
  }
}

class _DetailLocationScreenWidgetState
    extends State<DetailLocationScreenWidget> {
  TrackLocationController controller = Get.put(TrackLocationController());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late OrderModel trackOrder;
  @override
  void initState() {
    super.initState();
    trackOrder = Get.arguments as OrderModel;
    controller.drowPolyline(trackOrder.polyLine!);
    controller.orderId.value = trackOrder.id;
    controller.orderStatus.value = trackOrder.status;
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => controller.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(controller.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomTheme.of(context).backgroundColor,
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Container(
                height: Get.height * 0.09,
                decoration: BoxDecoration(
                  color: CustomTheme.of(context).backgroundColor,
                ),
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Get.back();
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: CustomTheme.of(context).backgroundColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: CustomTheme.of(context).containerBorder,
                            ),
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/Arrow_back.svg',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context).getText(
                          'g51wgvxj' /* Detail Location */,
                        ),
                        textAlign: TextAlign.center,
                        style: CustomTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Text',
                              color: CustomTheme.of(context).primaryTextColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                              lineHeight: 1.5,
                            ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.87,
                child: Stack(
                  children: [
                    Obx(
                      () => GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: controller.initLocation.value,
                          // myLocationButtonEnabled: true,
                          // myLocationEnabled: true,
                          onMapCreated: (GoogleMapController mapController) {
                            // Get the MapId
                            print("Map ID: ${mapController.mapId}");
                            if (!controller.gMapsController.isCompleted) {
                              controller.gMapsController
                                  .complete(mapController);
                            }
                          },
                          // onTap: (LatLng latlng) {
                          //   print(latlng.toString());
                          //   controller.setPoint(
                          //       LatLng1(latlng.latitude, latlng.longitude));
                          //   setState(() {});
                          // },
                          markers: Set<Marker>.of(controller.markers),
                          polylines:
                              Set<Polyline>.of(controller.polylines.values)),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        height: 306.0,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).backgroundColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(24.0),
                            topRight: Radius.circular(24.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment:
                                    const AlignmentDirectional(0.0, -1.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {},
                                  child: Container(
                                    width: 60.0,
                                    height: 6.0,
                                    decoration: BoxDecoration(
                                      color: CustomTheme.of(context).black20,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        AppLocalizations.of(context).getText(
                                          'q1rj09vv' /* Your order is on The Way */,
                                        ),
                                        maxLines: 1,
                                        style: CustomTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'SF Pro Text',
                                              color: CustomTheme.of(context)
                                                  .primaryTextColor,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 4.0, 0.0, 16.0),
                                      child: Text(
                                        "${AppLocalizations.of(context).getText(
                                          '05gf3f83' /*pick up point is  */,
                                        )} ${trackOrder.destinationLocationDescription}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'SF Pro Text',
                                              color: CustomTheme.of(context)
                                                  .black40,
                                              useGoogleFonts: false,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ),
                                    Divider(
                                      height: 0.0,
                                      thickness: 1.0,
                                      color: CustomTheme.of(context).grey,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 16.0, 0.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.account_circle_outlined,
                                              size: 44.0,
                                              color: CustomTheme.of(context)
                                                  .primaryTheme,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      14.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${trackOrder.driver?['firstName']} ${trackOrder.driver?['lastName']}',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: CustomTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .primaryTextColor,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                  Text(
                                                    '${trackOrder.driver?['phoneNumber']}',
                                                    maxLines: 1,
                                                    style: CustomTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 12.0,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10.0, 0.0, 5.0, 0.0),
                                            child: InkWell(
                                              onTap: () async {
                                                if (trackOrder.driver?[
                                                        'phoneNumber'] !=
                                                    null) {
                                                  Uri _url = Uri.parse(
                                                      'https://wa.me/${trackOrder.driver?['phoneNumber']}');
                                                  if (!await launchUrl(_url)) {
                                                    print(
                                                        'Could not launch $_url');
                                                  }
                                                }
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/whatsapp_green.svg',
                                                  width: 24.0,
                                                  height: 24.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0.0,
                                      thickness: 1.0,
                                      color: CustomTheme.of(context).grey,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 16.0, 0.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '${trackOrder.receivingCode}',
                                                  style: CustomTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Text',
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryTextColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Receiving Code',
                                                    style: CustomTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 12.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '${trackOrder.estimatedTime}'
                                                      .substring(0, 8),
                                                  style: CustomTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Text',
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryTextColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                        .getText(
                                                      'ab8t3ymv' /* Estimate Time */,
                                                    ),
                                                    style: CustomTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 12.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '\$${trackOrder.deliveryCost?.toStringAsFixed(2)}',
                                                  style: CustomTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Text',
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryTextColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Cost',
                                                    style: CustomTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 12.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 16.0, 0.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '${trackOrder.extraProfitRate?.toStringAsFixed(2)}',
                                                  style: CustomTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Text',
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryTextColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Extra profit rate',
                                                    style: CustomTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 12.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '${trackOrder.pathLengthKm?.toStringAsFixed(3)} Km',
                                                  style: CustomTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Text',
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryTextColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Path Length',
                                                    style: CustomTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 12.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '${SensitivityLevels.values[trackOrder.vehicleDetail?['sensitivityLevel']].name}',
                                                  style: CustomTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Text',
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryTextColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Sensitivity',
                                                    style: CustomTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 12.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => controller.orderStatus.value == 6
                          ? Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 24.0, 20.0, 46.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (trackOrder.receivingCode != null) {
                                      ShowDialog(
                                          dialogWidget: QrCodeDialogWidget(
                                              receivingCode:
                                                  trackOrder.receivingCode!));
                                    }
                                  },
                                  child: const CustomButtonWidget(
                                    tittle: 'Show QR code',
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
