import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firstflutter/bean/weather.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  List<Forecast>? list;

  void dioGet(BuildContext context) async {
    try {
      var url = 'http://wthrcdn.etouch.cn/weather_mini?city=上海市';
      var response = await Dio().get(url);
      if (kDebugMode) {
        var jsonStr = response.data.toString();
        print('response= $jsonStr');
        Map<String, dynamic> map = json.decode(jsonStr);
        var result = Weather.fromJson(map);

        /// print('response=   ${result.desc}  ${result.status}');
        list = result.data?.forecast;

        list?.addAll(list!);

        print('size= ${listSize()}');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    dioGet(context);
  }

  int? listSize() {
    if (list == null) {
      return 0;
    }
    return list?.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather List'),
      ),
      body: Scrollbar(
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) => itemData(context, index),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(color: Colors.blue),
        ),
      ),
    );
  }

  Widget itemData(BuildContext context, int index) {
    String date1 = 'weather date';
    String high1 = "high temperature";
    String low1 = "low temperature";

    String? date;
    String? high;
    String? low;

    ///TODO 如何设置item
    if (list != null) {
      Forecast item = list![index];
      date = item.date;
      high = item.high;
      low = item.low;
    }

    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              date ?? date1,
              style: const TextStyle(fontSize: 20.0, color: Colors.blue),
            ),
            Text(
              high ?? high1,
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              low ?? low1,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ));
  }
}
