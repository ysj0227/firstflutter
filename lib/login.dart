import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  String title;

  LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  //全局key用来获取From表单组件
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: loginKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: '请输入用户名'),
                    onSaved: (value) {
                      username = value!;
                    },
                    onFieldSubmitted: (value) {},
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: '请输入密码'),
                    obscureText: true,
                    validator: (value) {
                      // return value?.length < 6 ? '密码长度不够六位' : null;
                    },
                    onSaved: (value) {
                      password = value!;
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 340.0,
            height: 42.0,
            child: MaterialButton(
              onPressed: () {
                showAlertDialog(context);
              },
              color: Colors.lightBlue,
              elevation: 2.0,
              textColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              child: const Text(
                '登录',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
          Container(
            // padding: const EdgeInsets.only(top: 10.0),
            margin: const EdgeInsetsDirectional.only(top: 35.0, bottom: 35.0),
            width: 340.0,
            height: 42.0,
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pop('receive message success');
              },
              color: Colors.lightBlue,
              elevation: 2.0,
              textColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              child: const Text(
                '返回上页面',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  //设置按钮
  Widget cancelButton = FlatButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
    child: const Text("Continue"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  //设置对话框
  AlertDialog alert = AlertDialog(
    title: const Text("AlertDialog"),
    content: const Text("Would you like to continue learning?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  //显示对话框
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
