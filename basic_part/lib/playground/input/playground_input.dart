import 'package:basic_part/user/create/user_create.dart';
import 'package:flutter/material.dart';

class PlaygroundInput extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.all(32),
        child: UserCreate()
      ),
    );
  }
}