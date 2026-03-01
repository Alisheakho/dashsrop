import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

abstract class BaseUseCase<T, Parameters> {
  ResultFuture<T> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object> get props => [];
}
