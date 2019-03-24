import 'package:flutter/material.dart';
import 'package:imdb_flutter/@global/colors.dart';

class MainAppBar extends StatefulWidget {
    @override
    _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> with SingleTickerProviderStateMixin {
    @override
    void initState() {
        super.initState();
    }

    @override
    void dispose() {
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            leading: null,
            actions: <Widget>[
                new Text("  IMDb  ",
                    style: TextStyle(
                        color: colorGrayscale10,
                        fontWeight: FontWeight.bold,
                        fontSize: 34.0
                    ),
                ),
                new Flexible(
                    child: TextField(
                    // controller: _searchQuery,
                        autofocus: false,
                        decoration: InputDecoration(
                            suffixIcon: new Icon(Icons.search, color: colorGrayscale10),
                            hintText: "Search movies...",
                            border: OutlineInputBorder(
                                gapPadding: 0.0,
                                borderSide: new BorderSide(color: colorGrayscale10),
                                borderRadius: BorderRadius.all(Radius.circular(2.0))
                            ),
                            hintStyle: TextStyle(color: colorGrayscale10),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                            contentPadding: EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
                        ),
                        style: TextStyle(color: colorGrayscale10, fontSize: 16.0,),
                        // onChanged: _updateSearchQuery,
                    ),
                ),
                new IconButton(
                    padding: new EdgeInsets.only(bottom: 10.0, right: 10.0, left: 20.0),
                    icon: new Icon(Icons.notifications),
                    onPressed: () => {},
                    iconSize: 32.0,
                ),
                new IconButton(
                    padding: new EdgeInsets.only(bottom: 10.0, right: 20.0, left: 5.0),
                    icon: new Icon(Icons.person),
                    onPressed: () => {},
                    iconSize: 32.0,
                ),
            ],
            backgroundColor: colorMinionYellow,
        );
    }
}
