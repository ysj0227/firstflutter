import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    List<Widget> list = [];
    for (int i = 0; i < titleItems.length; i++) {
      list.add(buildListData(
          context, i, titleItems[i], iconItems[i], subTitleItems[i]));
    }
    // 分割线
    var divideTiles =
        ListTile.divideTiles(context: context, tiles: list).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ListView'),
      ),
      body: Scrollbar(
        // 默认写法
//         child: new ListView(
//           children: _list,
//         ),

        // ListView.builder写法
//        child: new ListView.builder(
//            // 无分割线
////            itemBuilder: (context, item) {
////              return buildListData(context, titleItems[item], iconItems[item], subTitleItems[item]);
////            },
//            // 有分割线
//            itemBuilder: (context, item) {
//              return new Container(
//                child: new Column(
//                  children: <Widget>[
//                    buildListData(context, titleItems[item], iconItems[item], subTitleItems[item]),
//                    new Divider()
//                  ],
//                ),
//              );
//            },
//            itemCount: iconItems.length,
//        ),

        // ListView.separated写法
        child: ListView.separated(
            itemBuilder: (context, item) {
              return buildListData(context, item, titleItems[item],
                  iconItems[item], subTitleItems[item]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: iconItems.length),
      ),
    );
  }

  Widget buildListData(BuildContext context, int index, String titleItem,
      Icon iconItem, String subTitleItem) {
    return ListTile(
      leading: iconItem,
      title: Text(
        titleItem,
        style: const TextStyle(color: Colors.orange, fontSize: 18),
      ),
      subtitle: Text(
        subTitleItem,
      ),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        showAlertDialog(context,index);
      },
      onLongPress: () => print("$index 长按了"),
    );
  }

  showAlertDialog(BuildContext context,int index) {
    print('点击了 $index');
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
      title: const Text("第  Title ",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.w800)),
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

  List<Icon> iconItems = <Icon>[
    const Icon(Icons.keyboard),
    const Icon(Icons.print),
    const Icon(Icons.router),
    const Icon(Icons.pages),
    const Icon(Icons.zoom_out_map),
    const Icon(Icons.zoom_out),
    const Icon(Icons.youtube_searched_for),
    const Icon(Icons.wifi_tethering),
    const Icon(Icons.wifi_lock),
    const Icon(Icons.widgets),
    const Icon(Icons.weekend),
    const Icon(Icons.web),
    const Icon(Icons.accessible),
    const Icon(Icons.ac_unit),
  ];

  // 数据源
  List<String> titleItems = <String>[
    'keyboard',
    'print',
    'router',
    'pages',
    'zoom_out_map',
    'zoom_out',
    'youtube_searched_for',
    'wifi_tethering',
    'wifi_lock',
    'widgets',
    'weekend',
    'web',
    '图accessible',
    'ac_unit',
  ];

  List<String> subTitleItems = <String>[
    'subTitle: keyboard',
    'subTitle: print',
    'subTitle: router',
    'subTitle: pages',
    'subTitle: zoom_out_map',
    'subTitle: zoom_out',
    'subTitle: youtube_searched_for',
    'subTitle: wifi_tethering',
    'subTitle: wifi_lock',
    'subTitle: widgets',
    'subTitle: weekend',
    'subTitle: web',
    'subTitle: accessible',
    'subTitle: ac_unit',
  ];
}
