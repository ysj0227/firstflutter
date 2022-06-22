// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruit.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Fruit extends DataClass implements Insertable<Fruit> {
  final String name;
  final String des;
  final String? createTime;
  final int id;
  Fruit(
      {required this.name,
      required this.des,
      this.createTime,
      required this.id});
  factory Fruit.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Fruit(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      des: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}des'])!,
      createTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}create_time']),
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['des'] = Variable<String>(des);
    if (!nullToAbsent || createTime != null) {
      map['create_time'] = Variable<String?>(createTime);
    }
    map['id'] = Variable<int>(id);
    return map;
  }

  FruitsCompanion toCompanion(bool nullToAbsent) {
    return FruitsCompanion(
      name: Value(name),
      des: Value(des),
      createTime: createTime == null && nullToAbsent
          ? const Value.absent()
          : Value(createTime),
      id: Value(id),
    );
  }

  factory Fruit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Fruit(
      name: serializer.fromJson<String>(json['name']),
      des: serializer.fromJson<String>(json['des']),
      createTime: serializer.fromJson<String?>(json['createTime']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'des': serializer.toJson<String>(des),
      'createTime': serializer.toJson<String?>(createTime),
      'id': serializer.toJson<int>(id),
    };
  }

  Fruit copyWith({String? name, String? des, String? createTime, int? id}) =>
      Fruit(
        name: name ?? this.name,
        des: des ?? this.des,
        createTime: createTime ?? this.createTime,
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('Fruit(')
          ..write('name: $name, ')
          ..write('des: $des, ')
          ..write('createTime: $createTime, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, des, createTime, id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Fruit &&
          other.name == this.name &&
          other.des == this.des &&
          other.createTime == this.createTime &&
          other.id == this.id);
}

class FruitsCompanion extends UpdateCompanion<Fruit> {
  final Value<String> name;
  final Value<String> des;
  final Value<String?> createTime;
  final Value<int> id;
  const FruitsCompanion({
    this.name = const Value.absent(),
    this.des = const Value.absent(),
    this.createTime = const Value.absent(),
    this.id = const Value.absent(),
  });
  FruitsCompanion.insert({
    required String name,
    required String des,
    this.createTime = const Value.absent(),
    this.id = const Value.absent(),
  })  : name = Value(name),
        des = Value(des);
  static Insertable<Fruit> custom({
    Expression<String>? name,
    Expression<String>? des,
    Expression<String?>? createTime,
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (des != null) 'des': des,
      if (createTime != null) 'create_time': createTime,
      if (id != null) 'id': id,
    });
  }

  FruitsCompanion copyWith(
      {Value<String>? name,
      Value<String>? des,
      Value<String?>? createTime,
      Value<int>? id}) {
    return FruitsCompanion(
      name: name ?? this.name,
      des: des ?? this.des,
      createTime: createTime ?? this.createTime,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (des.present) {
      map['des'] = Variable<String>(des.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<String?>(createTime.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FruitsCompanion(')
          ..write('name: $name, ')
          ..write('des: $des, ')
          ..write('createTime: $createTime, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $FruitsTable extends Fruits with TableInfo<$FruitsTable, Fruit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FruitsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _desMeta = const VerificationMeta('des');
  @override
  late final GeneratedColumn<String?> des = GeneratedColumn<String?>(
      'des', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _createTimeMeta = const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<String?> createTime = GeneratedColumn<String?>(
      'create_time', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  @override
  List<GeneratedColumn> get $columns => [name, des, createTime, id];
  @override
  String get aliasedName => _alias ?? 'fruits';
  @override
  String get actualTableName => 'fruits';
  @override
  VerificationContext validateIntegrity(Insertable<Fruit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('des')) {
      context.handle(
          _desMeta, des.isAcceptableOrUnknown(data['des']!, _desMeta));
    } else if (isInserting) {
      context.missing(_desMeta);
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Fruit map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Fruit.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FruitsTable createAlias(String alias) {
    return $FruitsTable(attachedDatabase, alias);
  }
}

abstract class _$FruitsDatabase extends GeneratedDatabase {
  _$FruitsDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FruitsTable fruits = $FruitsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [fruits];
}
