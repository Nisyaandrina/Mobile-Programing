import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> getDatabase() async {
    if (_db != null) return _db!;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'users.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY,
            name TEXT,
            email TEXT,
            city TEXT
          )
        ''');
      },
    );
    return _db!;
  }

  static Future<void> insertUsers(List<dynamic> users) async {
    final db = await getDatabase();
    await db.delete('users'); // hapus data lama
    for (var user in users) {
      await db.insert('users', {
        'id': user['id'],
        'name': user['name'],
        'email': user['email'],
        'city': user['address']['city'],
      });
    }
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await getDatabase();
    return db.query('users');
  }
}