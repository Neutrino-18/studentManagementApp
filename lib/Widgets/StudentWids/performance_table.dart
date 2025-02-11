import 'package:flutter/material.dart';

class PerformanceTable extends StatefulWidget {
  const PerformanceTable({super.key});

  @override
  State<PerformanceTable> createState() => _PerformanceTableState();
}

class _PerformanceTableState extends State<PerformanceTable> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(_isExpanded ? "Hide Data" : "Show Data")),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 50),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: Container(),
          secondChild: DataTable(
            columns: const [
              DataColumn(label: Text("Phase")),
              DataColumn(label: Text("Score")),
              DataColumn(label: Text("Date")),
              DataColumn(label: Text("Remark")),
            ],
            rows: const [
              DataRow(
                cells: [
                  DataCell(Text("1")),
                  DataCell(Text("10")),
                  DataCell(Text("26/01/2025")),
                  DataCell(Text("Good")),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
