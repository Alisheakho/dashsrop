import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../entities/job_offer.dart';
import '../repository/base_job_offers_repository.dart';

class CreateJobOfferUseCase
    extends BaseUseCase<void, CreateJobOfferParameters> {
  CreateJobOfferUseCase(this.jobOffersRepository);

  final BaseJobOffersRepository jobOffersRepository;

  @override
  ResultFuture<JobOffer> call(CreateJobOfferParameters parameters) async =>
      jobOffersRepository.createJobOffer(
        description: parameters.description,
        requestDeadlineDate: parameters.requestDeadlineDate,
        vehicleDetailId: parameters.vehicleDetailId,
        regionId: parameters.regionId
      );
}

class CreateJobOfferParameters extends Equatable {
  final String description;
  final String requestDeadlineDate;
  final int vehicleDetailId;
  final int regionId;

  const CreateJobOfferParameters({
    required this.description,
    required this.requestDeadlineDate,
    required this.vehicleDetailId,
    required this.regionId,
  });


  @override
  List<Object> get props {
    return [
      description,
      requestDeadlineDate,
      vehicleDetailId,
      regionId
    ];
  }
}
