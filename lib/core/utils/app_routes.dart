import 'package:capstone/view/details/details_view.dart';
import 'package:flutter/material.dart';

import '../../base_page.dart';
import '../../view/home/home_view.dart';
import '../../view/login_view.dart';

Map<String, Widget Function(BuildContext)> appRoutes(context) {
  return {
    LoginScreen.route: (_) => LoginScreen(),
    HomeView.route: (_) => HomeView(),
    DetailsView.route: (_) => DetailsView(),
  };
}
