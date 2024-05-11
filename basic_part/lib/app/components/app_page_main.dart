import 'package:flutter/material.dart';
import 'package:basic_part/post/create/post_create.dart';
import 'package:basic_part/user/profile/user_profile.dart';
import 'package:basic_part/post/index/post_index.dart';
import 'package:basic_part/playground/playground.dart';


class AppPageMain extends StatelessWidget{
  final int currentIndex;
  AppPageMain({this.currentIndex = 0});
  final pageMain = [
    PostIndex(),
    // 添加
    PostCreate(),
    UserProfile(),
    Playground(),
  ];
  @override
  Widget build(BuildContext context) {
    return pageMain.elementAt(currentIndex);
  }
}