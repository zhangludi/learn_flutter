import 'package:flutter/material.dart';
import 'package:basic_part/app/themes/AppTheme.dart';
// 常用的组件： StatelessWidget StatefulWidget
class App extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Scaffold')
        ),
        backgroundColor: Colors.amber,
      ),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark
    );
  }
}