import "package:app_crt/Common/page_footer.dart";
import "package:flutter/material.dart";
import 'package:app_crt/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: selfTheme,
      darkTheme: selfDarkTheme,

      home: const ProviderScope(child: IconFooter()),
      // routes: {
      //   '/IconFooter': (context) => const InterviewerHome(),
      //   '/InterviewerHome': (context) => const InterviewerHome(),
      // },
    );
  }
}


/*MaterialApp(
home: IconFooter(key: iconFooterKey),
);*/



































// Center(
//               child: Column(
//                 children: [
//                   /*1*/ const SizedBox(
//                       height: 20), /////////////Announcements/////////////
//                   /*2*/ const BoxProp(
//                     outsideBoxColor,
//                     0.15,
//                     outsideBoxWidth,
//                     [
//                       TextWidget.heading(
//                         textt: 'Announcements',
//                         size: 18,
//                       ),
//                       SizedBox(height: 9),
//                       BoxProp(
//                         insideBoxColor,
//                         insideBoxHeightFraction,
//                         insideBoxWidth,
//                         [
//                           TextWidget.text(
//                             textt:
//                                 'All the Students are adviced to kindly arrange themselves in A block Auditorium without making any mess',
//                             size: 14,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   /*3*/ const SizedBox(height: 30),
//                   /*4*/ BoxProp(
//                     /////////////Schedule/////////////
//                     outsideBoxColor,
//                     0.375,
//                     outsideBoxWidth,
//                     [
//                       const TextWidget.heading(
//                         textt: 'Schedule',
//                         size: 20,
//                       ),
//                       const SizedBox(height: 9),
//                       const BoxProp(
//                         insideBoxColor,
//                         insideBoxHeightFraction,
//                         insideBoxWidth,
//                         [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextWidget.text(
//                                 textt: ' Period:DSA\n Teacher:Arpit Sir',
//                                 size: 14,
//                               ),
//                               TextWidget.text(
//                                 textt: '11 AM-12 PM',
//                                 size: 18,
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       BoxProp(
//                         insideBoxColor,
//                         0.19,
//                         insideBoxWidth,
//                         [
//                           const TextWidget.text(
//                             textt: 'You are in',
//                             size: 18,
//                           ),
//                           Container(
//                             height: 50.0,
//                             width: 120.0,
//                             decoration: BoxDecoration(
//                               border:
//                                   Border.all(color: Colors.white, width: 2.0),
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             child: const Center(
//                               child: TextWidget.text(
//                                 textt: 'Phase 1',
//                                 size: 22,
//                               ),
//                             ),
//                           ),
//                           const TextWidget.text(
//                             textt: '1st August - 29th August',
//                             size: 18,
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                   /*5*/ const SizedBox(height: 20),
//                   /*6*/ const BoxProp(
//                     /////////////Batch/////////////
//                     outsideBoxColor,
//                     0.15,
//                     outsideBoxWidth,
//                     [
//                       TextWidget.heading(
//                         textt: 'Batch Messages',
//                         size: 20,
//                       ),
//                       SizedBox(height: 9),
//                       BoxProp(
//                         insideBoxColor,
//                         insideBoxHeightFraction,
//                         insideBoxWidth,
//                         [
//                           TextWidget.text(
//                             textt:
//                                 'This is to inform all the students that we are changing the dates of CRT phase 2 from this to that ',
//                             size: 14,
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   /*7*/ const SizedBox(height: 20),
//                   /*8*/ BoxProp(
//                     AppColors.colorOutsideBox,
//                     0.108,
//                     outsideBoxWidth,
//                     [
//                       const SizedBox(height: 10),
//                       BoxProp(
//                         insideBoxColor,
//                         insideBoxHeightFraction,
//                         insideBoxWidth,
//                         [
//                           const SizedBox(
//                             height: 5.5,
//                           ),
//                           TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).push(
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         const PerformancePage(),
//                                   ),
//                                 );
//                               },
//                               child: const Text(
//                                 'Performance',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 27),
//                               ))
//                         ],
//                       ),
//                     ],
//                   ),
//                   /*9*/ const SizedBox(height: 20),
//                   /*10*/ BoxProp(
//                     /////////////Resource Material/////////////
//                     AppColors.colorOutsideBox,
//                     0.108,
//                     outsideBoxWidth,
//                     [
//                       const SizedBox(height: 10),
//                       BoxProp(
//                       AppColors.colorInsideBox,
//                         insideBoxHeightFraction,
//                         insideBoxWidth,
//                         [
//                           const SizedBox(height: 5.5),
//                           TextButton(
//                             onPressed: () {
//                               iconFooterKey.currentState?.showResourceScreen();
//                             },
//                             child: const Text(
//                               'Resource Material',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 27),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   /*11*/ const SizedBox(height: 20)
//                 ],
//               ),
//             ),