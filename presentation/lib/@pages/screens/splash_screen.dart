import 'dart:async';

import 'package:flutter/material.dart';
import 'package:imdb_flutter/@global/colors.dart';
import 'package:imdb_flutter/@pages/main_page.dart';

class SplashScreen extends StatefulWidget {
    @override
    _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
    void initState() {
        super.initState();
        Timer(Duration(seconds: 3), () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
            ));
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
                children: <Widget>[
                Container(
                    decoration: BoxDecoration(color: colorMinionYellow),
                ),
                Center(
                    child:
                        new Text(
                            "IMDb",
                            style: new TextStyle(
                                color: colorGrayscale10,
                                fontWeight: FontWeight.bold,
                                fontSize: 190,
                                letterSpacing: 5.0,
                                fontFamily: 'Kenyc'
                            ),
                        ),
                )
                ],
            ),
        );
    }
}
