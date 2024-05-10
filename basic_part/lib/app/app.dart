import 'package:flutter/material.dart';
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int currentBottomNavigatorBarItem = 0;
  bool showAppBar = true;
  void onTapBottomNavigatorBarItem (int index) {
    setState(() {
      currentBottomNavigatorBarItem = index;
    });
    setState(() {
      showAppBar = index == 0;
    });
  }
  final pageMain = [
    TabBarView(
      children: [
        Icon(
          Icons.explore_outlined,
          size: 128,
          color: Colors.black12
        ),
        Icon(
          Icons.local_fire_department_outlined,
          size: 128,
          color: Colors.black12
        )
      ],
    ),
    Center(
      child: Icon(
        Icons.add_a_photo_outlined,
        size: 128,
      ),
    ),
    Center(
      child: Icon(
        Icons.account_circle_outlined,
        size: 128,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: pageMain.elementAt(currentBottomNavigatorBarItem),
          appBar: showAppBar ? AppBar(
            title: Image.asset(
              'assets/images/icon.png',
              width: 128,
              color: Colors.black12,
            ),
            leading: IconButton(
              icon: Icon(Icons.menu_outlined),
              color: Colors.amber,
              onPressed: () {},
            ),
            actions: [
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.more_horiz)
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(text: "最近"),
                Tab(text: "热门")
              ]
            ),
          ): null,
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                label: "发现"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo_outlined),
                label: "添加"
              ),
               BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: "用户"
              ),
            ],
            currentIndex: currentBottomNavigatorBarItem,
            onTap: onTapBottomNavigatorBarItem,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.share_outlined),
            backgroundColor: Colors.black87,
            foregroundColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}