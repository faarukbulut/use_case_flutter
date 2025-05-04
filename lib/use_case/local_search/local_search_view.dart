// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:use_case_flutter/use_case/local_search/cancelable/cancelable.dart';
import 'package:use_case_flutter/use_case/local_search/constants/json_items.dart';
import 'package:use_case_flutter/use_case/local_search/mixin/asset_reader_mixin.dart';
import 'package:use_case_flutter/use_case/local_search/model/service_aggrement_mask.dart';
import 'package:use_case_flutter/use_case/local_search/model/services.dart';
import 'package:use_case_flutter/use_case/local_search/viewmodel/local_search_viewmodel.dart';

class LocalSearchView extends StatefulWidget {
  const LocalSearchView({super.key});

  @override
  State<LocalSearchView> createState() => _LocalSearchViewState();
}

class _LocalSearchViewState extends State<LocalSearchView> with AssetReaderMixin{
  Services? services;
  late final LocalSearchViewModel _localSearchViewModel;
  late final CancelableCustomOperation<String> cancelableCustomOperation;
  List<ServiceAgreementMask> rootList = [];

  @override
  void initState() {
    super.initState();
    _localSearchViewModel = LocalSearchViewModel();
    cancelableCustomOperation = CancelableCustomOperation((value){
      setState(() {
        searchByKey(value);
      });
    });
  }

  Future<void> load() async{
    final data = await readData(JsonItems.largeJsonPath);
    
    if(data == null) return;

    setState(() {
      services = Services.fromJson(data);
    });

    rootList = services?.payload?.serviceAgreementMask?.toList() ?? [];
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(services?.header?.verb ?? ""),
        actions: [
          LottieBuilder.asset(JsonItems.lottieColorLoading),
          PopupMenuButton(
            itemBuilder: (context){
              return [PopupMenuItem(
                onTap: search,
                child: Text('Show bigger zip'),
              )];
            }
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: cancelableCustomOperation.onItemChanged,
          ),

          Expanded(
            child: AgreementListView(
              items: services?.payload?.serviceAgreementMask ?? []
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: load,
        child: Icon(Icons.refresh)
      ),
    );
  }
}

class AgreementListView extends StatelessWidget {
  const AgreementListView({
    super.key,
    required this.items,
  });

  final List<ServiceAgreementMask> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i){
        return Card(
          child: ListTile(
            title: Text(items[i].city ?? ""),
            leading: Text("$i"),
            trailing: Text(items[i].zip ?? ""),
          )
        );
      },
    );
  }
}

extension _LocalSearchHigherr on _LocalSearchViewState{
  Future<void> search() async{
    final items = services?.payload?.serviceAgreementMask;
    if(items == null || items.isEmpty) return;
    
    final response = await _localSearchViewModel.fetchDataHigher(items);

    setState(() {
      services?.payload?.serviceAgreementMask = response;
    });
  }

  Future<void> searchByKey(String key) async{
    if(rootList.isEmpty) return;
    final response = await _localSearchViewModel.agreementFullSearch(rootList, key);

    setState(() {
      services?.payload?.serviceAgreementMask = response;
    });
  }


}