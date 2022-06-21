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

showCusDialog(BuildContext context, String msg) {
  Widget buttonCancel = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('取消'));
  Widget buttonConfirm = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('确定'));

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("AlertDialog"),
          content: Text(msg),
          actions: [buttonCancel, buttonConfirm],
        );
      });
}
