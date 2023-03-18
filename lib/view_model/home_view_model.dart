import 'package:capstone/model/model/home_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/data_source/remote/profile.dart';

final homeVM = ChangeNotifierProvider<HomeViewModel>((ref) => HomeViewModel());

class HomeViewModel with ChangeNotifier {
  List<Doctort> data = [];
  void getHomeData() async {
    data = await getHomeDataService();
    notifyListeners();
  }
}
