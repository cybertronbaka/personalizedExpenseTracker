import 'package:Churpu/db/models/tags.dart';
import 'package:Churpu/db/models/transactions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ChurpuDb {
  static final ChurpuDb instance = ChurpuDb._init();
  static const String _dbName = 'churpu_db.db';
  static Database? _database;

  ChurpuDb._init();

  Future<Database?> get database async{
    if (_database != null)  return _database;

    return _database = await _initDB();
  }

  Future<Database> _initDB() async {
    final dbPath = await getApplicationDocumentsDirectory();

    final path = "${dbPath.toString()}/$_dbName";

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final intType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';
    final doubleType = 'FLOAT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableTags (
        ${TagFields.id} $idType,
        ${TagFields.name} $textType,
        ${TagFields.tagType} $textType,
        ${TagFields.defaultImage} $intType,
        ${TagFields.imagePath} $textType
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableTransactions (
        ${TransactionFields.id} $idType,
        ${TransactionFields.tagId} $intType,
        ${TransactionFields.amount} $doubleType,
        ${TransactionFields.dateTime} $textType,
        ${TransactionFields.tagName} $textType,
        ${TransactionFields.transactionType} $textType
      )
    ''');
  }

  Future close() async {
    final Database db = instance.database as Database;

    db.close();
  }
}