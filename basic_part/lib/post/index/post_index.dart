import 'package:flutter/material.dart';

class PostIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Icon(
          Icons.explore_outlined,
          size: 128,
          color: Colors.black12
        ),
        Icon(
          Icons.local_fire_department_outlined,
          size: 128,
          color: Colors.black12
        )
      ],
    );
  }
}