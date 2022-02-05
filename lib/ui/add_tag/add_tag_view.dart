import 'package:Churpu/enums/tag_categories.dart';
import 'package:Churpu/ui/add_tag/add_tag_view_model.dart';
import 'package:Churpu/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddTagView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTagViewModel>.reactive(
      onModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () => AddTagViewModel(),
      builder: (context, model, child) => CustomScaffold(
          title: 'Add ${model.getCategory().toShortString()} Tag',
          body: Container(
              child: Text(model.getTitle())
          )
      )
    );
  }
}