import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/generic_log/core/logger_mixin.dart';
import 'package:use_case_flutter/use_case/generic_log/generic_home_detail_view.dart';

class GenericHomeView extends StatefulWidget {
  const GenericHomeView({super.key});

  @override
  State<GenericHomeView> createState() => _GenericHomeViewState();
}

class _GenericHomeViewState extends State<GenericHomeView> with LoggerMixin{

  @override
  void init() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, i){
          return ListTile(
            leading: Text('$i'),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => GenericHomeDetailView(id: i))
              );
            },
          );
        },
      ),
    );
  }
  
  @override
  final PageSpecialKeys key = PageSpecialKeys.home;
  
  @override
  CustomModel get model => CustomModel(description: 'Home View');

}