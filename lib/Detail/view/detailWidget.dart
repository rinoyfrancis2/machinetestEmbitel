import 'package:flutter/material.dart';
import 'package:machinetestembit/Core/Constants.dart';
import 'package:machinetestembit/Detail/controller/detailController.dart';
import 'package:machinetestembit/search/model/wikiModel.dart';

class DetailWidget extends StatelessWidget {
  static const routeName = Constant.kDetailPageRoute;
  final DetailController _detailController = DetailController();
  @override
  Widget build(BuildContext context) {
   int args = ModalRoute.of(context).settings.arguments;
//get arguments from her

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Detail"),
      ),
      body: FutureBuilder<PageItem>(
          future: _detailController.getDetail("$args"),
          builder: (BuildContext context, AsyncSnapshot<PageItem> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text('Loading....');
              case ConnectionState.done:
                return _bodyWidget(context, snapshot.data);
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return Text('Result: ${snapshot.data}');
            }
          }),
    );
  }
}

Widget _bodyWidget(BuildContext context, PageItem pageItem) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Center(
      child: ListView(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: pageItem.thumbnail != null ? Image.network(
              pageItem.thumbnail.source,
              fit: BoxFit.contain,
            ) : Container(
             color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            pageItem.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(pageItem.extract)
        ],
      ),
    ),
  );
}
