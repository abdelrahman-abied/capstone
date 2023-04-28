import 'package:capstone/view/home/chat_page.dart';
import 'package:capstone/view/splash.dart';
import 'package:flutter/material.dart';

import '../../view/chat/chat_view.dart';
import '../../view/home/home_view.dart';
import '../../view/login_view.dart';
import '../../view/video/video_view.dart';

Map<String, Widget Function(BuildContext)> appRoutes(context) {
  return {
    LoginScreen.route: (_) => LoginScreen(),
    HomeView.route: (_) => HomeView(),
    SplashView.route: (_) => SplashView(),
    ChatView.route: (_) => ChatView(),
    Chat.route: (_) => Chat(),
    VideoView.route: (_) => VideoView(),
  };
}
