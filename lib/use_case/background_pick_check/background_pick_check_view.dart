import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:use_case_flutter/use_case/background_pick_check/life_cycle_manage_mixin.dart';
import 'package:use_case_flutter/use_case/background_pick_check/permission_check.dart';
import 'package:use_case_flutter/use_case/background_pick_check/pick_image_custom.dart';
import 'package:use_case_flutter/use_case/background_pick_check/pick_manager.dart';

class BackgroundPickCheckView extends StatefulWidget {
  const BackgroundPickCheckView({super.key});

  @override
  State<BackgroundPickCheckView> createState() => _BackgroundPickCheckViewState();
}

class _BackgroundPickCheckViewState extends State<BackgroundPickCheckView> with WidgetsBindingObserver, LifeCycleManageMixin{
  final IPickManager pickImage = PickManager();
  XFile? image;
  bool? _latestResultPermission;

  @override
  void onResume(){

  }

  @override
  void initState() {
    super.initState();
    _checkPhotoAccess();

  }

  Future<void> _checkPhotoAccess() async {
    _latestResultPermission = await PermissionCheck().checkMediaLibrary();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picker Validation Check'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _latestResultPermission ?? false, 
            onChanged: (value){}
          ),

          ElevatedButton.icon(
            onPressed: () async{
              final model = await pickImage.fetchMediaImage();
              setState(() {
                image = model?.file;
              });
            },
            icon: Icon(Icons.library_add),
            label: Text('Pick your photo'),
          ),

          _FutureByteImage(image: image),

        ],
      ),
    );
  }
}

class _FutureByteImage extends StatelessWidget {
  const _FutureByteImage({
    required this.image,
  });

  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: image?.readAsBytes(), 
      builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot){
        if(snapshot.data != null){
          return Image.memory(snapshot.data!);
        }
    
        return SizedBox();
      }
    );
  }
}

