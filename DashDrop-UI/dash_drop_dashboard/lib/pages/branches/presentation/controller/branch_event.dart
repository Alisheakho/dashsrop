part of 'branch_bloc.dart';

abstract class BranchEvent extends Equatable {
  const BranchEvent();

  @override
  List<Object> get props => [];
}

class GetBranchesEvent extends BranchEvent {}

class CreateBranchEvent extends BranchEvent {
  final Branch branch;
  const CreateBranchEvent(this.branch);
}

class UpdateBranchEvent extends BranchEvent {
  final Branch branch;
  const UpdateBranchEvent(this.branch);
}

class DeleteBranchEvent extends BranchEvent {
  final int id;
  const DeleteBranchEvent(this.id);
}
