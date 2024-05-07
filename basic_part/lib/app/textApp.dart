import 'package:flutter/material.dart';
// Text文本
class TextApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Center(
      child: Text(
        '这是个测试, 桃花深处有人家，这是一个测试',
        textDirection: TextDirection.ltr,
        style: TextStyle (
          fontSize: 30.0
        ),
        textAlign: TextAlign.right,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      )
    );
  }
}