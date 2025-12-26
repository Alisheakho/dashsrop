// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dash_drop/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class CreateOrderModel extends Equatable {
  String sourceLocation;
  String sourceLocationDescription;
  int? vehicleDetailId;
  bool paymentResponsibility;
  VehicleDetailSearch? vehicleDetailSearch;

   CreateOrderModel({
    required this.sourceLocation,
    required this.sourceLocationDescription,
    required this.vehicleDetailId,
    required this.paymentResponsibility,
    required this.vehicleDetailSearch,
  });

  Map<String, dynamic> toMap() {
    return ({
      'sourceLocation': sourceLocation,
      'sourceLocationDescription': sourceLocationDescription,
      'paymentResponsibility': paymentResponsibility?1:0,
      'vehicleDetailSearch': vehicleDetailSearch?.toMap(),
    });
  }

  @override
  List<Object> get props {
    return [
      sourceLocation,
      sourceLocationDescription,
      paymentResponsibility
    ];
  }
}

class VehicleDetailSearch {
  double heightM;
  double lenghtM;
  double widthM;
  double weightKg;
  VehicleTypes vehicleType;
  SensitivityLevels sensitivityLevel;

  VehicleDetailSearch({
    required this.heightM,
    required this.lenghtM,
    required this.widthM,
    required this.weightKg,
    required this.vehicleType,
    required this.sensitivityLevel,
  });

  Map<String, dynamic> toMap() {
    return {
      'heightM': heightM,
      'lenghtM': lenghtM,
      'widthM': widthM,
      'weightKg': weightKg,
      'vehicleType': vehicleType.index,
      'sensitivityLevel': sensitivityLevel.index,
    };
  }
}
