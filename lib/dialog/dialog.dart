library dialog_utils_lib;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String msg) {
  //设置按钮
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Continue"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  //设置对话框
  AlertDialog alert = AlertDialog(

    title: const Text("AlertDialog"),
    // content: Text(msg),
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Text(msg),
        ],
      ),
    ),
    actions: [cancelButton, continueButton],
  );

  //显示对话框
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
