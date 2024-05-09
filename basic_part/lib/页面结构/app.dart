import 'package:flutter/material.dart';
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
  final pageMain = [
    TabBarView(
      children: [
        Icon(
          Icons.explore_outlined,
          size: 128
        ),
        Icon(
          Icons.local_fire_department_outlined,
          size: 128
        ),
      ],
    ),
    // 添加
    Center(
      child: Icon(
        Icons.add_a_photo_outlined,
        size: 128,
        color: Colors.amber
      )
    ),
    Center(
      child: Icon(
        Icons.account_circle_outlined,
        color: Colors.amber,
        size: 128
      ),
    ),
  ];
  Widget build (BuildContext context) {
    return MaterialApp(
      home: DefaultTabController (
        length: 2,
        child: Scaffold(
          body: pageMain.elementAt(currentAppBottomNavigationBarItem),
          backgroundColor: Colors.black,
          appBar: showAppBar ? AppBar(
            title: Image.asset(
              'assets/images/icon.png',
              width: 32,
              color: Colors.blue
            ),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
            ],
            bottom: TabBar(
              tabs: [
                Tab(text: '最新'),
                Tab(text: '热门')
              ]
            ),
          ) : null,
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
