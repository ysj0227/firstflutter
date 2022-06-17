library http_lib;


import 'package:dio/dio.dart';
import 'package:firstflutter/dialog/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

void dioGet(BuildContext context) async {
  try {
    var response =
        await Dio().get('http://wthrcdn.etouch.cn/weather_mini?city=上海市');
    if (kDebugMode) {
      var data = response.data.toString();
      print('response= $data');

      showAlertDialog(context, data);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
  }
}

void get() async {
  Response response;
  var dio = Dio();
  response = await dio.get('/test?id=12&name=wendu');
  print(response.data.toString());
  response =
      await dio.get('/test', queryParameters: {'id': 12, 'name': 'wendu'});
  print(response.data.toString());
}
