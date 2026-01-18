part of 'branch_bloc.dart';

enum BranchesRequestState { loading, loaded, error }

class BranchState extends Equatable {
  final List<Branch> branches;
  final BranchesRequestState requestState;
  final String errorMessage;

  const BranchState({
    this.branches = const [],
    this.requestState = BranchesRequestState.loading,
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [branches, requestState, errorMessage];
}
