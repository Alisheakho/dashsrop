// ignore_for_file: deprecated_member_use
import 'package:dash_drop/core/services/signalr_services.dart';
import 'package:dash_drop/driver/controllers/driver_location_controller.dart';
import 'package:dash_drop/driver/controllers/recivings_controller.dart';
import 'package:dash_drop/pages/authentication/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dash_drop/custom_widgets/custom_animations.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/pages/home_screen/home_controller.dart';
import 'package:dash_drop/routes/app_routes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lg_signalr_client/lg_signalr_client.dart';

class HomeDriverPage extends StatefulWidget {
  const HomeDriverPage({super.key});

  @override
  State<HomeDriverPage> createState() {
    HomepageLongRecivingController.delete;
    return _HomePageState();
  }
}

class _HomePageState extends State<HomeDriverPage> {
  HomePageController controller = Get.put(HomePageController());
  DriverLocationController driverLocationController = Get.put(
    DriverLocationController(),
  );
  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.linear,
          delay: 50.ms,
          duration: 400.ms,
          begin: const Offset(0.0, -10.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeOut,
          delay: 50.ms,
          duration: 400.ms,
          begin: const Offset(100.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation1': AnimationInfo(
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
    'listViewOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeOut,
          delay: 50.ms,
          duration: 400.ms,
          begin: const Offset(100.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
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
    'imageOnPageLoadAnimation3': AnimationInfo(
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
    var lang = AppLocalizations.of(context);
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }
    if (SignalrServices.to.hubConnection.state ==
        HubConnectionState.Connected) {
      SignalrServices.to.hubConnection.stop();
    }
    return GestureDetector(
      onTap: () => controller.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(controller.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: CustomTheme.of(context).backgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  20.0,
                  24.0,
                  20.0,
                  24.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).secondaryTheme,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset('assets/images/Avatar.png').image,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          8.0,
                          0.0,
                          0.0,
                          0.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lang.getText('hello' /* Hello */) +
                                  AuthController.to.user.name,
                              maxLines: 1,
                              style: CustomTheme.of(context).bodyMedium
                                  .override(
                                    fontFamily: 'SF Pro Text',
                                    color: CustomTheme.of(
                                      context,
                                    ).primaryTextColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                    lineHeight: 1.5,
                                  ),
                            ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation']!,
                            ),
                            Text(
                              AuthController.to.user.text,
                              maxLines: 1,
                              style: CustomTheme.of(context).bodyMedium
                                  .override(
                                    fontFamily: 'SF Pro Text',
                                    color: CustomTheme.of(context).black40,
                                    fontSize: 12.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Get.toNamed(AppRoutes.notificationsScreenWidget);
                      },
                      child: InkWell(
                        child: Container(
                          width: 44.0,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: CustomTheme.of(context).black10,
                            shape: BoxShape.circle,
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/notification_home.svg',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Center(
                      child: Obx(
                        () => GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition:
                              driverLocationController.initLocation,
                          myLocationButtonEnabled: true,
                          myLocationEnabled: true,
                          zoomControlsEnabled: false,
                          onMapCreated: (GoogleMapController mapController) {
                            // Get the MapId
                            print("Map ID: ${mapController.mapId}");
                            if (!driverLocationController
                                .gMapsController
                                .isCompleted) {
                              driverLocationController.gMapsController.complete(
                                mapController,
                              );
                            }
                          },
                          markers: Set<Marker>.of(
                            driverLocationController.markers,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(20),
                      child: InkWell(
                        onTap: () async {
                          Get.toNamed(AppRoutes.recivingsScreen);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 56.0,
                          decoration: BoxDecoration(
                            color: CustomTheme.of(context).primaryTheme,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              lang.getText('startStream'),
                              style: CustomTheme.of(context).bodyMedium
                                  .override(
                                    fontFamily: 'SF Pro Text',
                                    color: CustomTheme.of(context).white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                        ),
                      ),
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
