import 'package:flutter/material.dart';

class AppPageBottom extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> ? onTap;
  AppPageBottom({this.currentIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: '发现'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_a_photo_outlined),
          label: '添加'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: '用户'
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap
    );
  }
}