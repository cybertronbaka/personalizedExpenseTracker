import 'package:Churpu/enums/transaction_types.dart';
import 'package:Churpu/utils/churpu_db.dart';
import 'package:sqflite/sqflite.dart';

final String tableTransactions = 'transactions';

class TransactionFields{
  static final String id = '_id';
  static final String tagId = 'tag_id';
  static final String dateTime = 'date_time';
  static final String amount = 'amount';
  static final String tagName = 'tag_name';
  static final String transactionType = 'transaction_type';

  static final List<String> values = [
    id, tagId, dateTime, amount, tagName, transactionType
  ];
}

class Transaction{
  final int? id;
  final int tagId;
  final DateTime dateTime;
  final double amount;
  final String tagName;
  final TransactionType transactionType;

  Transaction({
    this.id,
    required this.tagId,
    required this.dateTime,
    required this.amount,
    required this.tagName,
    required this.transactionType
  });

  Transaction copy({
    int? id,
    int? tagId,
    DateTime? dateTime,
    double? amount,
    String? tagName,
    TransactionType? transactionType,
  }) => Transaction(
    id: id ?? this.id,
    tagId: tagId?? this.tagId,
    dateTime: dateTime ?? this.dateTime,
    amount: amount ?? this.amount,
    tagName: tagName ?? this.tagName,
    transactionType: transactionType ?? this.transactionType
  );

  Map<String, Object?> toJson() => {
    TransactionFields.id: id,
    TransactionFields.tagId: tagId,
    TransactionFields.dateTime: dateTime.toIso8601String(),
    TransactionFields.amount: amount,
    TransactionFields.tagName: tagName,
    TransactionFields.transactionType: transactionType.toShortString()
  };

  static Transaction fromJson(Map<String, Object?> json) => Transaction(
    id: json[TransactionFields.id] as int?,
    tagId: json[TransactionFields.tagId] as int,
    dateTime: DateTime.parse(json[TransactionFields.dateTime] as String),
    amount: json[TransactionFields.amount] as double,
    tagName: json[TransactionFields.tagName] as String,
    transactionType: strEqualsToTransactionType((json[TransactionFields.transactionType]) as String)
  );
  //DB Operations

  static Future<Transaction> create(Transaction income) async {
    final Database db = await ChurpuDb.instance.database as Database;

    final id = await db.insert(tableTransactions, income.toJson());

    return income.copy(id: id);
  }

  static Future<Transaction?> read(int id) async {
    final Database db = await ChurpuDb.instance.database as Database;

    final maps = await db.query(
      tableTransactions,
      columns: TransactionFields.values,
      where: '${TransactionFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) return Transaction.fromJson(maps.first);
  }

  static Future<List<Transaction>?> readTransactions(TransactionType tType) async{
    final Database db = await ChurpuDb.instance.database as Database;

    final maps = await db.query(
      tableTransactions,
      columns: TransactionFields.values,
      where: '${TransactionFields.transactionType} = ?',
      whereArgs: [tType.toShortString()],
      orderBy: '${TransactionFields.dateTime} ASC',
    );
    return maps.map((json) => Transaction.fromJson(json)).toList();
  }

  static Future<int> delete(int id) async {
    final Database db = await ChurpuDb.instance.database as Database;

    return await db.delete(
      tableTransactions,
      where: '${TransactionFields.id} = ?',
      whereArgs: [id],
    );
  }
}