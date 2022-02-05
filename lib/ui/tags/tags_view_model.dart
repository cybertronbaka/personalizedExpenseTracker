import 'package:Churpu/enums/tag_categories.dart';
import 'package:Churpu/ui/tags/tag_category/tag_category_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class TagsViewModel extends BaseViewModel{
  Widget currentTabView = Container(height: 0, width: 0);

  Widget getCurrentTabView(int index){
    return TagCategoryView(category: index == 0 ? TagCategories.Expense : TagCategories.Income);
  }
}