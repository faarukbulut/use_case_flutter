import 'package:use_case_flutter/use_case/social_login/model/social_button_model.dart';

abstract class ISocialAdapter{
  Future<String> make();
  SocialAdapterModel get model;
}

class FacebookAdapter implements ISocialAdapter{
  @override
  Future<String> make() async{
    return toString();
  }
  
  @override
  final SocialAdapterModel model = SocialAdapterModel.facebook();
}

class AppleAdapter implements ISocialAdapter{
  @override
  Future<String> make() async{
    return toString();
  }
  
  @override
  final SocialAdapterModel model = SocialAdapterModel.apple();
}

class GoogleAdapter implements ISocialAdapter{
  @override
  Future<String> make() async{
    return toString();
  }
  
  @override
  final SocialAdapterModel model = SocialAdapterModel.google();
}



