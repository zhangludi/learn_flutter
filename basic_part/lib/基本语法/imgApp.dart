import 'package:flutter/material.dart';
// 常用的组件： StatelessWidget StatefulWidget
class ImgApp extends StatelessWidget {
  @override
  // Widget build (BuildContext context) {
  //   return Center(
  //     child: Image(
  //       image: AssetImage('assets/images/icon.png'),
  //       width: 128
  //     ),
  //   );
  // }
  Widget build (BuildContext context) {
    return Center(
      child: Image(
        image: NetworkImage('https://img-blog.csdnimg.cn/20190619103926231.png'),
        width: 500,
        height: 500,
        fit: BoxFit.cover,
        alignment: Alignment.bottomRight,
        color: Colors.amber,
        colorBlendMode: BlendMode.softLight,
      ),
    );
  }
}