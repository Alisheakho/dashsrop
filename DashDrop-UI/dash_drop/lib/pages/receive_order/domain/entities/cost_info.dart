// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:equatable/equatable.dart';

class CostInfo extends Equatable {
  final double cost;
  final int paymentResponsibility;
  final String firstName;
  final String estimatedTime;

  CostInfo({
    required this.cost,
    required this.paymentResponsibility,
    required this.firstName,
    required this.estimatedTime,
  });

  @override
  List<Object> get props => [cost, paymentResponsibility, firstName, estimatedTime];
}
