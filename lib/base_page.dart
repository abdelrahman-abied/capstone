// import 'package:capstone/view/home/home_view.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'core/constants/constants.dart';
// import 'core/localization/localization.dart';
// import 'core/theme/style.dart';
// import 'core/utils/cache_helper.dart';
// import 'core/utils/utilities.dart';

// class BaesPage extends ConsumerStatefulWidget {
//   static const String route = "BaesPage";
//   const BaesPage({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _BaesPageState();
// }

// class _BaesPageState extends ConsumerState<BaesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: whiteColor,
//         actions: [],
//       ),
//       body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         if (CacheHelper.getPrefs(key: Constants.mobileNotification) == true)
//           Container(
//             alignment: Alignment.center,
//             padding: const EdgeInsets.all(16),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 textStyle: const TextStyle(fontSize: 24),
//                 minimumSize: const Size.fromHeight(50),
//                 foregroundColor: primaryColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12), // <-- Radius
//                 ),
//               ),
//               onPressed: () async {
//                 // if (isLoading) {
//                 //   // print("==================");
//                 //   return;
//                 // }
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => HomeView(),
//                   ),
//                   //TableWork
//                 );
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   SizedBox(width: 16),
//                   Text(
//                     "الاشعارات",
//                     style: TextStyle(color: whiteColor),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//       ]),
//     );
//   }
// }
