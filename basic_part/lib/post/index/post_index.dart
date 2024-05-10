import 'package:flutter/material.dart';
import 'package:basic_part/post/index/components/post_index_latest.dart';
import 'package:basic_part/post/index/components/post_index_popular.dart';

class PostIndex extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return TabBarView(
      children: [
        Icon(
          Icons.explore_outlined,
          color: Colors.white,
          size: 128
        ),
        Icon(
          Icons.local_fire_department_outlined,
          color: Colors.white,
          size: 128
        ),
      ],
    );
  }
}