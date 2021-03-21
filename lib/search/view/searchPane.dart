import 'package:flutter/material.dart';
import 'package:machinetestembit/Components/searchBar.dart';
import 'package:machinetestembit/Components/searchItemTile.dart';
import 'package:machinetestembit/Core/Constants.dart';
import 'package:machinetestembit/Detail/view/detailWidget.dart';
import 'package:machinetestembit/search/Controller/searchController.dart';
import 'package:machinetestembit/search/model/wikiModel.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = Constant.kSearchPageRoute;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = TextEditingController();
  WikiModel wikiModel;
  SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SafeArea(
        top: true,
        right: false,
        left: false,
        bottom: false,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                color: Colors.red,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: searchBarView(
                  controller: _controller,
                  onChange: (text) {
                    _searchController.getSearchData(searchString: text);
                  },
                  onSubmitted: (text) {},
                ),
              ),
              Expanded(
                child: Container(
                  child: ValueListenableBuilder(
                    builder:
                        (BuildContext context, WikiModel value, Widget child) {
                      return value != null
                          ? ListView.builder(
                              itemCount: value.query == null
                                  ? 0
                                  : value.query.pages.length,
                              itemBuilder: (context, index) {
                                return SearchItemTile(
                                  pageModel: value.query.pages[index],
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        DetailWidget.routeName,
                                        arguments:
                                            value.query.pages[index].pageid);
                                  },
                                );
                              },
                            )
                          : Container();
                    },
                    valueListenable: _searchController.wikiModel,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
