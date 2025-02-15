// //import "package:app_crt/Common/box_prop.dart";
// //import "package:app_crt/Pages/first_page.dart";
// import "package:app_crt/Common/box_prop.dart";
// import "package:app_crt/Common/common_textt.dart";
// import "package:app_crt/Models/colors.dart";
// import "package:app_crt/Pages/first_page.dart";
// //import "package:app_crt/Pages/first_page.dart";
// //import "package:app_crt/Pages/first_page.dart";
// import "package:app_crt/dropdown_but.dart";
// import "package:flutter/material.dart";

// class ResourcesScreen extends StatefulWidget {
//   const ResourcesScreen({super.key});

//   @override
//   State<ResourcesScreen> createState() {
//     return _ResourcesScreenState();
//   }
// }

// class _ResourcesScreenState extends State<ResourcesScreen> {
//   @override
//   Widget build(context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColors.colorPage,
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(kToolbarHeight + 20),
//           child: Container(
//             padding: const EdgeInsets.only(top: 20),
//             child: AppBar(
//               backgroundColor: AppColors.colorPage,
//               title: const Text(
//                 "Resource Material",
//                 style: TextStyle(
//                     color: AppColors.colorText,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 30),
//               ),
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(30),
//             child: Column(
//               //crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 BoxProp(
//                   color: AppColors.colorBox,
//                   borderradius: const BorderRadius.all(Radius.circular(8)),
//                   height: 700,
//                   width: 380,
//                   padd: const EdgeInsets.all(20),
//                   children: [
//                     const TextWidget.text(
//                         textt: 'JECRC Foundation Notes', size: headingSize),
//                     const SizedBox(height: 30),
//                     dropDownBox('Year', ['1st', '2nd ', '3rd'], 'Select Year'),
//                     const SizedBox(height: 30),
//                     dropDownBox(
//                         'Branch', ['CSE', 'ECE', 'IT'], 'Select Branch'),
//                     const SizedBox(height: 30),
//                     dropDownBox(
//                         'Subject', ['DSA', 'OOPs', 'ML'], 'Select Subject'),
//                     const SizedBox(height: 30),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget dropDownBox(String heading, List<String> content, String hint) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       TextWidget.text(textt: heading, size: contentSize),
//       const SizedBox(
//         height: 10,
//       ),
//       Container(
//         decoration: const BoxDecoration(
//             color: AppColors.colorComps,
//             borderRadius: BorderRadius.all(Radius.circular(8))),
//         width: 135,
//         child: DropDownMenu(
//           items: content,
//           hintText: hint,
//         ),
//       ),
//     ],
//   );
// }
