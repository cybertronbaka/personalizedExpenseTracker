import 'dart:io';
import 'dart:math';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class GalleryService {
  Future<XFile?> pickImageFromGallery() async{
    final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath';

    return filePath;
  }

  String getRandomFileName() {
    var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(
        25,
          (_) => _chars.codeUnitAt(
              _rnd.nextInt(_chars.length)
          )
      )
    );
  }

  Future<String> saveFile(File oldFile) async {
    String extension = oldFile.path.split('.').last;
    String newPath = '${await getFilePath()}/${getRandomFileName()}.$extension}';
    File file = File(newPath);
    var fileContent = await oldFile.readAsBytes();
    file.writeAsBytes(fileContent); // 2
    return file.path;
  }
}