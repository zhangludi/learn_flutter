import 'package:flutter/material.dart';
// 常用的组件：MaterialApp
class App extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home: Center(
        // child: Text('你好'),
        child: Icon( // icon
          Icons.landscape_outlined,
          color: Colors.amber,
          size: 128
        ),
      ), 
      debugShowCheckedModeBanner: false,
    );
  }
}