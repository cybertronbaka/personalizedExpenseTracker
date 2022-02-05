enum TagCategories { Income, Expense }

extension ParseToString on TagCategories {
  String toShortString() {
    return this.toString().split('.').last;
  }

  String buttonValue(){
    return 'Add ${this.toShortString()} Tag';
  }
}

TagCategories strEqualsToTagCategory(String str){
  switch(str){
    case 'Income':
      return TagCategories.Income;
    case 'Expense':
      return TagCategories.Expense;
  }

  return TagCategories.Expense;
}