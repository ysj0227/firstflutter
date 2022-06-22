import 'package:firstflutter/db/fruit.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'fruitdao.g.dart';

/// part 'fruitdao.g.dart' 前缀名称必须和创建的文件 fruitdao.dart一致
/// _$FruitsDaoMixin  后缀必须mixin

@UseDao(tables: [Fruits])
class FruitsDao extends DatabaseAccessor<FruitsDatabase> with _$FruitsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  FruitsDao(FruitsDatabase db) : super(db);

  ///查询list
  Future<List<Fruit>> get getAllList => select(fruits).get();

  /// 每当基础数据发生变化时，都会发出新项
  Stream<List<Fruit>> watchAllList() => select(fruits).watch();

  /// 插入
  Future insert(FruitsCompanion todo) => into(fruits).insert(todo);

  Future insert2(Fruit todo) => into(fruits).insert(todo);

  /// 更新
  Future<bool> updateItem(Fruit data) => update(fruits).replace(data);

  /// 删除
  Future<int> deleteItem(Fruit data) => delete(fruits).delete(data);
}
