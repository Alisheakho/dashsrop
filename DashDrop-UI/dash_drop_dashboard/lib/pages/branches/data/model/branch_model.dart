import '../../domain/entities/branch.dart';

class BranchModel extends Branch {
  const BranchModel({
    required super.id,
    required super.branchName,
    required super.branchManagerID,
    super.code,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      id: (json['branchID'] as int?) ?? 0,
      branchName: json['branchName']?.toString() ?? "",
      branchManagerID: (json['branchManagerID'] as int?) ?? 0,
      code: json['code']?.toString() ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'branchName': branchName,
      'branchManagerID': branchManagerID,
      'code': code,
    };
  }
}
