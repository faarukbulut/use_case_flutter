import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/generic_filter/enum/country_enum.dart';
import 'package:use_case_flutter/use_case/generic_filter/filter_view.dart';
import 'package:use_case_flutter/use_case/generic_filter/model/country_model.dart';

class FilterHomeView extends StatefulWidget {
  const FilterHomeView({super.key});

  @override
  State<FilterHomeView> createState() => _FilterHomeViewState();
}

class _FilterHomeViewState extends State<FilterHomeView> {
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final result = await FilterView<CountryModel>(values: CountryEnum.models).showSheet(context: context, items: CountryEnum.models);

          if(result == null) return;

          setState(() {
            _name = result.key;
          });
        },
      ),
    );
  }
}
