import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/branch.dart';
import '../../domain/repositories/base_branches_repository.dart';

part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final BaseBranchesRepository branchesRepository;

  BranchBloc(this.branchesRepository) : super(const BranchState()) {
    on<GetBranchesEvent>((event, emit) async {
      emit(const BranchState(requestState: BranchesRequestState.loading));
      final result = await branchesRepository.getBranches();

      result.fold(
        (failure) => emit(BranchState(
            requestState: BranchesRequestState.error,
            errorMessage: failure.message)),
        (branches) => emit(BranchState(
            requestState: BranchesRequestState.loaded, branches: branches)),
      );
    });

    on<CreateBranchEvent>((event, emit) async {
      emit(const BranchState(requestState: BranchesRequestState.loading));
      await branchesRepository.createBranch(event.branch);
      add(GetBranchesEvent());
    });

    on<DeleteBranchEvent>((event, emit) async {
      await branchesRepository.deleteBranch(event.id);
      add(GetBranchesEvent());
    });

    on<UpdateBranchEvent>((event, emit) async {
      await branchesRepository.updateBranch(event.branch);
      add(GetBranchesEvent());
    });
  }
}
