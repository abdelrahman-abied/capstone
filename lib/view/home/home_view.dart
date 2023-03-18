import 'package:capstone/core/constants/constants.dart';
import 'package:capstone/core/theme/style.dart';
import 'package:capstone/core/utils/cache_helper.dart';
import 'package:capstone/core/utils/utilities.dart';
import 'package:capstone/view/home/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/localization/localization.dart';
import '../../model/model/auterization.dart';
import '../../view_model/home_view_model.dart';
import '../login_view.dart';

class HomeView extends ConsumerStatefulWidget {
  static const String route = "home";
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        ref.read(homeVM);
      }
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> widgetOptions = <Widget>[
    DoctorWidget(),
    Text(
      'Index 1: Chat',
      style: optionStyle,
    ),
    Text(
      'Index 1: Video',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            autherizationFromMap(CacheHelper.getPrefs(key: Constants.userData))
                    .data
                    ?.name ??
                ""),
      ),
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: getString(context).home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat),
            label: getString(context).chat,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.video_call),
            label: getString(context).video,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
