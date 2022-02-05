enum TransactionType { Income, Expense }

extension ParseToString on TransactionType {
  String toShortString() {
    return this.toString().split('.').last;
  }

  String buttonValue(){
    return 'Add ${this.toShortString()}';
  }

  String viewTitle(){
    return '${this.toShortString()}s';
  }
}

TransactionType strEqualsToTransactionType(String str){
  switch(str){
    case 'Income':
      return TransactionType.Income;
    case 'Expense':
      return TransactionType.Expense;
    }

    return TransactionType.Expense;
}