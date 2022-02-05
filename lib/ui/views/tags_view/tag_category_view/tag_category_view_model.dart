import 'dart:io';

import 'package:Churpu/db/models/tags.dart';
import 'package:Churpu/enums/tag_categories.dart';
import 'package:stacked/stacked.dart';

class TagCategoryViewModel extends BaseViewModel{
  TagCategories _category = TagCategories.Expense;
  bool loading = true;
  bool dataExists = false;
  List<Tag> tags = [];

  List<Tag> getTags() => tags;

  TagCategories getCategory() => _category;

  void setCategory(TagCategories category){
    _category = category;
  }

  void refreshTags() async {
    tags = await Tag.readTags(_category) ?? [];
    if(tags.isEmpty) {
      Tag tag = Tag(name: 'Food', tagType: _category);
      Tag.create(tag);
      Tag tag1 = Tag(name: 'Car', tagType: _category);
      Tag.create(tag1);
      Tag tag2 = Tag(name: 'Rent', tagType: _category);
      Tag.create(tag2);
    }
    tags = await Tag.readTags(_category) ?? [];
    loading = false;
    dataExists = tags.isNotEmpty;
    notifyListeners();
  }

  bool getLoading(){
    return loading;
  }

  void setLoading(bool value) {
    loading = value;
  }
}