import 'package:moor_flutter/moor_flutter.dart';

part 'fruit.g.dart';

/// flutter packages pub run build_runner build
/// create .g.dart
/// **fruit.g.dart 前缀表名要和fruit.dart前缀一致
class Fruits extends Table {
  TextColumn get name => text()();

  TextColumn get des => text()();

  TextColumn get createTime => text().nullable()();

  IntColumn get id => integer().autoIncrement()();
}

/// 创建表
@UseMoor(tables: [Fruits])
class FruitsDatabase extends _$FruitsDatabase {
  // we tell the database where to store the data with this constructor
  FruitsDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 1;

  // ///查询list
  // Future<List<Fruit>> get getAllList => select(fruits).get();
  //
  // /// 每当基础数据发生变化时，都会发出新项
  // Stream<List<Fruit>> watchAllList() => select(fruits).watch();
  //
  // /// 插入
  // Future insert(FruitsCompanion todo) => into(fruits).insert(todo);
  //
  // /// 更新
  // Future<bool> updateItem(Fruit data) => update(fruits).replace(data);
  //
  // /// 删除
  // Future<int> deleteItem(Fruit data) => delete(fruits).delete(data);
}
