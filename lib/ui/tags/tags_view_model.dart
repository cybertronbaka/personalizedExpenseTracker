import 'package:Churpu/enums/tag_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class TagsViewModel extends BaseViewModel{
  TagCategories currentCategory = TagCategories.Expense;
  Widget currentTabView = Container(height: 0, width: 0);

  void setCurrentCategory(int i){
    currentCategory = i == 0 ? TagCategories.Expense : TagCategories.Income;
  }

  TagCategories getCurrentCategory() {
    return currentCategory;
  }
}