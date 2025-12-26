
import 'package:dash_drop/custom_widgets/lat_lng.dart';
import 'package:dash_drop/pages/receive_order/domain/entities/polyline_info.dart';

class PolylineInfoModel extends PolylineInfo {

  PolylineInfoModel(
      {
      required super.status,
      required super.points,
      required super.distance,
      required super.duration,
      required super.end_address,
      required super.start_address,
      required super.end_location,
      required super.start_location});

  factory PolylineInfoModel.fromJson(Map<String, dynamic> json) {
    return PolylineInfoModel(
      status: json['status'],
      points: json['routes'][0]['overview_polyline']['points'],
      distance: json['routes'][0]['legs'][0]['distance']['text'],
      duration: json['routes'][0]['legs'][0]['duration']['text'],
      end_address: json['routes'][0]['legs'][0]['end_address'],
      start_address: json['routes'][0]['legs'][0]['start_address'],
      end_location: LatLng1.fromJson(json['routes'][0]['legs'][0]['end_location']),
      start_location: LatLng1.fromJson(json['routes'][0]['legs'][0]['start_location'])    );
  }


  PolylineInfoModel copyWith({
    String? status,
    String? points,
    String? distance,
    String? duration,
    String? end_address,
    String? start_address,
    LatLng1? end_location,
    LatLng1? start_location,
  }) {
    return PolylineInfoModel(
      status: status ?? this.status,
      points: points ?? this.points,
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      end_address: end_address ?? this.end_address,
      start_address: start_address ?? this.start_address,
      end_location: end_location ?? this.end_location,
      start_location: start_location ?? this.start_location,
    );
  }
}
