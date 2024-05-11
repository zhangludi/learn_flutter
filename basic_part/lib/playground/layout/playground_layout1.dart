import 'package:flutter/material.dart';
import 'package:basic_part/playground/layout/componentes/playground_layout_item.dart';
class PlaygroundLayout extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Colors.greenAccent,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: PlaygroundLayoutItem('1'),
              ),
              Expanded(
                flex: 1,
                child: PlaygroundLayoutItem('1'),
              ),
              PlaygroundLayoutItem('2'),
              PlaygroundLayoutItem('3'),
            ],
          ),
          
        ),
      )
    );
  }
}
