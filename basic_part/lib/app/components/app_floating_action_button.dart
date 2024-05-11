import 'package:flutter/material.dart';

class AppFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white70,
      child: Icon(Icons.share_outlined),
    );
  }
}