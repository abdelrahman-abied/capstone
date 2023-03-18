import 'dart:isolate';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:capstone/core/utils/log.dart';
import 'package:capstone/model/model/user_notification.dart';
import 'package:capstone/view_model/details_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/localization/localization.dart';
import '../../core/theme/style.dart';
import '../../core/utils/utilities.dart';

class DetailsView extends ConsumerStatefulWidget {
  static const String route = "details";
  final Data? notificationData;
  const DetailsView({this.notificationData, Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailsViewState();
}

class _DetailsViewState extends ConsumerState<DetailsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final detailsRef = ref.watch(detailsVM);
    Log.w(widget.notificationData!.link.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        iconTheme: const IconThemeData(
          color: primaryColor, //change your color here
        ),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 8),
        // margin: const EdgeInsets.only(top: 5, bottom: 5, right: 8, left: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "${widget.notificationData!.message}",
              minFontSize: 18,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            AutoSizeText(
              dateConverter(widget.notificationData!.createdAt.toString()),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            if (widget.notificationData?.link != null)
              SelectableText.rich(
                TextSpan(
                  text: '',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                  children: [
                    TextSpan(
                      text: widget.notificationData!.realLink!.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      mouseCursor: SystemMouseCursors.click,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          // if (await canLaunchUrl(Uri.parse(
                          //     widget.notificationData!.realLink!.toString()))) {
                          //   await launchUrl(Uri.parse(
                          //     widget.notificationData!.realLink!.toString(),
                          //   ));
                          // }
                        },
                    ),
                  ],
                ),
              ),

            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     textStyle: const TextStyle(fontSize: 24),
            //     minimumSize: const Size.fromHeight(50),
            //     foregroundColor: primaryColor,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12), // <-- Radius
            //     ),
            //   ),
            //   onPressed: () {
            //     if (widget.notificationData?.link != null) {
            //       if (!detailsRef.isLoading) {
            //         detailsRef.downloadFileFromUrl(
            //             widget.notificationData!.link.toString());
            //       }
            //     }
            //   },
            //   child: detailsRef.isLoading
            //       ? Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             const CircularProgressIndicator(color: Colors.white),
            //             const SizedBox(width: 16),
            //             Text(
            //               getString(context).isLoading,
            //               style: const TextStyle(color: whiteColor),
            //             ),
            //           ],
            //         )
            //       : Text(
            //           getString(context).downloadFile,
            //           style: const TextStyle(color: whiteColor),
            //         ),
            // ),
            Row(
              children: [
                AutoSizeText(
                  widget.notificationData!.createdBy.toString().isNotEmpty
                      ? "${getString(context).createdBy} :  ${widget.notificationData!.createdBy}"
                      : "",
                  style: const TextStyle(
                    fontSize: 18,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
