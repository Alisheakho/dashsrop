import 'package:dash_drop/core/services/signalr_services.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/driver/controllers/recivings_controller.dart';
import 'package:dash_drop/driver/pages/widgets/reciving_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lg_signalr_client/lg_signalr_client.dart';

class RecivingsScreen extends StatefulWidget {
  const RecivingsScreen({super.key});
  @override
  State<RecivingsScreen> createState() => _HomePageState();
}

class _HomePageState extends State<RecivingsScreen> {
  HomepageLongRecivingController controller =
      Get.put(HomepageLongRecivingController(), permanent: true);

  @override
  void initState() {
    super.initState();
    controller.hubStart();
  }

  @override
  void dispose() {
    super.dispose();
    if (SignalrServices.to.hubConnection.state ==
        HubConnectionState.Connected) {
      SignalrServices.to.stopHub();
    }
  }

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
    return Scaffold(
        appBar: AppBar(
          title: Text(lang.getText('recivings')),
          centerTitle: true,
        ),
        backgroundColor: const Color(0xFFFEFEFE),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: controller.obx(
                (s) => Obx(
                      () => ListView.builder(
                        itemCount: controller.recivings.length,
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          24.0,
                          0,
                          24.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          print(controller.recivings.length);
                          return RecivingWidget(
                              reciving: controller.recivings[index]);
                        },
                      ),
                    ),
                onEmpty: Center(child: Text(lang.getText('noReciving'))),
                onLoading: const Center(
                  child: CircularProgressIndicator(),
                ),
                onError: (msg) => Center(
                      child: Text("$msg"),
                    )),
          ),
        ));
  }
}
