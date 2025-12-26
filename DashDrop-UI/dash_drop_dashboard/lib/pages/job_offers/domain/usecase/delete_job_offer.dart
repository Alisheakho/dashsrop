import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../repository/base_job_offers_repository.dart';

class DeleteJobOfferUseCase
    extends BaseUseCase<void, DeleteJobOfferParameters> {
  DeleteJobOfferUseCase(this.jobOffersRepository);

  final BaseJobOffersRepository jobOffersRepository;

  @override
  ResultVoid call(DeleteJobOfferParameters parameters) async =>
      jobOffersRepository.deleteJobOffer(id: parameters.id);
}

class DeleteJobOfferParameters extends Equatable {
  const DeleteJobOfferParameters({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
