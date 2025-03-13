import 'package:app_crt/Modals/student_model.dart';
import 'package:app_crt/Providers/toggle_performance_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropdownTableWidget extends ConsumerWidget {
  const DropdownTableWidget(
      {super.key,
      required this.dropDownTitle,
      required this.index,
      required this.tableData});

  final String dropDownTitle;
  final int index;
  final List<PerformanceData> tableData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isToggled = ref.watch(performButProvider)[index] ?? false;
    return Card(
      // margin: const EdgeInsets.all(16.0),
      elevation: 4,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              ref.read(performButProvider.notifier).toggle(index);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dropDownTitle,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(isToggled ? Icons.expand_less : Icons.expand_more,
                      color: Theme.of(context).colorScheme.surface),
                ],
              ),
            ),
          ),
          if (isToggled)
            DataTableData(
              tableData: tableData,
            ),
        ],
      ),
    );
  }
}

class DataTableData extends StatelessWidget {
  const DataTableData({super.key, required this.tableData});
  final List<PerformanceData> tableData;
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 30,
      columns: [
        dataColumn(context, "Round"),
        dataColumn(context, "Score"),
        dataColumn(context, "Date"),
        dataColumn(context, "Remarks"),
      ],
      rows: tableData.map((data) {
        return DataRow(
          cells: [
            DataCell(Text(tableData.first.round ?? "Currently Not Displayed")),
            DataCell(Text(tableData.first.score.toString())),
            DataCell(Text(tableData.first.date ?? "Currently Not Displayed")),
            DataCell(Text(
              tableData.first.remark ?? "Currently Not Displayed",
              maxLines: 2,
              overflow: TextOverflow.fade,
            )),
          ],
        );
      }).toList(),
    );
  }

  static DataColumn dataColumn(BuildContext context, String label) {
    return DataColumn(
        label: Text(label,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface)));
  }
}
