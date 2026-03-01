import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

//
class PriceCards extends StatefulWidget {
  //
  dynamic isPadding = false;
  final double height;
  final double width;
  final String? bundle;
  final String? price;
  final Function? buyNow;
  final Widget? description;
  final String createdAt;
  final int type;
  final String rigon;
  final String endDate;
  //
  PriceCards({
    Key? key,
    this.bundle,
    required this.isPadding,
    this.price,
    this.buyNow,
    this.description,
    required this.height,
    required this.width,
    required this.createdAt,
    required this.type,
    required this.rigon,
    required this.endDate,
  }) : super(key: key);

  @override
  State<PriceCards> createState() => _PriceCardsState();
}

class _PriceCardsState extends State<PriceCards> {
  // setState(){

  // }
  get buyNow => widget.buyNow;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        
        height: MediaQuery.of(context).size.height * widget.height,
        width: MediaQuery.of(context).size.height * widget.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: [
              if (widget.isPadding == true)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Container(
                    height: 50,
                    width: 250,
                    child: const Center(
                      child: Text(
                        'Recommended',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFC76B),
                      //border: Border.all(color: const Color(0xFF885Af8)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              Row(
                children: [
                   Center(
                    child: Text(
                      '${widget.bundle}',
                      // style:  TextStyle(
                      //   color: Colors.black,
                      //   fontSize: 24,
                      // ),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                        color: Color(0XFF192A3E),
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(left:15),
                    child: Text('${ timeago.format(DateTime.parse(widget.createdAt))}'),
                  ),
                 
                ],
              ),
      
             
      
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${widget.price}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
      
              // widget.description,
              //${widget.description}
      
              Container(child: widget.description),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    'Region :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.rigon}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    'End date :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${DateFormat('yyyy/MM/dd').format(DateTime.parse(widget.endDate))}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    'Vehicle type :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  widget.type==0?
                  Text(
                    'Bicycle',
                    style: TextStyle(fontSize: 20),
                  ):widget.type==1?
                  Text(
                    'Motorcycle',
                    style: TextStyle(fontSize: 20),
                  ):widget.type==2?
                  Text(
                    'car',
                    style: TextStyle(fontSize: 20),
                  ):widget.type==3?
                  Text(
                    'van',
                    style: TextStyle(fontSize: 20),
                  ):widget.type==4?
                  Text(
                    'pickTruck',
                    style: TextStyle(fontSize: 20),
                  ):Text(
                    'Truck',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              
      const SizedBox(height: 50.0),
              GestureDetector(
                onTap: buyNow,
                child: Container(
                  height: 50,
                  width: 250,
                  child: const Center(
                    child: Text(
                      'Apply now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF885Af8),
                    //border: Border.all(color: const Color(0xFF885Af8)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          
          boxShadow: [
            BoxShadow(
              //885AF8
               
              color: Colors.white,
              spreadRadius: 10,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
          //color: Colors.grey,
          color: const Color(0XFFF5F5F5),
          //border: Border.all(color: const Color(0xFF885Af8)),
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
