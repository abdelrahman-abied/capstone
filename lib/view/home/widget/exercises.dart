// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:capstone/core/theme/style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:video_player/video_player.dart';

// import '../../../view_model/home_view_model.dart';

// class ExercisesWidget extends ConsumerStatefulWidget {
//   const ExercisesWidget({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _ExercisesWidgetState();
// }

// class _ExercisesWidgetState extends ConsumerState<ExercisesWidget> {
//   late VideoPlayerController _controller;
//   @override
//   void initState() {
//     Future.delayed(Duration.zero, () => ref.read(homeVM).getHomeData());

//     super.initState();
//     _controller = VideoPlayerController.network(
//         'https://www.youtube.com/embed/y77E0nNvnSk');

//     _controller.addListener(() {
//       setState(() {});
//     });
//     _controller.setLooping(true);
//     _controller.initialize().then((_) => setState(() {}));
//     _controller.play();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(20),
//           child: AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: Stack(
//               alignment: Alignment.bottomCenter,
//               children: <Widget>[
//                 VideoPlayer(_controller),
//                 VideoProgressIndicator(_controller, allowScrubbing: true),
//               ],
//             ),
//           ),
//         ),
//         // ListView.builder(
//         //   itemCount: ref.watch(homeVM).data.length,
//         //   itemBuilder: (context, index) {
//         //     final item = ref.watch(homeVM).data[index];
//         //     return Card(
//         //       elevation: 4,
//         //       shadowColor: primaryColor,
//         //       child: ListTile(
//         //         trailing: CircleAvatar(
//         //           child: CachedNetworkImage(
//         //             imageUrl: item.image ?? "",
//         //             placeholder: (context, url) => CircularProgressIndicator(),
//         //             errorWidget: (context, url, error) => Icon(Icons.error),
//         //           ),
//         //         ),
//         //         title: Text(item.name ?? ""),
//         //         subtitle: Text(item.email ?? ""),
//         //       ),
//         //     );
//         //   },
//         // ),
//       ],
//     );
//   }
// }
