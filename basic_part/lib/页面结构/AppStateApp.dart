import 'package:flutter/material.dart';
// 常用的组件： StatelessWidget StatefulWidget
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}
class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '你好啊',
        style: TextStyle (
          color: Colors.amber
        ),
      ),
    );
  }
}