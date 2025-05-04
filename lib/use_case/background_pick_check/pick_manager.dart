import 'package:app_settings/app_settings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:use_case_flutter/use_case/background_pick_check/permission_check.dart';
import 'package:use_case_flutter/use_case/background_pick_check/pick_image_custom.dart';

abstract class IPickManager{
  final IPermissionCheck permissionCheck = PermissionCheck();
  final IPickImage pickImageCustom = PickImageCustom();
  
  Future<PickImageModel?> fetchMediaImage();
}

class PickManager extends IPickManager{
  @override
  Future<PickImageModel?> fetchMediaImage() async{
    if(!await permissionCheck.checkMediaLibrary()){
      await AppSettings.openAppSettings();
      return PickImageModel(null);
    }

    final file = await pickImageCustom.pickImageGallery();
    return PickImageModel(file, status: true);
  }

}

class PickImageModel{
  final XFile? file;

  /// permission status
  final bool status;

  PickImageModel(this.file, {this.status = false});
}