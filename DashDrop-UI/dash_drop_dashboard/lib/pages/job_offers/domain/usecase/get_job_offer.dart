import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../entities/job_offer.dart';
import '../repository/base_job_offers_repository.dart';

class GetJobOfferUseCase extends BaseUseCase<void, GetJobOfferParameters> {
  GetJobOfferUseCase(this.jobOffersRepository);

  final BaseJobOffersRepository jobOffersRepository;

  @override
  ResultFuture<JobOffer> call(GetJobOfferParameters parameters) async =>
      jobOffersRepository.getJobOffer(id: parameters.id);
}

class GetJobOfferParameters extends Equatable {
  const GetJobOfferParameters({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
