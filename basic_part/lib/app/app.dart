import 'package:flutter/material.dart';
import 'package:basic_part/app/components/app_page_header.dart';
import 'package:basic_part/app/components/app_page_main.dart';


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
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                label: '发现'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo_outlined),
                label: '添加'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: '用户'
              ),
            ],
            currentIndex: currentAppBottomNavigationBarItem,
            onTap: onTapAppBottomNavigationBarItem
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.share_outlined),
            onPressed: () {
              print('floating action button');
            },
            backgroundColor: Colors.black87,
            foregroundColor: Colors.white70,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
