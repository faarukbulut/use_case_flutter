import 'package:use_case_flutter/use_case/generic_filter/model/country_model.dart';

enum CountryEnum{
  istanbu('İstanbul'),
  london('London'),
  boston('Boston');

  final String uniqueName;
  const CountryEnum(this.uniqueName);

  static List<CountryModel> get models{
    return CountryEnum.values.map((e) => CountryModel(e)).toList();
  }
}
