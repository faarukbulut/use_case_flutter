import 'package:flutter/foundation.dart';
import 'package:use_case_flutter/use_case/local_search/model/service_aggrement_mask.dart';

class LocalSearchViewModel {
  Future<List<ServiceAgreementMask>> fetchDataHigher(List<ServiceAgreementMask> items) async{
    final response = compute(
      _LocalSearch.fetchZipCodeHigher, 
      SearchZipModel(items, 90000)
    );

    return response;
  }

  Future<List<ServiceAgreementMask>> agreementFullSearch(List<ServiceAgreementMask> items, String key) async{
    final response = compute(_LocalSearch.searchKey, SearchZipSearchModel(items, key));

    return response;
  }

}

class _LocalSearch{
  static List<ServiceAgreementMask> fetchZipCodeHigher(SearchZipModel model){
    final response = model.items
      .where((e) => e.agreement == ServiceAgreements.passive)
      .where((e) => e.zipCode > 0)
      .where((e) => e.zipCode > model.maxValue)
      .map((e){
        e.zip = '10';
        return e;
      })
      .toList();

    return response;
  }

  static List<ServiceAgreementMask> searchKey(SearchZipSearchModel model){
    return model.items.where((e) => e.toString().contains(model.key)).toList();
  }
}

class SearchZipModel{
  final List<ServiceAgreementMask> items;
  final int maxValue;

  SearchZipModel(this.items, this.maxValue);
}

class SearchZipSearchModel{
  final List<ServiceAgreementMask> items;
  final String key;

  SearchZipSearchModel(this.items, this.key);
}