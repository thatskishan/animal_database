import 'package:animal_database/modals/globals.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelpers {
  DBHelpers._();
  static final DBHelpers dbHelpers = DBHelpers._();

  Database? db;

  Future<void> initDB() async {
    var directory = await getDatabasesPath();
    String path = join(directory, "category.db");

    db = await openDatabase(
      path,
      version: 5,
      onCreate: (Database db, int ver) async {
        String query =
            "CREATE TABLE IF NOT EXISTS databsecat(Id INTEGER PRIMARY KEY AUTOINCREMENT,Name TEXT NOT NULL,Des TEXT NOT NULL, image BLOB);";
        await db.execute(query);
      },
    );
  }

  Future insertRecord() async {
    await initDB();

    String query = "INSERT INTO databsecat(Name,Image,Des) VALUES(?, ?, ?, ?);";

    List args = [
      Global.categories.length,
    ];

    return await db!.rawInsert(query, args);
  }

  Future fetchRecord() async {
    await initDB();

    String query = "SELECT * FROM databsecat;";
    List allImage = await db!.rawQuery(query);

    List image = Global.categories;

    return image;
  }
}
