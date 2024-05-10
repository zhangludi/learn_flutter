import 'package:flutter/material.dart';

class AppPageHeaderActionsMore extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_horiz),
      offset: Offset(0, -20),
      onCanceled: () {
        print('PopupMenuButton cancel');
      },
      onSelected: (value) {
        print('PopupMenuButton $value');
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Icon(
            Icons.view_agenda_outlined,
            color: Colors.amber
          ),
          value: 'stack',
        ),
        PopupMenuItem(
          child: Icon(
            Icons.dashboard_outlined,
            color: Colors.amber
          ),
          value: 'grid',
        ),
      ],
    );
  }
}