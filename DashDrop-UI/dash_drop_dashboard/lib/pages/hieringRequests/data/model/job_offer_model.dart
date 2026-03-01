import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../../domain/entities/job_offer.dart';

class JobOfferModel extends JobOffer {
  const JobOfferModel(
      {required super.id,
      required super.description,
      required super.requestDeadlineDate,
      required super.employeeId,
      required super.vehicleDetailId,
      required super.regionId,
      required super.createdAt,
      required super.lastUpdatedAt});


  factory JobOfferModel.fromJson(DataMap map) {
    return JobOfferModel(
      id: map['id'],
      description: map['description'] as String,
      requestDeadlineDate: map['requestDeadlineDate'] as String,
      employeeId: map['employeeId'],
      vehicleDetailId: map['vehicleDetailId'],
      regionId: map['regionId'],
      createdAt: map['createdAt'] as String,
      lastUpdatedAt: map['lastUpdatedAt'] as String,
    );
  }


  @override
  JobOfferModel copyWith({
    int? id,
    String? description,
    String? requestDeadlineDate,
    int? employeeId,
    int? vehicleDetailId,
    int? regionId,
    String? createdAt,
    String? lastUpdatedAt,
  }) {
    return JobOfferModel(
      id: id ?? this.id,
      description: description ?? this.description,
      requestDeadlineDate: requestDeadlineDate ?? this.requestDeadlineDate,
      employeeId: employeeId ?? this.employeeId,
      vehicleDetailId: vehicleDetailId ?? this.vehicleDetailId,
      regionId: regionId ?? this.regionId,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
    );
  }
}
