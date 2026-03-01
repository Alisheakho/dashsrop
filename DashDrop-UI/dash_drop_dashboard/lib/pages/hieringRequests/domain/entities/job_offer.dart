import 'package:equatable/equatable.dart';

class JobOffer extends Equatable {
  
  final int id;
  final String description;
  final String requestDeadlineDate;
  final int employeeId;
  final int vehicleDetailId;
  final int regionId;
  final String createdAt;
  final String lastUpdatedAt;

  const JobOffer({
    required this.id,
    required this.description,
    required this.requestDeadlineDate,
    required this.employeeId,
    required this.vehicleDetailId,
    required this.regionId,
    required this.createdAt,
    required this.lastUpdatedAt,
  });


  @override
  List<Object> get props {
    return [
      id,
      description,
      requestDeadlineDate,
      employeeId,
      vehicleDetailId,
      regionId,
      createdAt,
      lastUpdatedAt,
    ];
  }

  JobOffer copyWith({
    String? description,
    String? requestDeadlineDate,
    int? employeeId,
    int? vehicleDetailId,
    int? regionId,
    String? createdAt,
    String? lastUpdatedAt,
  }) {
    return JobOffer(
      id:id,
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
