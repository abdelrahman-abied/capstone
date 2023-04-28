import 'package:capstone/core/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoView extends ConsumerStatefulWidget {
  static const String route = 'video';
  const VideoView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoViewState();
}

class _VideoViewState extends ConsumerState<VideoView> {
  late final WebViewController controller;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            Log.e(error.toString());
          },
        ),
      )
      ..loadFlutterAsset('assets/group_video_chat/index.html');
  }

  @override
  Widget build(BuildContext context) {
    // final size
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.black,
              child: WebViewWidget(
                controller: controller,
              ),
            ),
    );
  }
}
