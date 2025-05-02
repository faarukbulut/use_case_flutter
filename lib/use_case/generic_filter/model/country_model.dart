import 'package:use_case_flutter/use_case/generic_filter/enum/country_enum.dart';
import 'package:use_case_flutter/use_case/generic_filter/filter_view.dart';

class CountryModel extends IFilter{
  final CountryEnum country;
  CountryModel(this.country);
  
  @override
  int get id => country.index;
  
  @override
  String get key => country.uniqueName;
}