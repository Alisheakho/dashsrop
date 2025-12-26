import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:equatable/equatable.dart';

class SenderLocation extends Equatable {
  final int id;
  final LatLng1 sourceLocation;
  final String sourceLocationDescription;
  final String receivingCode;
  const SenderLocation({
    required this.id,
    required this.sourceLocation,
    required this.sourceLocationDescription,
    required this.receivingCode,
  });

  @override
  List<Object> get props =>
      [id, sourceLocation, sourceLocationDescription, receivingCode];

}
