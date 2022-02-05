import 'package:Churpu/app/app.locator.dart';
import 'package:Churpu/enums/tag_categories.dart';
import 'package:Churpu/ui/tags/tag_category/tag_category_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddTagViewModel extends BaseViewModel{
  final _navigator = locator<NavigationService>();
  late TagCategories _category;

  void init(){
    print("args = ${_navigator.currentArguments['category']}");
    print("currentRoute: ${_navigator.currentRoute}");
    _category = strEqualsToTagCategory(_navigator.currentArguments['category'] as String);
  }

  TagCategories getCategory() => _category;

  String getTitle(){
    return _category.toShortString();
  }
}