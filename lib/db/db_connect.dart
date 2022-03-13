import 'package:employee_dir/models/employees.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBConnect {
  static Database _database;

  static final DBConnect db = DBConnect._();
  DBConnect._();
  
  Future<Database> get database async {
   
    if (_database != null) return _database;

    _database = await initDB('employees.db');

    return _database;
  }
  initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Employees('
          'id INTEGER PRIMARY KEY,'
          'name TEXT,'
          'username TEXT,'
          'email TEXT,'
          'profile_image TEXT,'
          'street TEXT,'
          'suite TEXT,'
          'city TEXT,'
          'zipcode TEXT,'
          'lat TEXT,'
          'lng TEXT,'
          'phone INTEGER,'
          'website TEXT,'
          'cname TEXT,'
          'catchPhrase TEXT,'
          'bs TEXT'
          ')');
    });
  }
   createEmployee(Employees newEmployee) async {
    await deleteAllEmployees();
    final db = await database;
    final res = await db.insert('Employees', newEmployee.toJson());

    return res;
  }
  Future<int> deleteAllEmployees() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Employees');

    return res;
  }
  Future<List<Employees>> getAllEmployees() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM EMPLOYEES");

    List<Employees> list =
        res.isNotEmpty ? res.map((c) => Employees.fromJson(c)).toList() : [];

    return list;
  }

}