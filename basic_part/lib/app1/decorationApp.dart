import 'package:flutter/material.dart';
// 常用的组件： StatelessWidget StatefulWidget
class DecorationApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset('assets/images/icon.png'),
        width: 200,
        height: 300,
        padding: EdgeInsets.all(20),
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.yellow,
              Colors.pink,
              Colors.blue,
              Colors.cyan
            ],
          ),
          image: DecorationImage(
            image: NetworkImage('https://img-blog.csdnimg.cn/20190619103926231.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.deepOrange,
              BlendMode.saturation
            ),
          ),
          borderRadius: BorderRadius.all(Radius.circular(25)), // 圆角
          border: Border.all(
            color: Colors.white,
            width: 5,
            style: BorderStyle.solid
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.pink,
              offset: Offset(0, -10),
              blurRadius: 30
            )
          ]
        ),
      ),
    );
  }
}