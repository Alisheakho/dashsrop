import 'package:dash_drop/driver/controllers/recivings_controller.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '/components/custom_appbar_widget.dart';
import '/components/scan_barcode_success_dialog_widget.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'scan_barcode_screen_model.dart';
export 'scan_barcode_screen_model.dart';

class ScanBarcodeScreenWidget extends StatefulWidget {
  const ScanBarcodeScreenWidget({super.key});
  @override
  State<ScanBarcodeScreenWidget> createState() =>
      _ScanBarcodeScreenWidgetState();
}

class _ScanBarcodeScreenWidgetState extends State<ScanBarcodeScreenWidget> {
  ScanBarcodeScreenController controller =
      Get.put(ScanBarcodeScreenController());

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;
  QRViewController? qcontroller;
  int? orderid;
  String? receivingCode;

  void _onQRViewCreated(QRViewController qcont) {
    qcontroller = qcont;
    qcontroller?.scannedDataStream.listen((scanData) {
      result = scanData;
      if (scanData.code != null && orderid != null && receivingCode != null) {
        if(receivingCode == scanData.code){
          HomepageLongRecivingController.to
            .atDestinationLocation(orderid!, scanData.code!);
        }
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    orderid = Get.arguments[0];
    receivingCode = Get.arguments[1];
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
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 1.0),
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppbarWidget(
                    text: 'Scan Barcode',
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 22.0, 20.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        child: Container(
                          width: double.infinity,
                          height: 578.0,
                          child: QRView(
                              key: qrKey, onQRViewCreated: _onQRViewCreated),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  height: 154.0,
                  decoration: BoxDecoration(
                    color: CustomTheme.of(context).backgroundColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 8.0, 0.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 24.0),
                          child: Container(
                            width: 34.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: CustomTheme.of(context).black20,
                              borderRadius: BorderRadius.circular(1000.0),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: CustomTheme.of(context).backgroundColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: CustomTheme.of(context).primaryTheme,
                                ),
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                            ),
                            Builder(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  print('${result?.code}');
                                  // await showDialog(
                                  //   context: context,
                                  //   builder: (dialogContext) {
                                  //     return Dialog(
                                  //       elevation: 0,
                                  //       insetPadding: EdgeInsets.zero,
                                  //       backgroundColor: Colors.transparent,
                                  //       alignment:
                                  //           const AlignmentDirectional(0.0, 0.0)
                                  //               .resolve(
                                  //                   Directionality.of(context)),
                                  //       child: GestureDetector(
                                  //         onTap: () => controller
                                  //                 .unfocusNode.canRequestFocus
                                  //             ? FocusScope.of(context)
                                  //                 .requestFocus(
                                  //                     controller.unfocusNode)
                                  //             : FocusScope.of(context)
                                  //                 .unfocus(),
                                  //         child:
                                  //             const ScanBarcodeSuccessDialogWidget(),
                                  //       ),
                                  //     );
                                  //   },
                                  // ).then((value) => setState(() {}));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/scan_button.png',
                                    width: 96.0,
                                    height: 96.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: CustomTheme.of(context).backgroundColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: CustomTheme.of(context).primaryTheme,
                                ),
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
