import 'package:flutter/material.dart';
import 'package:basic_part/app/components/app_bottom_sheet.dart';

class AppFloatingActionButton extends StatefulWidget {
  @override
  State<AppFloatingActionButton> createState() => _AppFloatingActionButton();
}

class _AppFloatingActionButton extends State<AppFloatingActionButton> {
  bool isBottomSheetShown = false;
  Icon floatingActionButtonIcon () {
    return isBottomSheetShown ? Icon(Icons.close) : Icon(Icons.support_agent);
  }
  Widget build (BuildContext context) {
    return FloatingActionButton(
      child: floatingActionButtonIcon (),
      onPressed: () {
        if (isBottomSheetShown) {
          return Navigator.pop(context);
        };
        final bottomSheetController = showBottomSheet(
          context: context,
          builder: (context) => AppBottomSheet()
        );
        setState(() {
          isBottomSheetShown = true;
        });
        bottomSheetController.closed.then((value){
          setState(() {
            isBottomSheetShown = false;
          });
        });
      },
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white70,

    );
  }
}