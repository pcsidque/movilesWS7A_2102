import 'package:app_my_cinespace/models/movie.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  final int version = 1;
  Database? db;

  static final DbHelper _dbHelper = DbHelper._internal();

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  Future<Database> openDb() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'moviesws7a.db'),
          onCreate: (db, version) {
            db.execute(
                'CREATE TABLE movies(id INTEGER PRIMARY KEY, title TEXT)');
          }, version: version);
    }
    return db!;
  }

  Future<int> insertMovie(Movie movie) async {
    int id = await db!.insert('movies', movie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);//opcional
    return id;
  }

  Future<bool> isFavorite(Movie movie) async {
    final List<Map<String, dynamic>> maps =
    await db!.query('movies', where: 'id = ?', whereArgs: [movie.id]);
    print("maps --> ");
    print(maps.length);
    return maps.length > 0;
  }

  Future<int> deleteMovie(Movie movie) async {
    int result =
    await db!.delete('movies', where: 'id = ?', whereArgs: [movie.id]);
    return result;
  }
}