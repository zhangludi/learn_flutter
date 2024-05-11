import 'package:flutter/material.dart';
import 'package:basic_part/app/themes/app_theme.dart';
import 'package:basic_part/app/components/app_header.dart';
import 'package:basic_part/app/components/app_bottom.dart';
import 'package:basic_part/app/components/app_main.dart';
import 'package:basic_part/app/components/app_floating_action_button.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int currentBottomNavigatorBarItem = 0;
  bool showAppBar = true;
  void onTapBottomNavigatorBarItem (int index) {
    setState(() {
      currentBottomNavigatorBarItem = index;
    });
    setState(() {
      showAppBar = index == 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: AppMain(currentIndex: currentBottomNavigatorBarItem),
          appBar: showAppBar ? AppHeader(): null,
          bottomNavigationBar: AppBottom(
            currentIndex: currentBottomNavigatorBarItem,
            onTap: onTapBottomNavigatorBarItem
          ),
          floatingActionButton: AppFloatingActionButton(),
        ),
      ),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}