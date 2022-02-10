import 'package:Churpu/enums/tag_categories.dart';
import 'package:Churpu/ui/tags/tag_category/tag_category_view.dart';
import 'package:Churpu/ui/tags/tags_view_model.dart';
import 'package:Churpu/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TagsView extends StatelessWidget{
  final Widget drawerButton;
  static const String _title = 'Tags';

  const TagsView({Key? key, required this.drawerButton}): super(key: key);

  static const List<Widget> _tabs = [
    Text('Expense', style: TextStyle(fontSize: 18)),
    Text('Income', style: TextStyle(fontSize: 18))
  ];

  static const List<Widget> _tabViews = [
    TagCategoryView(category: TagCategories.Expense),
    TagCategoryView(category: TagCategories.Income)
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TagsViewModel>.reactive(
      onModelReady: (model){},
      viewModelBuilder: () => TagsViewModel(),
      builder: (context, model, child){
        return DefaultTabController(
            length: _tabs.length,
            child: Builder(builder: (BuildContext context) {
              return CustomScaffold(
                title: _title,
                appBarLeading: drawerButton,
                appBarBottom: const TabBar(tabs: _tabs),
                body: TabBarView(
                  children: _tabViews
                ),
              );
            })
        );
      }
    );
  }
}