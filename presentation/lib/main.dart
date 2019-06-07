import 'dart:async';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

import 'package:imdb_flutter/@redux/index.dart';
import 'package:imdb_flutter/@global/colors.dart';
import 'package:imdb_flutter/@pages/screens/splash_screen.dart';

Future<void> main() async {
    final store = createStore();

    runApp(IMDbApp(store));
}

class IMDbApp extends StatefulWidget {
    IMDbApp(this.store);
    final Store<AppState> store;

    @override
    _IMDbAppState createState() => _IMDbAppState();
}

class _IMDbAppState extends State<IMDbApp> {
    @override
    void initState() {
        super.initState();
        widget.store.dispatch(InitAction());
    }

    @override
    Widget build(BuildContext context) {
        return StoreProvider<AppState>(
            store: widget.store,
            child: MaterialApp(
                title: 'IMDb Popular Movies with Flutter',
                debugShowCheckedModeBanner: true,
                theme: ThemeData(primaryColor: colorMinionYellow, accentColor: colorWhite),
                home: SplashScreen()
            )
        );
    }
}
