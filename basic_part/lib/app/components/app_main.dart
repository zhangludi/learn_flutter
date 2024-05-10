import 'package:basic_part/post/create/post_create.dart';
import 'package:flutter/material.dart';
import 'package:basic_part/post/index/post_index.dart';
import 'package:basic_part/user/profile/user_profile.dart';

class AppMain extends StatelessWidget{
  final int currentIndex;
  final pageMain = [
    PostIndex(),
    PostCreate(),
    UserPorfile(),
  ];
  AppMain({
    this.currentIndex = 0
  });
  @override
  Widget build(BuildContext context) {
    return pageMain.elementAt(currentIndex);
  }
}
