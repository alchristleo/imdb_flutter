import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdb_flutter/@global/colors.dart';

class MainBottomBar extends StatelessWidget {
    MainBottomBar({
        @required this.currentIndex,
        @required this.onTap,
        @required this.items,
    });

    final int currentIndex;
    final ValueChanged<int> onTap;
    final List<BottomNavigationBarItem> items;

    @override
    Widget build(BuildContext context) {
        return CupertinoTabBar(
            backgroundColor: colorGrayscale10,
            inactiveColor: Colors.white54,
            activeColor: Colors.white,
            iconSize: 24.0,
            currentIndex: currentIndex,
            onTap: onTap,
            items: items,
        );
    }
}
