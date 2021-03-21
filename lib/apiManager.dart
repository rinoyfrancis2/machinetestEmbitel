import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:machinetestembit/search/model/wikiModel.dart';

import 'Detail/model/wikiDetailModel.dart';

class HttpManager {
  Future<WikiModel> getSearchData(String searchString) async {
    try {
      final response = await http.get(
          'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=${searchString}&gpslimit=10');
      if (response.statusCode == 200) {
        var s = jsonDecode(response.body);
        if (s["error"] != null) {
          throw Exception("missingparam");
        } else {
          return wikiModelFromJson(response.body);
        }
      } else {
        throw Exception('Failed to load ');
      }
    } on SocketException catch (_) {
      throw ("Please check your internet connection");
    } catch (error) {
      throw error;
    }
  }

  Future<WikiDetailModel> getDetailData(String pageID) async {
    try {
      final response = await http.get(
          'https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts%7Cpageimages&exintro&explaintext&redirects=1&pageids=${pageID}');
      if (response.statusCode == 200) {
        var s = jsonDecode(response.body);
        if (s["error"] != null) {
          throw Exception("missingparam");
        } else {
          // after we receive a response here we have to add that into model
          return wikiDetailModelFromJson(response.body);
        }
      } else {
        throw Exception('Failed to load');
      }
    } on SocketException catch (_) {
      throw ("Please check your internet connection");
    } catch (error) {
      throw error;
    }
  }
}
