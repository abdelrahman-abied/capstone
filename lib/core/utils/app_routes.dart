import 'package:capstone/view/splash.dart';
import 'package:flutter/material.dart';

import '../../view/home/home_view.dart';
import '../../view/login_view.dart';

Map<String, Widget Function(BuildContext)> appRoutes(context) {
  return {
    LoginScreen.route: (_) => LoginScreen(),
    HomeView.route: (_) => HomeView(),
    SplashView.route: (_) => SplashView(),
    // DetailsView.route: (_) => DetailsView(),
  };
}
