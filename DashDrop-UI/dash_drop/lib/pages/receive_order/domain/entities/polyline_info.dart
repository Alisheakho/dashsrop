// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:equatable/equatable.dart';

class PolylineInfo extends Equatable {

  final String status;
  final String points;
  final String distance;
  final String duration;
  final String end_address;
  final String start_address;
  final LatLng1 end_location;
  final LatLng1 start_location;
  
  const PolylineInfo({
    required this.status,
    required this.points,
    required this.distance,
    required this.duration,
    required this.end_address,
    required this.start_address,
    required this.end_location,
    required this.start_location,
  });



  @override
  List<Object> get props {
    return [
      status,
      points,
      distance,
      duration,
      end_address,
      start_address,
      end_location,
      start_location,
    ];
  }
}
