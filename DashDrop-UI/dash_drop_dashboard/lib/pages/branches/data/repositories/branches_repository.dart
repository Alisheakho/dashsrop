import 'package:dartz/dartz.dart';
import 'package:dash_drop_dashboard/core/error/failure.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import '../../domain/entities/branch.dart';
import '../../domain/repositories/base_branches_repository.dart';
import '../data_source/branch_remote_data_source.dart';
import '../model/branch_model.dart';

class BranchesRepository extends BaseBranchesRepository {
  final BaseBranchesRemoteDataSource remoteDataSource;

  BranchesRepository(this.remoteDataSource);

  // GET ALL
  @override
  Future<Either<Failure, List<Branch>>> getBranches() async {
    try {
      final result = await remoteDataSource.getBranches();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
          message: e.errorMessageModel.message,
          statusCode: e.statusCode ?? 500));
    } catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 500));
    }
  }

  // GET BY ID
  @override
  Future<Either<Failure, Branch>> getBranch({required int id}) async {
    try {
      final result = await remoteDataSource.getBranches();

      final branch = result.firstWhere(
        (branch) => branch.id == id,
        orElse: () => throw Exception("Branch Not Found"),
      );

      return Right(branch);
    } on ServerException catch (e) {
      return Left(ServerFailure(
          message: e.errorMessageModel.message,
          statusCode: e.statusCode ?? 404));
    } catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 404));
    }
  }

  // CREATE
  @override
  Future<Either<Failure, Branch>> createBranch(Branch branch) async {
    try {
      final branchModel = BranchModel(
          id: branch.id,
          branchName: branch.branchName,
          branchManagerID: branch.branchManagerID,
          code: branch.code);
      final result = await remoteDataSource.createBranch(branchModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
          message: e.errorMessageModel.message,
          statusCode: e.statusCode ?? 500));
    } catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 500));
    }
  }

  // UPDATE
  @override
  Future<Either<Failure, Branch>> updateBranch(Branch branch) async {
    try {
      final branchModel = BranchModel(
          id: branch.id,
          branchName: branch.branchName,
          branchManagerID: branch.branchManagerID,
          code: branch.code);
      final result = await remoteDataSource.updateBranch(branchModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
          message: e.errorMessageModel.message,
          statusCode: e.statusCode ?? 500));
    } catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 500));
    }
  }

  // DELETE
  @override
  Future<Either<Failure, void>> deleteBranch(int id) async {
    try {
      await remoteDataSource.deleteBranch(id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(
          message: e.errorMessageModel.message,
          statusCode: e.statusCode ?? 500));
    } catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 500));
    }
  }
}
