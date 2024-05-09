import 'package:flutter/material.dart';
import 'package:basic_part/post/create/post_create.dart';
import 'package:basic_part/user/profile/user_profile.dart';


class AppPageMain extends StatelessWidget{
  final int currentIndex;
  AppPageMain({this.currentIndex = 0});
  final pageMain = [
    TabBarView(
      children: [
        Icon(
          Icons.explore_outlined,
          size: 128
        ),
        Icon(
          Icons.local_fire_department_outlined,
          size: 128
        ),
      ],
    ),
    // 添加
    PostCreate(),
    UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return pageMain.elementAt(currentIndex);
  }
}