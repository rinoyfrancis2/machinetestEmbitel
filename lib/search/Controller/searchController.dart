import 'package:flutter/material.dart';
import 'package:machinetestembit/apiManager.dart';
import 'package:machinetestembit/search/model/wikiModel.dart';

class SearchController {
  //this controller only give the relavante info

  ValueNotifier<WikiModel> wikiModel = ValueNotifier<WikiModel>(null);
  void getSearchData({String searchString}) async {
    try {
      await HttpManager().getSearchData(searchString).then((value) {
        wikiModel.value = value;
      });
    } on Exception {}
  }
}
