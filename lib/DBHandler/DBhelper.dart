import 'package:login/Model/UserModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DBhelper {
  static Database? _db;

  static const  DB_Name= 'test.db';
  static const String Table_User ='user';
  static const int Version = 1;

  static const String C_USERID ='user_id';
  static const String C_USERName ='user_name';
  static const String C_Email ='email';
  static const String C_Password ='password';
  static const String C_phone ='phone';

  Future<Database?> get db async{
    if(_db != null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }
  _onCreate(Database db, int intVersion) async{
    await db.execute("CREATE TABLE $Table_User ("
        "$C_USERID TEXT PRIMARY KEY,"
        "$C_USERName TEXT,"
        " $C_Email TEXT,"
        "$C_Password TEXT,"
        "$C_phone TEXT,"
        "PRIMARY KEY ($C_USERID))");
  }
  Future<UserMode> saveData(UserMode user) async{
  var dbClient = await db;
  user.user_id = (await dbClient?.insert(Table_User, user.toMap())) as String;
  return user;
  }
  Future<UserMode?> getLoginUser(String userId, String password) async{
    var dbclient = await db;
    var res = await dbclient?.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_USERID= '$userId' AND "
        "$C_Password= '$password' ");
    if(res!.isNotEmpty){
      return UserMode.fromMap(res.first);

    }
    return null;
  }
}