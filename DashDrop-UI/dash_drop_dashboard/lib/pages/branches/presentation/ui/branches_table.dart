import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/branch_bloc.dart';

class BranchesTableWidget extends StatelessWidget {
  const BranchesTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchBloc, BranchState>(
      builder: (context, state) {
        // CASE 1: Loading
        if (state.requestState == BranchesRequestState.loading) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        // CASE 2: Error
        if (state.requestState == BranchesRequestState.error) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        // CASE 3: Empty
        if (state.branches.isEmpty) {
          return const SizedBox(
            height: 200,
            child: Center(child: Text("No branches found.")),
          );
        }

        // CASE 4: Success (The Table)
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(
                    label: Text('ID',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Branch Name',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Manager ID',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Code',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Actions',
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: state.branches.map((branch) {
                return DataRow(cells: [
                  DataCell(Text(branch.id.toString())),
                  DataCell(Text(branch.branchName)),
                  DataCell(Text(branch.branchManagerID.toString())),
                  DataCell(Text(branch.code ?? "-")),
                  DataCell(Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          // Handle Edit
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          context
                              .read<BranchBloc>()
                              .add(DeleteBranchEvent(branch.id));
                        },
                      ),
                    ],
                  )),
                ]);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
