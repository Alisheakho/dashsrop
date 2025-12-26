import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../repository/base_job_offers_repository.dart';

class UpdateJobOfferUseCase
    extends BaseUseCase<void, UpdateJobOfferParameters> {
  UpdateJobOfferUseCase(this.jobOffersRepository);

  final BaseJobOffersRepository jobOffersRepository;

  @override
  ResultVoid call(UpdateJobOfferParameters parameters) async =>
      jobOffersRepository.updateJobOffer(
        id: parameters.id,
        description: parameters.description,
        requestDeadlineDate: parameters.requestDeadlineDate,
        vehicleDetailId: parameters.vehicleDetailId,
        regionId: parameters.regionId
      );
}

class UpdateJobOfferParameters extends Equatable {
  final int id;
  final String description;
  final String requestDeadlineDate;
  final int vehicleDetailId;
  final int regionId;

  const UpdateJobOfferParameters({
    required this.id,
    required this.description,
    required this.requestDeadlineDate,
    required this.vehicleDetailId,
    required this.regionId,
  });


  @override
  List<Object> get props {
    return [
      id,
      description,
      requestDeadlineDate,
      vehicleDetailId,
      regionId,
    ];
  }
}
