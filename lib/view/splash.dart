import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/log.dart';
import '../../core/utils/cache_helper.dart';
import '../../core/constants/constants.dart';
import '../core/theme/style.dart';
import 'package:flutter/material.dart';

import 'home/home_view.dart';
import 'login_view.dart';

class SplashView extends ConsumerStatefulWidget {
  static const String route = "splash";
  const SplashView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  String _userCardData = "";
  String _baseUrl = "";
  bool policy = false;
  Timer? timer;
  final String isLogged =
      CacheHelper.getPrefs(key: Constants.tokenPrefKey) ?? "";

  @override
  void initState() {
    timer = Timer(const Duration(seconds: 4), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        isLogged.isNotEmpty ? HomeView.route : LoginScreen.route,
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                "/Users/abdo/Desktop/projects/capstone/assets/images/background.jpg",
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Image.asset(
                  'assets/images/app_logo.png',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
