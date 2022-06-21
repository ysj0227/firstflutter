import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firstflutter/dialog/dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bean/weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  List<Forecast>? list = [];
  late Weather _weather;


  void dioGet(BuildContext context) async {
    try {
      var url = 'http://wthrcdn.etouch.cn/weather_mini?city=上海市';
      var response = await Dio().get(url);
      if (kDebugMode) {
        if (response.statusCode == 200) {
          var jsonStr = response.data.toString();
          print('response= $jsonStr');
          Map<String, dynamic> map = json.decode(jsonStr);
          var result = Weather.fromJson(map);
          _weather = result;
          print('response=   ${result.desc}  ${result.status}');

          setState(() {
            list = result.data?.forecast;
            list?.addAll(list!);
          });
        } else {
          ///Do not use BuildContexts across async gaps.
          ///showCusDialog(context, '请求Error');
        }
      }
    } catch (e) {}
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
      // appBar: AppBar(
      //   title: const Text('Weather List'),
      // ),
      body: NestedScrollView(
        body: Column(
          children: <Widget>[
            itemTitle(context),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) => itemData(context, index),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(color: Colors.blue),
              ),
            )
          ],
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
              title: Text('NestedScrollView'),
              centerTitle: true,
              pinned: true,
              stretch: true,
              stretchTriggerOffset: 100.0,
            )
          ];
        },
      ),

      // body: NestedScrollView(
      //   body: Expanded(
      //     child: ListView.separated(
      //       itemCount: 10,
      //       itemBuilder: (context, index) => itemData(context, index),
      //       separatorBuilder: (BuildContext context, int index) =>
      //       const Divider(color: Colors.blue),
      //     ),
      //   ),
      //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //     return <Widget>[
      //       const SliverAppBar(
      //         title: Text('NestedScrollView'),
      //         centerTitle: true,
      //         pinned: true,
      //         stretch: true,
      //         stretchTriggerOffset: 100.0,
      //       )
      //     ];
      //   },
      // ),

      // body: Scrollbar(
      //     radius: const Radius.circular(5),
      //     thickness: 5,
      //     child: Column(
      //       children: <Widget>[
      //         itemTitle(context),
      //         Expanded(
      //           child: ListView.separated(
      //             itemCount: 5,
      //             itemBuilder: (context, index) => itemData(context, index),
      //             separatorBuilder: (BuildContext context, int index) =>
      //             const Divider(color: Colors.blue),
      //           ),
      //         )
      //       ],
      //     )),
    );
  }

  Widget itemTitle(BuildContext context) {
    String? city;
    String? ganmao;
    String? wendu;
    try {
      city = _weather.data?.city;
      ganmao = _weather.data?.ganmao;
      wendu = _weather.data?.wendu;
    } catch (e) {}

    return Container(
      padding: const EdgeInsets.only(
          top: 15.0, bottom: 10.0, left: 10.0, right: 10.0),
      child: Column(children: <Widget>[
        Text('天气地址: ${city ?? ''} |  温度：${wendu ?? ''}',
            style: const TextStyle(fontSize: 18.0, color: Colors.blue)),
        Text('天气提醒： ${ganmao ?? ''}',
            style: const TextStyle(fontSize: 18.0, color: Colors.blue)),
      ]),
    );
  }

  Widget itemData(BuildContext context, int index) {
    String date1 = 'weather date';
    String high1 = "high temperature";
    String low1 = "low temperature";
    String fengxiang1 = "fengxiang";

    String? date;
    String? high;
    String? low;
    String? fengxiang;
    try {
      Forecast? item = list?[index];
      date = item?.date;
      high = item?.high;
      low = item?.low;
      fengxiang = item?.fengxiang;
    } catch (e) {}

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
            Text(
              fengxiang ?? fengxiang1,
              style: const TextStyle(fontSize: 18.0),
            ),
            const Text(
              '最大风力2级',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ));
  }
}
