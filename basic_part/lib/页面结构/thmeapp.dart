import 'package:flutter/material.dart';
import 'package:basic_part/app/themes/AppTheme.dart';
// 常用的组件： StatelessWidget StatefulWidget
class App extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home: Center(
        child: ElevatedButton(
          child: Text('你好'),
          onPressed: () {
            print('主题');
          },
        ),
      ),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark
    );
  }
}