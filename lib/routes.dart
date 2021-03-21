import 'package:flutter/material.dart';
import 'package:machinetestembit/Detail/view/detailWidget.dart';
import 'package:machinetestembit/search/view/searchPane.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  DetailWidget.routeName: (ctx) => DetailWidget(),
  SearchScreen.routeName: (ctx) => SearchScreen()
};
