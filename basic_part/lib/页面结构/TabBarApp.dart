import 'package:flutter/material.dart';
// 常用的组件： StatelessWidget StatefulWidget
class App extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home: DefaultTabController (
        length: 2,
        child: Scaffold(
          body: TabBarView(
            children: [
              Icon(
                Icons.explore_outlined,
                size: 128,
                color: Color.fromARGB(31, 225, 7, 7)
              ),
              Icon(
                Icons.local_fire_department_outlined,
                size: 128,
                color: Color.fromARGB(31, 45, 216, 22)
              )
            ],
          ),
          backgroundColor: Colors.black,
          appBar: AppBar(
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
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}