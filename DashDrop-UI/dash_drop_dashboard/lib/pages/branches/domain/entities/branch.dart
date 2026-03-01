import 'package:equatable/equatable.dart';

class Branch extends Equatable {
  final int id;
  final String branchName;
  final int branchManagerID;
  final String? code; // حقل اختياري (لأنو ممكن يكون فاضي)

  const Branch({
    required this.id,
    required this.branchName,
    required this.branchManagerID,
    this.code,
  });

  @override
  List<Object?> get props => [id, branchName, branchManagerID, code];
}
