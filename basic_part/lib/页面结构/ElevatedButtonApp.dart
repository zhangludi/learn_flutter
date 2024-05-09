import 'package:flutter/material.dart';
// 常用的组件：MaterialApp
class App extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home: Center(
        child: ElevatedButton(
          child: Text('nihao'),
          onPressed: () {
            print('你好啊');
          },
        )
      ), 
      debugShowCheckedModeBanner: false,
    );
  }
}