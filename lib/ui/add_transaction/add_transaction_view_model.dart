import 'package:Churpu/app/app.locator.dart';
import 'package:Churpu/db/models/tags.dart';
import 'package:Churpu/db/models/transactions.dart';
import 'package:Churpu/enums/tag_categories.dart';
import 'package:Churpu/enums/transaction_types.dart';
import 'package:Churpu/widgets/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddTransactionViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final TextEditingController amountController = TextEditingController();
  final dropdownController = CustomDropdownController();

  DateTime? _dateTime;
  late List<String> _tagNames;
  late List<int> _tagIds;

  TransactionType _category = TransactionType.Expense;

  TransactionType getCategory() => _category;

  DateTime? getDateTime() => _dateTime;

  void setDateTime(DateTime dateTime) {
    _dateTime = dateTime;
  }

  void init() async {
    _category = _navigator.currentArguments['category'] as TransactionType;
    setBusy(true);
    var tags = (await Tag.readTags(strEqualsToTagCategory(_category.toShortString())));
    var names = tags?.map((e) => e.name).toList();
    var ids = tags?.map((e) => e.id ?? 0).toList();
    _tagNames = names ?? [];
    _tagIds = ids ?? [];
    setBusy(false);
  }

  List<String> getTagNames(){
    return _tagNames;
  }

  void save(){
    Transaction newTransaction = Transaction(
      tagId: dropdownController.selectedIndex ?? 0,
      dateTime: _dateTime ?? DateTime.now(),
      amount: double.parse(amountController.text),
      tagName: dropdownController.getSelected() ?? 'Default',
      transactionType: _category
    );
    Transaction.create(newTransaction);
    _navigator.popRepeated(1);
  }
}