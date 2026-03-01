

import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/entities/hiering.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/repository/base_hiering_repository.dart';

class GetHieringsUseCase extends BaseUseCase<List<Hiering>, NoParameters> {
  GetHieringsUseCase(this.hieringsRepository);

  final BaseHieringsRepository hieringsRepository;

  @override
  ResultFuture<List<Hiering>> call(NoParameters parameters) async {
    return await hieringsRepository.getHierings();
  }
}
