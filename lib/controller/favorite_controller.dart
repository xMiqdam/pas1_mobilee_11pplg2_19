
import 'package:get/get.dart';
import 'package:pas1_mobilee_11pplg2_19/model/model_liga.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FavoriteController extends GetxController {
  static Database? _db;

  var tasks = <ModelBola>[].obs;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'task_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            strTeam TEXT, 
            strStadium TEXT,
            strBadge TEXT, 
            strDescriptionEN TEXT, 
            isCompleted INTEGER
          )
        ''');
      },
    );
  }

  // Insert Task
  Future<int> addTask(ModelBola task) async {
    var dbClient = await db;
    int result = await dbClient!.insert('tasks', task.toMap());
    loadTasks();
    return result;
  }

  // Retrieve Tasks
  Future<void> loadTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('tasks');
    tasks
        .assignAll(queryResult.map((data) => ModelBola.fromMap(data)).toList());
  }

  // Delete Task
  Future<void> deleteTask(int id) async {
    var dbClient = await db;
    await dbClient!.delete('tasks', where: 'id = ?', whereArgs: [id]);
    loadTasks();
  }
}