import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget{
  @override
  final Size preferredSize = Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/images/icon.png',
        width: 128,
        color: Colors.black12,
      ),
      leading: IconButton(
        icon: Icon(Icons.menu_outlined),
        color: Colors.amber,
        onPressed: () {},
      ),
      actions: [
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.more_horiz)
        ),
      ],
      bottom: TabBar(
        tabs: [
          Tab(text: "最近"),
          Tab(text: "热门")
        ]
      ),
    );
  }
}
