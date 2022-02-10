import 'package:Churpu/enums/transaction_types.dart';
import 'package:Churpu/ui/transactions/transaction_view.dart';
import 'package:flutter/material.dart';

class IncomesView extends TransactionView {
  final IconButton drawerButton;

  IncomesView({required this.drawerButton}) : super(transactionType: TransactionType.Income, drawerButton: drawerButton);
}

class ExpensesView extends TransactionView {
  final IconButton drawerButton;

  ExpensesView({required this.drawerButton}) : super(transactionType: TransactionType.Expense, drawerButton: drawerButton);
}