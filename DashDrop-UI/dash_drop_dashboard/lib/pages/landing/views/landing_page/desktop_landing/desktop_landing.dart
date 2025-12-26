import 'package:dash_drop_dashboard/components/tost.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/drivers/presentation/controller/driver/driver_bloc.dart';
import 'package:dash_drop_dashboard/pages/job_offers/presentation/controller/job_offer_bloc.dart';
import 'package:dash_drop_dashboard/pages/landing/components/price_card.dart';
import 'package:dash_drop_dashboard/pages/landing/formHierning_request.dart';
import 'package:dash_drop_dashboard/pages/landing/widgets/formpage.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/footer.dart';
import 'components/header.dart';

class LandingDesktopView extends StatefulWidget {
  const LandingDesktopView({Key? key}) : super(key: key);

  @override
  State<LandingDesktopView> createState() => _LandingDesktopViewState();
}

class _LandingDesktopViewState extends State<LandingDesktopView> {
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
    return BlocConsumer<JobOfferBloc, JobOfferState>(
      listener: (BuildContext context, JobOfferState state) {},
      buildWhen: (previous, current) =>
          previous.getJobOffersState != current.getJobOffersState ||
          current.deleteJobOfferState == RequestState.loaded,
      builder: (context, state) => _buildWidget(context, state),
    );
  }
}

Widget _buildWidget(BuildContext context, JobOfferState state) {
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
                    padding:
                        const EdgeInsets.only(top: 30, left: 40, right: 40),
                    //HEADER
                    child: desktopHeader(),
                  ),
                ),

                Container(
                  color: Color.fromARGB(42, 230, 222, 251),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 60.0, left: 50, right: 40, bottom: 80.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome to our website  \nfor delivery services.',
                              softWrap: true,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                                color: Color(0XFF192A3E),
                              ),
                              //textAlign: TextAlign.left,

                              //style: TextStyle(
                            ),
                            const SizedBox(height: 15.0),
                            const Text(
                              'Our website provides you with services such as employment.\n You can work through our mobile application\n and be a driver through the mechanism that you have. \nIf you are looking for a job opportunity, \nyou can register with us on the website\n and through it we will contact you to register for a job vacancy.\n You can view employment offers from here.',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0XFF192A3E),
                                // color: Colors.white,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(height: 50.0),
                            InkWell(
                              borderRadius: BorderRadius.circular(10),
                              hoverColor: Color.fromARGB(74, 158, 158, 158),
                              // highlightColor: const Color.fromARGB(124, 135, 90, 248),
                              onTap: (() {}),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  width: 140,
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'View Jop Offer',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF885Af8),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Flexible(child: SizedBox()),
                        Flexible(
                          child: Wrap(
                            children: [
                              Image.asset(
                                'assets/landing/urban_woman.png',
                                // width: 550,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
               if (state.getJobOffersState==RequestState.loaded) 
                
                  Container(
                  width: double.infinity,
                  height: 600,
                  child: Padding(
                    padding: EdgeInsets.only(left: 150,right: 150),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 15.0,
                    
                      ),
                      padding: EdgeInsets.all(10.0),
                      itemCount: state.getJobOffers.length, 
                      
                      itemBuilder: (BuildContext context, int index) {
                        return PriceCards(
                            isPadding: false,
                            height: 0.75,
                            width: 0.2,
                            bundle: 'Jop offer',
                            price:'Discription',
                            createdAt:'${state.getJobOffers[index].createdAt}',
                            type:state.getJobOffers[index].vehicleDetail['type'],
                            rigon:'${state.getJobOffers[index].region['name']}',
                            endDate: '${state.getJobOffers[index].requestDeadlineDate}',
                            description:Text('${state.getJobOffers[index].description}'),
                            buyNow: () {
                                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LandingFormDesktopView(jobOfferId:state.getJobOffers[index].id)));
                            });
                      },
                    ),
                  ),
                )
                else if(state.getJobOffersState==RequestState.loading)
               
       const CommonCard(
          height: 300, child: Center(child: LoadingWidget()))
          else 
   
       CommonCard(
          height: 300,
          child: Center(child: Text("${state.getJobOfferMessage}"))),
                
                
               
               

                desktopFooter(),
              ],
            ),
          ],
        ),
      );
    
  }

