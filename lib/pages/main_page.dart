import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newstream/extentions/statefullwrapper.dart';
import 'package:newstream/pages/profile_page.dart';
import 'package:stream_video/stream_video.dart';

import '../callScreen.dart';
import '../extentions/customcolors.dart';
import '../view_models/auth_view_model.dart';
import 'home_page.dart';
import 'package:rxdart/rxdart.dart';

final _compositeSubscription = CompositeSubscription();


class MainPage extends StatefulWidget {
  final String? currentUserId;
  const MainPage({super.key, this.currentUserId});


  @override
  State<MainPage> createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {
  final authViewModel = Get.put(AuthViewModel());
  int _selectedIndex = 0;
  var _selectedPageIndex = 0;
  late List<Widget> _pages;
  late PageController _pageController;


  @override
  void initState() {
    super.initState();
    _selectedPageIndex = 0;
    _pages = [
      HomePage(currentUserId: widget.currentUserId ?? ""),
      const ProfilePage(),
    ];
    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {

    return StatefulWrapper(
      onInit: (){
        _observeCallKitEvents(context);
        StreamVideo.instance.state.incomingCall.listen(_onNavigateToCall);
      },
      child: Scaffold(
        backgroundColor: CustomColors.primary,
        body:  SafeArea(
          top: true,
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: CustomColors.secondary,
          selectedItemColor: CustomColors.primary,
          unselectedIconTheme: const IconThemeData(
            color: Colors.black,
          ),
          unselectedItemColor: Colors.black.withOpacity(0.5),
          selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: CustomColors.primary),
          unselectedLabelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.w500),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/tab_1.png',
                width: 20,
                height: 20,
                color: _selectedIndex == 0
                    ? CustomColors.primary
                    : Colors.black.withOpacity(0.5),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/tab_2.png',
                width: 20,
                height: 20,
                color: _selectedIndex == 1
                    ? CustomColors.primary
                    : Colors.black.withOpacity(0.5),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onNavigateToCall(Call? value) {
    Get.to(() => CallScreen(call: value));
  }

}

void _observeCallKitEvents(BuildContext context) {
  final streamVideo = StreamVideo.instance;
  _compositeSubscription.add(
    streamVideo.observeCoreCallKitEvents(
      onCallAccepted: (callToJoin) {
        Get.to(() => CallScreen(call: callToJoin));
      },
    ),
  );
}
