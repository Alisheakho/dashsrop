import 'package:dash_drop_dashboard/components/tost.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/drivers/presentation/controller/driver/driver_bloc.dart';
import 'package:dash_drop_dashboard/pages/job_offers/presentation/controller/job_offer_bloc.dart';
import 'package:dash_drop_dashboard/pages/landing/components/price_card.dart';
import 'package:dash_drop_dashboard/pages/landing/formHierning_request.dart';
import 'package:dash_drop_dashboard/pages/landing/views/landing_page/desktop_landing/components/footer.dart';
import 'package:dash_drop_dashboard/pages/landing/views/landing_page/desktop_landing/components/header.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingFormDesktopView extends StatefulWidget {
  final int jobOfferId;
  LandingFormDesktopView({Key? key, required this.jobOfferId})
      : super(key: key);
  @override
  State<LandingFormDesktopView> createState() =>
      _LandingDesktopViewState();
}

class _LandingDesktopViewState extends State<LandingFormDesktopView> {

  // Function onTap(Function value) {
  //   print('Support Page');
  //    Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) =>  value
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    ;
    return Scaffold(
      body: _buildWidget(context,widget.jobOfferId),
    );
  }
}

Widget _buildWidget(BuildContext context ,int jobOfferId) {
  final screenWidth = MediaQuery.of(context).size.width;

  context.read<JobOfferBloc>().add(GetJobOffersEvent());

  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 50.0);
  return RawScrollbar(
    controller: _scrollController,
    thumbVisibility: true,
    radius: const Radius.circular(10.0),
    //trackVisibility: true,
    thumbColor: const Color(0xFF885Af8),

    child: ListView(
      controller: _scrollController,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Color.fromARGB(42, 230, 222, 251),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
                //HEADER
                child: desktopHeader(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 60, bottom: 20, left: 120, right: 120),
              child: Text(
                'You can apply for the vacancy by filling in the following fields. Please, if you want to apply for this vacancy, fill in these fields',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200, left: 200, bottom: 50),
              child: CreateHierningForm(jobOfferId: jobOfferId),
            ),
            desktopFooter(),
          ],
        ),
      ],
    ),
  );
}
