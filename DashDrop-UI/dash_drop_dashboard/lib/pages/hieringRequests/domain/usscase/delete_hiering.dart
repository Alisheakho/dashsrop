
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/repository/base_hiering_repository.dart';
import 'package:equatable/equatable.dart';

class DeleteHieringUseCase
    extends BaseUseCase<void, DeleteHieringParameters> {
  DeleteHieringUseCase(this.baseHieringsRepository);

  final BaseHieringsRepository baseHieringsRepository;

  @override
  ResultVoid call(DeleteHieringParameters parameters) async =>
      baseHieringsRepository.deleteHierings(id: parameters.id);
}

class DeleteHieringParameters extends Equatable {
  const DeleteHieringParameters({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
