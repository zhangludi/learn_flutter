import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  Future<bool?> showAppAplertDialog(context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('确认提交'),
        content: Text('确认提交后不能恢复，确定要提交'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false) , 
            child: Text('取消')
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true) , 
            child: Text('确定'),
          ),
        ],
      ),
    );
  }
  void showAppSnackBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('提交成功'),
        action: SnackBarAction(
          label: '关闭',
          onPressed:  () {  },
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -20),
            blurRadius: 30
          )
        ]
      ),
      child: Center(
        child: TextButton(
          child: Text('提交'),
          onPressed: () async {
            final result = await showAppAplertDialog(context);
            if (result != null && result) {
              showAppSnackBar(context);
            }
          },
        ),
      ),
    );
  }
}