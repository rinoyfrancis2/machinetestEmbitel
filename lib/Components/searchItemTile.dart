import 'package:flutter/material.dart';
import 'package:machinetestembit/search/model/wikiModel.dart';

class SearchItemTile extends StatefulWidget {
  final PageItem pageModel;
  final Function onTap;

  SearchItemTile({this.onTap, this.pageModel});
  @override
  _SearchItemTileState createState() => _SearchItemTileState();
}

class _SearchItemTileState extends State<SearchItemTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[50],
      margin: EdgeInsets.all(5),
      child: ListTile(
        title: Text(widget.pageModel.title),
        subtitle: Text(widget.pageModel.terms != null
            ? widget.pageModel.terms.description[0]
            : ""),
        onTap: () {
          widget.onTap();
        },
        trailing: Icon(Icons.keyboard_arrow_right),
        leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 50,
              minHeight: 50,
              maxWidth: 60,
              maxHeight: 60,
            ),
            child: widget.pageModel.thumbnail != null
                ? Image.network(widget.pageModel.thumbnail.source)
                : Container(
                    color: Colors.grey,
                  )),
      ),
    );
  }
}
