import 'package:luminouskeytask/features/home/home.export.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DataBase {
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'users.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY , name TEXT NOT NULL,email TEXT NOT NULL,password TEXT NOT NULL,phoneNumber TEXT NOT NULL)",
        );
      },
    );
  }

// insert data
  Future<int> insertUsers(List<Users> planets) async {
    int result = 0;
    final Database db = await initializedDB();
    for (var planet in planets) {
      result = await db.insert('users', planet.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    return result;
  }

// retrieve data
  Future<List<Users>> retrieveUsers() async {
    final Database db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => Users.fromMap(e)).toList();
  }

// delete user
  Future<void> deleteUsers(int id) async {
    final db = await initializedDB();
    await db.delete(
      'planets',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
