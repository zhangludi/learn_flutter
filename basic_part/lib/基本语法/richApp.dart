import 'package:flutter/material.dart';
// RichText 复文本
class RichApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Center(
      child: RichText(
        textDirection: TextDirection.ltr,
        text: TextSpan (
          text: '我是12334富文本',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: '桃花',
              style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontWeight: FontWeight.w700
              )
            )
          ]
        )
      ),
    );
  }
}