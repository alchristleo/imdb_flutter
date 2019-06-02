import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:imdb_flutter/@global/colors.dart';
import 'package:imdb_flutter/@pages/screens/movies/list.dart';
import 'package:imdb_flutter/@pages/widgets/placeholder/placeholder.dart';
import 'package:imdb_flutter/@pages/widgets/headers/header.dart';
// import 'package:imdb_flutter/@pages/widgets/tabs/tabs.dart';

// include additional bottom padding to avoid placing BottomNavigationBarItems under the indicator for accessing the Home screen
class IPhoneXPadding extends Container {
    final Widget child;

    IPhoneXPadding({
        @required this.child,
    });

    @override
    Widget build(BuildContext context) {
        var mediaQueryData = MediaQuery.of(context);
        if (!_isIPhoneX(mediaQueryData)) {
        // fallback for all non iPhone X
            return child;
        }

        var homeIndicatorHeight = mediaQueryData.orientation == Orientation.portrait ? 22.0 : 20.0;

        var outer = mediaQueryData.padding;
        var bottom = outer.bottom + homeIndicatorHeight;
        return new MediaQuery(data: new MediaQueryData(
            padding: new EdgeInsets.fromLTRB(
                outer.left, outer.top, outer.right, bottom)),
            child: child
        );
    }

    bool _isIPhoneX(MediaQueryData mediaQuery) {
        if (Platform.isIOS) {
            var size = mediaQuery.size;
            if (size.height == 812.0 || size.width == 812.0) {
                return true;
            }
        }
        return false;
    }
}

class MainPage extends StatefulWidget {
    const MainPage();

    @override
    _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
    int _selectedTab = 0;
    double barHeightSize = 80;
    double circleSize = 62;

    List<TabItem> tabItems = List.of([
        new TabItem(Icons.movie, "Trending", colorMinionYellow),
        new TabItem(Icons.trending_up, "Top Rating", colorMinionYellow),
        new TabItem(Icons.update, "Incoming", colorMinionYellow),
    ]);

    List tabContentItems = List.of([
        const MovieListPage(),
        const MoviePlaceholder(),
        const MoviePlaceholder(),
    ]);

    CircularBottomNavigationController _navigationController;

    @override
    void initState() {
        super.initState();
        _navigationController = new CircularBottomNavigationController(_selectedTab);
    }

    @override
    void dispose() {
        super.dispose();
        _navigationController.dispose();
    }

    // change navigation controller value
    void onTabSelected() {
        if (_navigationController.value == tabItems.length - 1) {
            _navigationController.value = 0;
        } else {
            _navigationController.value++;
        }
    }

    // set selected tab position
    dynamic setSelectedTabPos(int selectedPos) {
        setState(() {
            this._selectedTab = selectedPos;
        });
    }

    Widget _buildTabContent() {
        return Positioned.fill(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                child: tabContentItems[_navigationController.value],
            ),
        );
    }

    Widget _buildBottomNav() {
        return new IPhoneXPadding(
            child: GestureDetector(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CircularBottomNavigation(
                        tabItems,
                        barHeight: barHeightSize,
                        circleSize: circleSize,
                        controller: _navigationController,
                        barBackgroundColor: colorGrayscale10,
                        selectedIconColor: colorGrayscale10,
                        normalIconColor: Colors.white54,
                        animationDuration: Duration(milliseconds: 100),
                        selectedCallback: setSelectedTabPos,
                    )
                ),
                onTap: onTabSelected,
            )
        );
    }

    @override
    Widget build(BuildContext context) {
        return Stack(
            fit: StackFit.expand,
            children: [
                Scaffold(
                    appBar: PreferredSize(
                        preferredSize: const Size.fromHeight(kToolbarHeight),
                        child: MainAppBar(),
                    ),
                    body: Stack(
                        children: [
                            _buildTabContent(),
                            _buildBottomNav()
                        ],
                    ),
                )
            ],
        );
    }
}
