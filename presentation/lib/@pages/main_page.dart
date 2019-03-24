import 'dart:io';
import 'package:flutter/material.dart';
import 'package:imdb_flutter/@global/colors.dart';
import 'package:imdb_flutter/@pages/screens/movies/list.dart';
import 'package:imdb_flutter/@pages/widgets/tabs/tabs.dart';
import 'package:imdb_flutter/@pages/widgets/headers/header.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

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
    TabController _tabController;
    int _selectedTab = 0;

    @override
    void initState() {
        super.initState();
        _tabController = TabController(length: 3, vsync: this);
    }

    @override
    void dispose() {
        super.dispose();
        _tabController.dispose();
    }

    Widget _buildTabContent() {
        return Positioned.fill(
            child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                    const MovieListPage(),
                    const MovieListPage(),
                    const MovieListPage(),
                ],
            ),
        );
    }

    void _tabSelected(int newIndex) {
        setState(() {
            _selectedTab = newIndex;
            _tabController.index = newIndex;
        });
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
                        _BottomTabs(
                            selectedTab: _selectedTab,
                            onTap: _tabSelected,
                        ),
                        ],
                    ),
                )
            ],
        );
    }
}

class _BottomTabs extends StatelessWidget {
    _BottomTabs({
        @required this.selectedTab,
        @required this.onTap,
    });

    final int selectedTab;
    final ValueChanged<int> onTap;

    @override
    Widget build(BuildContext context) {
        return new IPhoneXPadding(
            child: Align(
            alignment: Alignment.bottomCenter,
            child: MainBottomBar(
                currentIndex: selectedTab,
                onTap: onTap,
                items: [
                    BottomNavigationBarItem(
                        title: Text("Trending", style: TextStyle(fontSize: 12)),
                        icon: const Icon(Icons.movie),
                        backgroundColor: colorWhite,
                    ),
                    BottomNavigationBarItem(
                        title: Text("Top Rating", style: TextStyle(fontSize: 12)),
                        icon: const Icon(Icons.trending_up),
                        backgroundColor: colorWhite,
                    ),
                    BottomNavigationBarItem(
                        title: Text("Incoming"),
                        icon: const Icon(Icons.update),
                        backgroundColor: colorWhite,
                    ),
                ],
                )
            )
        );
    }
}
