import 'package:flutter/material.dart';
import 'package:basic_part/app/themes/AppTheme.dart';
// 常用的组件： StatelessWidget StatefulWidget
class App extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Scaffold'),
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
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
          ]
        ),
      ),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark
    );
  }
}