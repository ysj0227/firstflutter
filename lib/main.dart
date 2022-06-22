import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firstflutter/applepage.dart';
import 'package:firstflutter/homepage.dart';
import 'package:firstflutter/http/http.dart';
import 'package:firstflutter/utils.dart';
import 'package:firstflutter/weatherpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dialog/dialog.dart';
import 'login.dart';

/// https://www.jianshu.com/p/8100be0413ae   代码规范

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle =
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};
    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);

        print('deviceData=   $deviceData');
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'brand': build.brand,
      'device': build.device,
      'id': build.id,
      'androidId': build.androidId,
      'manufacturer': build.manufacturer,
      'model': build.model,
    };
  }

  ///本地数据
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  Future<void> _DBCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('save=   $counter');

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });

    initPlatformState();
  }

  void _toUi() {
    setState(() {
      push();
    });
  }

  void push() {
    var nav = Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return LoginPage(title: 'Today is nice');
    }));

    //回调参数接收
    nav.then((val) => {toast(val)});
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    return GetMaterialApp(
        //为配合GetX使用
        title: "GetX",
        home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          bottomNavigationBar: _bottomNavigationBar(),
          body: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Swiper(
                      itemCount: bannerList().length,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          bannerList()[index]["url"],
                          fit: BoxFit.cover,
                        );
                      },
                      pagination: const SwiperPagination(),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: _toUi, child: const Text('TextButton Login')),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton(
                            onPressed: () {
                              _DBCounter();
                            },
                            child: const Text('轻量级数据保存')),
                        FutureBuilder<int>(
                          future: _counter,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasError) {
                                return Text("Error:${snapshot.error}"); //失败
                              } else {
                                return Text("Contents：${snapshot.data}");
                              }
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                      ],
                    )),
                MaterialButton(
                  onPressed: () {
                    showCusDialog(context, _deviceData.toString());
                  },
                  child: Text(
                    '设备信息：${_deviceData.toString()}',
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: 80.0,
                  height: 80.0,
                  // child: CircularImage(),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const HomePage();
                      }));
                    },
                    child: CircularImage(),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Icon(
                          Icons.widgets,
                          color: Colors.orange,
                        ),
                        MaterialButton(
                            onPressed: () {
                              dioGet(context);
                            },
                            child: const Text('网络请求数据')),
                        MaterialButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return const WeatherPage();
                              }));
                            },
                            child: const Text('查询天气')),
                        ElevatedButton(
                            onPressed: () => getXDialog(context),
                            child: const Text('GetX弹框')),
                      ]),
                ),
                MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const ApplePage();
                          }));
                    },
                    shape: const RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: const Text(
                      '数据库MOOR_FLUTTER',
                    )),
              ],
            ),
          ),
        ));
  }
}

/*
 *  使用CircleAvatar来实现圆形图片
 */
@immutable
class CircularImage extends StatelessWidget {
  var imgUrl =
      "https://c-ssl.duitang.com/uploads/item/201703/23/20170323195929_utNKH.jpeg";

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imgUrl),
      radius: 60.0,
    );
  }
}

void toast(String mag) {
  Fluttertoast.showToast(
      msg: mag,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
}

void toastBottom(String mag) {
  Fluttertoast.showToast(
      msg: mag,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      // timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
}

BottomNavigationBar _bottomNavigationBar() {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'favorite',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.accessible),
        label: 'accessible',
      ),
    ],
    onTap: (index) {
      toast('点击$index');
    },
  );
}

void getXDialog(BuildContext context) {
  Get.defaultDialog(
    title: "Get Dialog",
    middleText: "FlutterDevs is a protruding flutter app development company",
    backgroundColor: Colors.white,
    titleStyle: const TextStyle(color: Colors.blue),
    middleTextStyle: const TextStyle(color: Colors.blue),
    radius: 10.0,
    cancel: MaterialButton(
      onPressed: () {
        Navigator.of(context).pop();
        // Get.back();
      },
      color: Colors.blue,
      child: const Text(
        "cancel",
        style: TextStyle(color: Colors.white),
      ),
    ),
    confirm: MaterialButton(
      onPressed: () {
        Navigator.of(context).pop();
        // Get.back();
      },
      color: Colors.blue,
      child: const Text(
        "confirm",
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
