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

  Future fetchRecordTitle() async {
    await initDB();

    String query = "SELECT * FROM animal;";
    List allTitle = await db!.rawQuery(query);

    List title = Global.slider;

    return title;
  }

  Future fetchRecordButton() async {
    await initDB();

    String query = "SELECT * FROM animal;";
    List allButton = await db!.rawQuery(query);

    List button = Global.slider;

    return button;
  }
}
