import 'dart:convert';

import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/custom_widgets/nav/serialization_util.dart';
import 'package:dash_drop/pages/receive_order/domain/entities/sender_location.dart';

class SenderLocationModel extends SenderLocation {

  const SenderLocationModel(
      {required super.id,
      required super.sourceLocation,
      required super.sourceLocationDescription,
      required super.receivingCode});


  factory SenderLocationModel.fromJson(Map<String, dynamic> map) {
    return SenderLocationModel(
      id: map['id'] as int,
      sourceLocation: latLngFromString(map['sourceLocation'])??LatLng1(0, 0),
      sourceLocationDescription: map['sourceLocationDescription'] as String,
      receivingCode: map['receivingCode'] as String,
    );
  }

  SenderLocationModel copyWith({
    int? id,
    LatLng1? sourceLocation,
    String? sourceLocationDescription,
    String? receivingCode,
  }) {
    return SenderLocationModel(
      id: id ?? this.id,
      sourceLocation: sourceLocation ?? this.sourceLocation,
      sourceLocationDescription: sourceLocationDescription ?? this.sourceLocationDescription,
      receivingCode: receivingCode ?? this.receivingCode,
    );
  }
}
