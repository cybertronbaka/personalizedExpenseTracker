import 'package:Churpu/db/models/tags.dart';
import 'package:Churpu/db/models/transactions.dart';
import 'package:Churpu/enums/tag_categories.dart';
import 'package:Churpu/enums/transaction_types.dart';
import 'package:stacked/stacked.dart';

class TransactionViewModel extends BaseViewModel {
  TransactionType _transactionType = TransactionType.Expense;
  bool loading = true;
  bool dataExists = false;
  final DateTime now = DateTime.now();
  late List<Transaction> cards;
  double headerAmount = 0;

  Transaction getCard(int i) => cards[i];
  double getHeaderAmount() => headerAmount;
  int getCardsCount() => cards.length;
  bool getLoading() => loading;
  List<Transaction> getCards() => cards;

  void setHeaderAmount(double amount){
    headerAmount = amount;
  }

  void setTransactionType(TransactionType tType){
    _transactionType = tType;
  }

  void refreshCards() async {
    cards = await Transaction.readTransactions(_transactionType) ?? [];
    if(cards.isEmpty) {
      Tag tag1 = Tag(id: 1, name: 'Food', tagType: strEqualsToTagCategory(_transactionType.toShortString()));
      Tag.create(tag1);
      Transaction card = Transaction(tagId: tag1.id ?? 1, amount: 10, dateTime: DateTime(now.year, now.month, now.day - 8), tagName: tag1.name, transactionType: _transactionType);
      Transaction.create(card);
      Transaction card1 = Transaction(tagId: tag1.id ?? 1, amount: 10, dateTime: DateTime(now.year, now.month, now.day - 3), tagName: tag1.name, transactionType: _transactionType);
      Transaction.create(card1);
    }
    cards = await Transaction.readTransactions(_transactionType) ?? [];
    loading = false;
    dataExists = cards.isNotEmpty;
    headerAmount = cards.map((e) => e.amount).fold(0.0, (a, b) => a + b);
    notifyListeners();
  }
}