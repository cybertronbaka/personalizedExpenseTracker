import 'package:Churpu/db/models/tags.dart';
import 'package:Churpu/enums/tag_categories.dart';
import 'package:Churpu/ui/tags/tag_category/tag_category_view_model.dart';
import 'package:Churpu/widgets/custom_button_bar.dart';
import 'package:Churpu/widgets/custom_loading_indicator.dart';
import 'package:Churpu/widgets/tag_card.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked/stacked.dart';


class TagCategoryView extends StatelessWidget {
  final TagCategories category;

  const TagCategoryView({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TagCategoryViewModel>.reactive(
        onModelReady: (model) {
          model.setCategory(category);
          model.refreshTags();
        },
        onDispose: (model) {
          model.resetCategory();
        },
        viewModelBuilder: () => TagCategoryViewModel(),
        builder: (context, model, child) => Column(
          children: [
            buildSpacer(model),
            model.getLoading() ? CustomLoadingIndicator() : buildList(context, model),
            buildSpacer(model),
            CustomButtonBar(text: category.buttonValue(), onTap: () => model.addTagClicked(category))
          ],
        )
    );
  }

  Widget buildSpacer(TagCategoryViewModel model){
    return model.getLoading() || !model.dataExists ? Spacer() : Container(height: 0, width: 0);
  }

  Widget buildList(BuildContext context, TagCategoryViewModel model){
    List<Tag> tags = model.getTags() ;
    return tags.isNotEmpty ? Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          children: model.getTags().map((tag) {
            return TagCard(id: tag.id as int, tagName: tag.name, image: 'assets/food.jpg');
          }).toList(),
        )
    ) : Text('No Data');
  }
}
