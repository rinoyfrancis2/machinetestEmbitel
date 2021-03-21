import 'package:machinetestembit/apiManager.dart';
import 'package:machinetestembit/search/model/wikiModel.dart';

class DetailController {
  Future<PageItem> getDetail(String pageID) async {
    PageItem data; 
    try {//should pass the data with
    await HttpManager().getDetailData(pageID).then((value) {
      data = PageItem.fromJson(value.query.detailPage.values.last);
    });
    } on Exception {}

    return data;
  }
}
