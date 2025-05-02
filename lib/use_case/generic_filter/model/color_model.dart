import 'package:use_case_flutter/use_case/generic_filter/enum/color_enum.dart';
import 'package:use_case_flutter/use_case/generic_filter/filter_view.dart';

class ColorModel extends IFilter{
  final ColorEnum color;
  ColorModel(this.color);
  
  @override
  int get id => color.index;
  
  @override
  String get key => color.name;
}