import 'dart:developer';
import 'package:use_case_flutter/use_case/generic_log/core/logger_mixin.dart';

class ProjectCustomLog{
  static ProjectCustomLog? _instance;
  static ProjectCustomLog get instance{
    _instance ??= ProjectCustomLog._init();
    return _instance!;
  }

  ProjectCustomLog._init();

  void logClassName<T>(T page){
    log(page.toString());
  }

  void logPageName(PageSpecialKeys keys){
    log(keys.name.toString());
  }

  void logCustomModel(CustomModel model){
    log(model.toJson());
  }

}