import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/generic_filter/model/color_model.dart';

enum ColorEnum{
  red(Colors.red),
  green(Colors.green),
  yellow(Colors.yellow);

  final Color uniqueColor;
  const ColorEnum(this.uniqueColor);

  static List<ColorModel> get models{
    return ColorEnum.values.map((e) => ColorModel(e)).toList();
  }

}