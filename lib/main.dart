import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/constants/constants.dart';
import 'core/my_app.dart';
import 'core/utils/cache_helper.dart';

// String messageTitle = "Title";
// String notificationAlert = "Alert";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  CacheHelper.clearAll();
  runApp(const ProviderScope(child: MyApp()));
}
