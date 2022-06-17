import 'dart:io';

import 'package:firstflutter/homepage.dart';
import 'package:firstflutter/http/http.dart';
import 'package:firstflutter/weatherpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      push();
    });
  }

  void _toUi() {
    setState(() {
      push();
    });
  }

  void push() {
    // Navigator.push<String>(
    //     context, MaterialPageRoute(builder: (context) => const LoginPage()));

    var nav = Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return LoginPage(title: 'Today is nice');
    }));

    //回调参数接收
    nav.then((val) => {
          toast(val)

          // print(val)
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        // body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Click Right Button'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(onPressed: _toUi, child: const Text('TextButton')),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: const <Widget>[
                    Text('Start Tool Call'),
                    Text('Start Tool Call'),
                  ],
                )),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: const <Widget>[
                    Text('Different Between Colors  '),
                    Text('Different Between Colors'),
                  ],
                )),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: 80.0,
              height: 80.0,
              child: Image.asset(
                'images/ic_head_default.png',
                fit: BoxFit.cover,
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
            MaterialButton(
                onPressed: () {
                 /// toast('dio 网络请求');
                  dioGet(context);
                },
                child: const Text('MaterialButton')),

            MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const WeatherPage();
                      }));
                },
                child: const Text('查询上海天气')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
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

void isolate() {
  /// Isolate.spawn((message) { }, message)
}
