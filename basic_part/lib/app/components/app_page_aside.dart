import 'package:flutter/material.dart';

class AppPageAside extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('admin'), 
            accountEmail: Text('123@qq.com'),
            currentAccountPicture: Image.asset(
              'assets/images/icon.png',
            ),
          ),
          ListTile(
            title: Text(
              '评论',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.comment_outlined,
              color: Colors.amber,
              size: 22
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text(
              '账号',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.manage_accounts_outlined,
              color: Colors.amber,
              size: 22
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              '管理',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.collections_outlined,
              color: Colors.amber,
              size: 22
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text(
              '退出',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.logout_outlined,
              color: Colors.amber,
              size: 22
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}