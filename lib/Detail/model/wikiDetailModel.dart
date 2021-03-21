import 'dart:convert';

import 'package:machinetestembit/search/model/wikiModel.dart';

WikiDetailModel wikiDetailModelFromJson(String str) =>
    WikiDetailModel.fromJson(json.decode(str));

String wikiDetailModelToJson(WikiDetailModel data) =>
    json.encode(data.toJson());

class WikiDetailModel {
  WikiDetailModel({
    this.batchcomplete,
    this.query,
  });

  final String batchcomplete;
  final DetailQuery query;

  factory WikiDetailModel.fromJson(Map<String, dynamic> json) =>
      WikiDetailModel(
        batchcomplete:
            json["batchcomplete"] == null ? null : json["batchcomplete"],
        query:
            json["query"] == null ? null : DetailQuery.fromJson(json["query"]),
      );

  Map<String, dynamic> toJson() => {
        "batchcomplete": batchcomplete == null ? null : batchcomplete,
        "query": query == null ? null : null,
      };
}

class DetailQuery {
  DetailQuery({
    this.detailPage,
  });

  final Map<String, dynamic> detailPage;

  factory DetailQuery.fromJson(Map<String, dynamic> json) => DetailQuery(
        detailPage: json["pages"] == null ? null : json["pages"],
      );
}
