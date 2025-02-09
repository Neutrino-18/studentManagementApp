// import 'package:flutter/material.dart';
// import 'package:app_crt/Common/database_helper.dart';
// //import 'package:intl/intl.dart';

// class PerformancePage extends StatefulWidget {
//   const PerformancePage({super.key});

//   @override
//   State<PerformancePage> createState() => _PerformancePageState();
// }

// class _PerformancePageState extends State<PerformancePage> {
//   final DatabaseHelper _databaseHelper = DatabaseHelper();
//   List<Map<String, dynamic>> _performanceData = [];
//   bool _isLoading = true;
//   String _errorMessage = '';

//   @override
//   void initState() {
//     super.initState();
//     _loadPerformanceData();
//   }

//   Future<void> _loadPerformanceData() async {
//     try {
//       setState(() => _isLoading = true);
//       String? currentUserEmail = DatabaseHelper.getCurrentUser();

//       if (currentUserEmail == null) {
//         setState(() {
//           _isLoading = false;
//           _errorMessage = 'No user is currently logged in';
//         });
//         return;
//       }

//       final performanceData =
//           await _databaseHelper.getPerformanceData(currentUserEmail);

//       setState(() {
//         _performanceData = performanceData;
//         _isLoading = false;
//         if (performanceData.isEmpty) {
//           _errorMessage = 'No performance data found';
//         }
//       });
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _errorMessage = 'Error loading data: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Performance"),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : _performanceData.isEmpty
//               ? Center(child: Text(_errorMessage))
//               : ListView.builder(
//                   itemCount: _performanceData.length,
//                   itemBuilder: (context, index) {
//                     final data = _performanceData[index];
//                     return Card(
//                       child: ListTile(
//                         title:
//                             Text('${data['first_name']} ${data['last_name']}'),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             if (data['gd_score'] != null)
//                               Text('GD Score: ${data['gd_score']}'),
//                             if (data['hr_score'] != null)
//                               Text('HR Score: ${data['hr_score']}'),
//                             if (data['tech_score'] != null)
//                               Text('Technical Score: ${data['tech_score']}'),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//     );
//   }
// }
