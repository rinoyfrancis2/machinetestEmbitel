// To parse this JSON data, do
//
//     final wikiModel = wikiModelFromJson(jsonString);

import 'dart:convert';

WikiModel wikiModelFromJson(String str) => WikiModel.fromJson(json.decode(str));

String wikiModelToJson(WikiModel data) => json.encode(data.toJson());

class WikiModel {
  WikiModel({
    this.batchcomplete,
    this.wikiModelContinue,
    this.query,
  });

  final bool batchcomplete;
  final Continue wikiModelContinue;
  final Query query;

  factory WikiModel.fromJson(Map<String, dynamic> json) => WikiModel(
        batchcomplete:
            json["batchcomplete"] == null ? null : json["batchcomplete"],
        wikiModelContinue: json["continue"] == null
            ? null
            : Continue.fromJson(json["continue"]),
        query: json["query"] == null ? null : Query.fromJson(json["query"]),
      );

  Map<String, dynamic> toJson() => {
        "batchcomplete": batchcomplete == null ? null : batchcomplete,
        "continue":
            wikiModelContinue == null ? null : wikiModelContinue.toJson(),
        "query": query == null ? null : query.toJson(),
      };
}

class Query {
  Query({
    this.pages,
  });

  final List<PageItem> pages;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        pages: json["pages"] == null
            ? null
            : List<PageItem>.from(
                json["pages"].map((x) => PageItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pages": pages == null
            ? null
            : List<dynamic>.from(pages.map((x) => x.toJson())),
      };
}

class PageItem {
  PageItem({
    this.pageid,
    this.ns,
    this.title,
    this.index,
    this.extract,
    this.thumbnail,
    this.terms,
  });

  final int pageid;
  final int ns;
  final String title;
  final int index;
  final String extract;
  final Thumbnail thumbnail;
  final Terms terms;

  factory PageItem.fromJson(Map<String, dynamic> json) => PageItem(
        pageid: json["pageid"] == null ? null : json["pageid"],
        ns: json["ns"] == null ? null : json["ns"],
        title: json["title"] == null ? null : json["title"],
        index: json["index"] == null ? null : json["index"],
        extract: json["extract"] == null ? null : json["extract"],
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromJson(json["thumbnail"]),
        terms: json["terms"] == null ? null : Terms.fromJson(json["terms"]),
      );

  Map<String, dynamic> toJson() => {
        "pageid": pageid == null ? null : pageid,
        "ns": ns == null ? null : ns,
        "title": title == null ? null : title,
        "index": index == null ? null : index,
        "extract": extract == null ? null : extract,
        "thumbnail": thumbnail == null ? null : thumbnail.toJson(),
        "terms": terms == null ? null : terms.toJson(),
      };
}

class Terms {
  Terms({
    this.description,
  });

  final List<String> description;

  factory Terms.fromJson(Map<String, dynamic> json) => Terms(
        description: json["description"] == null
            ? null
            : List<String>.from(json["description"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "description": description == null
            ? null
            : List<dynamic>.from(description.map((x) => x)),
      };
}

class Thumbnail {
  Thumbnail({
    this.source,
    this.width,
    this.height,
  });

  final String source;
  final int width;
  final int height;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        source: json["source"] == null ? null : json["source"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
      );

  Map<String, dynamic> toJson() => {
        "source": source == null ? null : source,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
      };
}

class Continue {
  Continue({
    this.gpsoffset,
    this.continueContinue,
  });

  final int gpsoffset;
  final String continueContinue;

  factory Continue.fromJson(Map<String, dynamic> json) => Continue(
        gpsoffset: json["gpsoffset"] == null ? null : json["gpsoffset"],
        continueContinue: json["continue"] == null ? null : json["continue"],
      );

  Map<String, dynamic> toJson() => {
        "gpsoffset": gpsoffset == null ? null : gpsoffset,
        "continue": continueContinue == null ? null : continueContinue,
      };
}
