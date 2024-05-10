import 'package:flutter/material.dart';
import 'package:basic_part/app/components/app_logo.dart';
import 'package:basic_part/app/components/app_page_header_actions_more.dart';

class AppPageHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = Size.fromHeight(100);
  @override
  Widget build (BuildContext context) {
    return AppBar(
      title:  AppLogo(), // logo组建
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        AppPageHeaderActionsMore(),
      ],
      bottom: TabBar(
        tabs: [
          Tab(text: '最新'),
          Tab(text: '热门')
        ]
      ),
    ); 
  }
}