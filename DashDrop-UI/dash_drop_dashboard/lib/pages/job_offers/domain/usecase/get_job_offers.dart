import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../entities/job_offer.dart';
import '../repository/base_job_offers_repository.dart';

class GetJobOffersUseCase extends BaseUseCase<List<JobOffer>, NoParameters> {
  GetJobOffersUseCase(this.jobOffersRepository);

  final BaseJobOffersRepository jobOffersRepository;

  @override
  ResultFuture<List<JobOffer>> call(NoParameters parameters) async {
    return await jobOffersRepository.getJobOffers();
  }
}
