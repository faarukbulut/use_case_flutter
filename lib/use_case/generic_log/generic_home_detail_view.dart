import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/generic_log/core/logger_mixin.dart';

class GenericHomeDetailView extends StatefulWidget {
  final int id;
  
  const GenericHomeDetailView({super.key, required this.id});

  @override
  State<GenericHomeDetailView> createState() => _GenericHomeDetailViewState();
}

class _GenericHomeDetailViewState extends State<GenericHomeDetailView> with LoggerMixin {

  @override
  void init() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('${widget.id}'),
    );
  }
  
  @override
  final PageSpecialKeys key = PageSpecialKeys.detail;
  
  @override
  CustomModel get model => CustomModel(id: widget.id, description: 'Detail View');

}