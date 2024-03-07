import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<XFile?> pickFromCamera() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future<XFile?> pickFromgGallery() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }
}
