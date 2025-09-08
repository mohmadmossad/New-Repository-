
import 'package:sqflite/sqflite.dart';
import 'db_service.dart';

class DB {
  static Future<Database> get db async => await DBService.db();
}
