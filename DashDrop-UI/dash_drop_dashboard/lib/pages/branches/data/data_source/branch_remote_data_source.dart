import 'package:dio/dio.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/network/api_constances.dart';
import '../../../../../core/network/error_message.dart';
import '../model/branch_model.dart';

abstract class BaseBranchesRemoteDataSource {
  Future<List<BranchModel>> getBranches();
  Future<BranchModel> createBranch(BranchModel branch);
  Future<BranchModel> updateBranch(BranchModel branch);
  Future<void> deleteBranch(int id);
}

class BranchesRemoteDataSource extends BaseBranchesRemoteDataSource {
  @override
  Future<List<BranchModel>> getBranches() async {
    try {
      String token = await ApiConstances.getToken();
      final response = await Dio().get(
        "${ApiConstances.baseUrl}/branches",
        options: Options(headers: ApiConstances.headers(token)),
      );

      List<dynamic> listData = [];
      if (response.data is Map<String, dynamic>) {
        listData = response.data['data'] ?? [];
      } else if (response.data is List) {
        listData = response.data;
      }

      return List<BranchModel>.from(
          listData.map((e) => BranchModel.fromJson(e)));
    } catch (e) {
      throw ServerException(
        errorMessageModel:
            const ErrorMessageModel(statusCode: 500, message: "Fetch Failed"),
        statusCode: 500,
      );
    }
  }

  @override
  Future<BranchModel> createBranch(BranchModel branch) async {
    String token = await ApiConstances.getToken();
    final response = await Dio().post(
      "${ApiConstances.baseUrl}/branches",
      options: Options(headers: ApiConstances.headers(token)),
      data: branch.toJson(),
    );

    var data = response.data;
    if (data is Map<String, dynamic> && data.containsKey('data')) {
      data = data['data'];
    }
    return BranchModel.fromJson(data);
  }

  @override
  Future<BranchModel> updateBranch(BranchModel branch) async {
    String token = await ApiConstances.getToken();
    final response = await Dio().put(
      "${ApiConstances.baseUrl}/branches/${branch.id}",
      options: Options(headers: ApiConstances.headers(token)),
      data: branch.toJson(),
    );

    var data = response.data;
    if (data is Map<String, dynamic> && data.containsKey('data')) {
      data = data['data'];
    }
    return BranchModel.fromJson(data);
  }

  @override
  Future<void> deleteBranch(int id) async {
    String token = await ApiConstances.getToken();
    await Dio().delete(
      "${ApiConstances.baseUrl}/branches/$id",
      options: Options(headers: ApiConstances.headers(token)),
    );
  }
}
