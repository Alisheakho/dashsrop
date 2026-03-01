import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import '../entities/branch.dart';

abstract class BaseBranchesRepository {
  ResultFuture<List<Branch>> getBranches();

  ResultFuture<Branch> getBranch({required int id});

  ResultFuture<Branch> createBranch(Branch branch);

  ResultFuture<Branch> updateBranch(Branch branch);

  ResultVoid deleteBranch(int id);
}
