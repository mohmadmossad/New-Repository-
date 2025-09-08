
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class DBService {
  static Database? _db;
  static Future<void> init() async {
    final dbPath = p.join(await getDatabasesPath(), 'accounting_inventory.db');
    _db = await openDatabase(dbPath, version: 1, onCreate: (db, v) async {
      await db.execute('''
        CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price REAL, quantity INTEGER);
      ''');
      await db.execute('''
        CREATE TABLE customers(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, phone TEXT, address TEXT, balance REAL DEFAULT 0);
      ''');
      await db.execute('''
        CREATE TABLE suppliers(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, phone TEXT, address TEXT, performance_score INTEGER DEFAULT 0, balance REAL DEFAULT 0);
      ''');
      await db.execute('''
        CREATE TABLE payment_vouchers(id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, amount REAL, supplier_id INTEGER, description TEXT);
      ''');
      await db.execute('''
        CREATE TABLE receipt_vouchers(id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, amount REAL, customer_id INTEGER, description TEXT);
      ''');
      await db.execute('''
        CREATE TABLE chart_of_accounts(id INTEGER PRIMARY KEY AUTOINCREMENT, code TEXT, name TEXT, type TEXT, parent_id INTEGER, opening_balance REAL DEFAULT 0, notes TEXT);
      ''');
      await db.execute('''
        CREATE TABLE journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, description TEXT);
      ''');
      await db.execute('''
        CREATE TABLE journal_lines(id INTEGER PRIMARY KEY AUTOINCREMENT, entry_id INTEGER, account_id INTEGER, debit REAL DEFAULT 0, credit REAL DEFAULT 0);
      ''');
      await db.execute('''
        CREATE TABLE invoices(id INTEGER PRIMARY KEY AUTOINCREMENT, type TEXT, date TEXT, total_amount REAL, currency TEXT, exchange_rate REAL, warehouse_id INTEGER, customer_id INTEGER);
      ''');
      await db.execute('''
        CREATE TABLE invoice_items(id INTEGER PRIMARY KEY AUTOINCREMENT, invoice_id INTEGER, product_id INTEGER, quantity REAL, price REAL);
      ''');
      await db.execute('''
        CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT UNIQUE, password_hash TEXT, role TEXT, permissions TEXT);
      ''');
    });
  }

  static Future<Database> db() async {
    if (_db == null) await init();
    return _db!;
  }
}
