import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../entities/job_offer.dart';

abstract class BaseJobOffersRepository {
  ResultFuture<List<JobOffer>> getJobOffers();

  ResultFuture<JobOffer> getJobOffer({required int id});

  ResultFuture<JobOffer> createJobOffer(
      {required String description,
      required String requestDeadlineDate,
      required int vehicleDetailId,
      required int regionId});

  ResultVoid updateJobOffer(
      {required int id,
      required String description,
      required String requestDeadlineDate,
      required int vehicleDetailId,
      required int regionId});

  ResultVoid deleteJobOffer({required int id});
}
