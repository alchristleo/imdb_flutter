import 'package:shared/index.dart';
import 'package:flutter/material.dart';
import 'package:imdb_flutter/widgets/loading.dart';

var routes = <String, WidgetBuilder>{
    // LIST ALL ROUTES
};

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: colorMinionYellow, accentColor: colorWhite),
    debugShowCheckedModeBanner: false,
    home: LoadingScreen(),
    routes: routes));
