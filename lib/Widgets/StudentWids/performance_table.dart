import 'package:app_crt/Providers/toggle_performance_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableData {
  final int phase;
  final double score;
  final String date;
  final String remarks;

  TableData({
    required this.phase,
    required this.score,
    required this.date,
    required this.remarks,
  });
}

class DropdownTableWidget extends ConsumerWidget {
  const DropdownTableWidget(
      {super.key, required this.dropDownTitle, required this.index});

  final String dropDownTitle;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isToggled = ref.watch(performButProvider)[index] ?? false;
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(isToggled ? Icons.expand_less : Icons.expand_more,
                      color: Theme.of(context).colorScheme.background),
                ],
              ),
            ),
          ),
          if (isToggled)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTableData(),
            ),
        ],
      ),
    );
  }
}

class DataTableData extends StatelessWidget {
  DataTableData({
    super.key,
  });

  final List<TableData> tableData = [
    TableData(
      phase: 1,
      score: 7,
      date: '2024-03-15',
      remarks: 'Excellent progress',
    ),
    TableData(
      phase: 2,
      score: 9,
      date: '2024-03-16',
      remarks: 'Outstanding performance',
    ),
    TableData(
      phase: 3,
      score: 6,
      date: '2024-03-17',
      remarks: 'Good work',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        dataColumn(context, "Phase"),
        dataColumn(context, "Score"),
        dataColumn(context, "Date"),
        dataColumn(context, "Remarks"),
      ],
      rows: tableData.map((data) {
        return DataRow(
          cells: [
            DataCell(Text(data.phase.toString())),
            DataCell(Text(data.score.toStringAsFixed(1))),
            DataCell(Text(data.date)),
            DataCell(Text(data.remarks)),
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
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)));
  }
}
