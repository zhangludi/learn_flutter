import 'package:basic_part/app/components/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:basic_part/playground/layout/componentes/playground_layout_item.dart';
class PlaygroundLayout extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/icon.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover
        ),
        Positioned(
          bottom: 24,
          right: 24,
          child: AppLogo(size: 64,)
        )
      ],
    );
  }
}