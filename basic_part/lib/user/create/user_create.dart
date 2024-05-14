import 'package:flutter/material.dart';
class UserCreate extends StatefulWidget{
   @override
  State<UserCreate>createState () => _UserCreate();
}
class _UserCreate extends State<UserCreate>{
  final nameFiledController = TextEditingController();
  final nameFiledKey = GlobalKey<FormFieldState>();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
   super.dispose();
   nameFiledController.dispose(); 
  }
  void initSate() {
    super.initState();
    nameFiledController.text = 'zhangsan';
    nameFiledController.addListener(() {
      print('用户：${nameFiledController.text}');
    });
  }
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            '注册用户',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 32
            )
          ),
          TextFormField(
            key: nameFiledKey,
            controller: nameFiledController,
            // obscureText: true,
            decoration: InputDecoration(
              labelText: '用户'
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '请填写用户名';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // onChanged: (value) {
            //   name = value;
            // },
          ),
          ElevatedButton(
            onPressed: () {
              // nameFiledKey.currentState!.validate();
              formKey.currentState!.validate();
            },
            child: Text('注册用户'),
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 30),
              minimumSize: Size(double.infinity, 60)
            ),
          ),
          SizedBox(height: 32,)
        ]
      ),
    );
  }
}