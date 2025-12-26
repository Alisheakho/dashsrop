import 'package:dash_drop/pages/receive_order/domain/entities/cost_info.dart';

class CostInfoModel extends CostInfo {
  CostInfoModel(
      {required super.cost,
      required super.paymentResponsibility,
      required super.firstName,
      required super.estimatedTime});
  
  factory CostInfoModel.fromJson(Map<String, dynamic> json) {
    return CostInfoModel(
      cost: json['cost'] as double,
      paymentResponsibility: json['paymentResponsibility'] as int,
      firstName: json['senderCustomer']['firstName'] as String,
      estimatedTime: json['estimatedTime'] as String,
    );
  }

  CostInfoModel copyWith({
    double? cost,
    int? paymentResponsibility,
    String? firstName,
    String? estimatedTime,
  }) {
    return CostInfoModel(
      cost: cost ?? this.cost,
      paymentResponsibility: paymentResponsibility ?? this.paymentResponsibility,
      firstName: firstName ?? this.firstName,
      estimatedTime: estimatedTime ?? this.estimatedTime,
    );
  }



 
}
