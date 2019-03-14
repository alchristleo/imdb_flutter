import 'package:shared/index.dart';
import 'dart:async';

import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
    @override
    _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
    @override
    void initState() {
        super.initState();
        Timer(Duration(seconds: 3), () => MyNavigator.homeRoute(context));
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                Container(
                    decoration: BoxDecoration(color: colorMinionYellow),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                    new Text(
                                            "IMDb",
                                            style: new TextStyle(
                                            color: colorBlack,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 102
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ),
                    ],
                )
                ],
            ),
        );
    }
}
