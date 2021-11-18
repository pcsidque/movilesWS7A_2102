import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

class Orders extends Table{
  IntColumn get id => integer()();
  TextColumn get productName => text()();
  TextColumn get price => text()();
}

@UseMoor(tables: [Orders])
class AppDatabase extends _$AppDatabase{
  AppDatabase()
  : super(FlutterQueryExecutor.inDatabaseFolder(path: "dbver2.sqlite",
  logStatements: true));

  int get schemaVersion => 1;

  //CRUD
  Future<List<Order>> getAllOrder() => select(orders).get();
  Stream<List<Order>> watchAllOrder() => select(orders).watch();

  Future insertNewOrder(Order order) => into(orders).insert(order);

  Future updateOrder(Order order) => update(orders).replace(order);

  Future deleteOrder(Order order) => delete(orders).delete(order);
}