import 'package:Churpu/ui/views/tags_view/tags_view_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TagsViewModel>.reactive(
      onModelReady: (model){},
      viewModelBuilder: () => TagsViewModel(),
      builder: (context, model, child) => DefaultTabController(
          length: _tabs.length,
          child: Builder(builder: (BuildContext context) {
            final TabController tabController = DefaultTabController.of(context)!;
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                model.notifyListeners();
              }
            });
            return CustomScaffold(
              title: _title,
              appBarLeading: drawerButton,
              appBarBottom: const TabBar(tabs: _tabs),
              body: model.getCurrentTabView(tabController.index),
            );
          })
      ),
    );
  }
}