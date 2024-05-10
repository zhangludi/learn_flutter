import 'package:flutter/material.dart';
import 'package:basic_part/app/components/app_page_header.dart';
import 'package:basic_part/app/components/app_page_main.dart';
import 'package:basic_part/app/components/app_page_bottom.dart';
import 'package:basic_part/app/components/app_floating_action_button.dart';


// 常用的组件： StatelessWidget StatefulWidget
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App>{
  // 显示/隐藏AppBar
  bool showAppBar = true;
  int currentAppBottomNavigationBarItem = 0;
  void onTapAppBottomNavigationBarItem (int index) {
    currentAppBottomNavigationBarItem = index;
    setState(() {
      showAppBar = index == 0;
    });
  }
  
  Widget build (BuildContext context) {
    return MaterialApp(
      home: DefaultTabController (
        length: 2,
        child: Scaffold(
          body: AppPageMain(
            currentIndex: currentAppBottomNavigationBarItem,
          ),
          backgroundColor: Colors.black,
          appBar: showAppBar ? AppPageHeader() : null, // 顶部导航
          bottomNavigationBar: AppPageBottom(
            currentIndex: currentAppBottomNavigationBarItem,
            onTap: onTapAppBottomNavigationBarItem,
          ),
          floatingActionButton: AppFloatingActionButton(),
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
