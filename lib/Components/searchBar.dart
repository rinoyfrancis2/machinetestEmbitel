import 'package:flutter/material.dart';

class searchBarView extends StatefulWidget {
  TextEditingController controller;
  final Function onChange;
  final Function onSubmitted;
  searchBarView({this.controller, this.onChange, this.onSubmitted});
  @override
  _searchBarViewState createState() => _searchBarViewState();
}

class _searchBarViewState extends State<searchBarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: TextField(
                controller: widget.controller,
                onChanged: (text) {
                  widget.onChange(text);
                },
                onSubmitted: (text) {
                  widget.onSubmitted(text);
                },
                decoration: InputDecoration(
                    hintText: "Search Here", border: InputBorder.none),
              ),
            ),
          ),
          Container(
            width: 50,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                widget.controller.clear();
              },
            ),
          )
        ],
      ),
    );
  }
}
