import 'package:firstflutter/db/fruitProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplePage extends StatefulWidget {
  const ApplePage({Key? key}) : super(key: key);

  @override
  ApplePageState createState() => ApplePageState();
}

class ApplePageState extends State<ApplePage> {
  String username = "";
  String password = "";

  //全局key用来获取From表单组件
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) {
        return FruitsProvider();
      },
      child: MaterialApp(
        title: 'db',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('MOOR FLUTTER DB'),
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 340.0,
                height: 62.0,
                child: MaterialButton(
                  onPressed: () {
                    print('6666 input edit $username');

                    // final database = Provider.of<FruitsProvider>(context);
                    // final data = Fruit(
                    //   name: '喵喵喵喵喵喵',
                    //   des: '的背包客',
                    //   id: 1,
                    // );
                    // database.fruitsDao.insert2(data);
                  },
                  color: Colors.lightBlue,
                  elevation: 2.0,
                  textColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: const Text(
                    '保存本地数据',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              // StreamBuilder<List<Fruit>>(
              //   stream: Provider.of<FruitsProvider>(context)
              //       .fruitsDao
              //       .watchAllList(),
              //   builder: (BuildContext context,
              //       AsyncSnapshot<List<Fruit>> snapshot) {
              //     if (snapshot.connectionState == ConnectionState.done) {
              //       if (snapshot.hasError) {
              //         return Text("Error:${snapshot.error}"); //失败
              //       } else {
              //         final list = snapshot.data ?? [];
              //
              //         print('9999 db size= ${list.length}');
              //
              //         return Text("Contents：${list.length}");
              //       }
              //     } else {
              //       return Text('null');
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
