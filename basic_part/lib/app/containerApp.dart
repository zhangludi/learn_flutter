import 'package:flutter/material.dart';
// 常用的组件： StatelessWidget StatefulWidget
class ContainerApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset(
          'assets/images/icon.png',
          width: 100,
          height: 100,
          color: Colors.orange
        ),
        color: Colors.white,
        padding: EdgeInsets.all(60),
        width: 200,
        height: 200,
        transform: Matrix4.rotationZ(0.5),
        transformAlignment: Alignment.topRight,
      ),
    );
  }
}