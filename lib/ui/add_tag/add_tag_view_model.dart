import 'dart:io';

import 'package:Churpu/app/app.locator.dart';
import 'package:Churpu/db/models/tags.dart';
import 'package:Churpu/enums/tag_categories.dart';
import 'package:Churpu/utils/gallery_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddTagViewModel extends BaseViewModel{
  final tagNameController = TextEditingController();
  final _navigator = locator<NavigationService>();
  final _galleryService = locator<GalleryService>();
  String? imagePath;
  XFile? _image;
  File? image;
  late TagCategories _category;

  void init(){
    _category = strEqualsToTagCategory(_navigator.currentArguments['category'] as String);
  }

  TagCategories getCategory() => _category;

  String getTitle(){
    return _category.toShortString();
  }

  void openGallery() async{
    _image = await _galleryService.pickImageFromGallery() as XFile;
    if(_image == null) return null;

    image = File(_image?.path ?? '');
    notifyListeners();
  }

  saveTag() async {
    print('TagName: ${tagNameController.text}');
    imagePath = await _galleryService.saveFile(image as File);
    Tag newTag = Tag(
        name: tagNameController.text == null ? 'Default' : tagNameController.text,
        tagType: _category,
        defaultImage: image == null,
        imagePath: (imagePath == null ? '' : imagePath) as String
    );
    Tag.create(newTag);
    _navigator.popRepeated(1);
  }
}