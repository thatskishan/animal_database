import 'package:animal_database/modals/globals.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();

  Database? db;

  Future<void> initDB() async {
    var directory = await getDatabasesPath();
    String path = join(directory, "jungle.db");

    db = await openDatabase(
      path,
      version: 5,
      onCreate: (Database db, int ver) async {
        String query =
            "CREATE TABLE IF NOT EXISTS animal(Id INTEGER PRIMARY KEY AUTOINCREMENT,Title TEXT NOT NULL,Button TEXT NOT NULL, Course TEXT NOT NULL, image BLOB);";
        await db.execute(query);
      },
    );
  }

  Future insertRecord() async {
    await initDB();

    String query = "INSERT INTO animal(Title,Button,Image) VALUES(?, ?, ?, ?);";

    List args = [
      Global.slider.length,
    ];

    return await db!.rawInsert(query, args);
  }

  Future fetchRecordImage() async {
    await initDB();

    String query = "SELECT * FROM animal;";
    List allImage = await db!.rawQuery(query);

    List image = Global.slider;

    return image;
  }

  Future insertCategoryRecord() async {
    await initDB();

    String query = "INSERT INTO animal(Title,Button,Image) VALUES(?, ?, ?, ?);";

    List args = [
      Global.categories.length,
    ];

    return await db!.rawInsert(query, args);
  }

  Future fetchCategoryRecord() async {
    await initDB();

    String query = "SELECT * FROM animal;";
    List allImage = await db!.rawQuery(query);

    List cat = Global.categories;

    return cat;
  }
}

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
