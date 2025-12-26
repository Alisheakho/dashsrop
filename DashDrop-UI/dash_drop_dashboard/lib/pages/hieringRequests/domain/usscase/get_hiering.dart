import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/entities/hiering.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/repository/base_hiering_repository.dart';
import 'package:equatable/equatable.dart';

class GetHieringUseCase extends BaseUseCase<Hiering, GetHieringParameters> {
  GetHieringUseCase(this.baseHieringsRepository);

  final BaseHieringsRepository baseHieringsRepository;

  @override
  ResultFuture<Hiering> call(GetHieringParameters parameters) async =>
    await baseHieringsRepository.getHiering(id: parameters.id);
}

class GetHieringParameters extends Equatable {
  const GetHieringParameters({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
