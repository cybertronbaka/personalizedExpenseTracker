
import 'dart:io';

import 'package:Churpu/enums/tag_categories.dart';
import 'package:Churpu/ui/add_tag/add_tag_view_model.dart';
import 'package:Churpu/widgets/custom_button_bar.dart';
import 'package:Churpu/widgets/custom_scaffold.dart';
import 'package:Churpu/widgets/custom_text_field.dart';
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
            padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: model.tagNameController,
                    hintText: 'Tag Name'
                  ),
                  SizedBox(height: 30),
                  CustomButtonBar(
                    text: 'Add Image',
                    onTap: (){
                      model.openGallery();
                    },
                    border: true,
                    primary: Colors.black54,
                    bgColor: Colors.transparent,
                  ),
                  SizedBox(height: 30),
                  model.image != null ? Image.file(
                    model.image as File,
                    width: 200,
                    height: 200,
                  ) : Text('No image'),
                  Spacer(),
                  CustomButtonBar(
                    text: 'Save Tag',
                    primary: Colors.white,
                    onTap: (){
                      model.saveTag();
                    },
                  )
                ]
              )
          )
      )
    );
  }
}