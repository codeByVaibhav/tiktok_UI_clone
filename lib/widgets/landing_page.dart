import 'package:flutter/material.dart';
import 'package:tiktok_clone/routes/route_navigation.dart';
import 'package:tiktok_clone/screens/home_screen.dart';
import 'package:tiktok_clone/screens/messages_screen.dart';
import 'package:tiktok_clone/screens/profile_screen.dart';
import 'package:tiktok_clone/screens/search_screen.dart';
import 'package:tiktok_clone/tik_tok_icons_icons.dart';

class LandingPage extends StatefulWidget {
  final int tab;
  LandingPage({this.tab = 0});
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  bool _tallPhone;

  final List<Widget> _tabs = [
    HomeScreen(),
    SearchScreen(),
    Container(), // placeholder for AppVideoPlayer Screen
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        _tallPhone =
            MediaQuery.of(context).size.aspectRatio < 0.5 ? true : false;
      });
    });
    setState(() => _currentIndex = widget.tab);
  }

  @override
  Widget build(BuildContext context) {
    if (_tallPhone == null) return Container();
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: _currentIndex == 0 ? !_tallPhone : false,
      body: _tabs[_currentIndex],
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  Color get _iconColor =>
      _currentIndex == 0 ? Colors.white : Color.fromARGB(255, 25, 25, 25);

  void _changeTab(int tabNo) {
    if (tabNo == 2) {
      lastTab = _currentIndex;
      gotoAddVideoScreen();
    } else
      setState(() => _currentIndex = tabNo);
  }

  Widget get _bottomNavigationBar => BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeTab,
        type: BottomNavigationBarType.fixed,
        backgroundColor: _currentIndex == 0 ? Colors.transparent : Colors.white,
        selectedIconTheme: IconThemeData(
          color: _iconColor,
          opacity: 1.0,
          size: 23.0,
        ),
        unselectedIconTheme: IconThemeData(
          color: _iconColor,
          opacity: 0.5,
          size: 21.0,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(TikTokIcons.home),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(TikTokIcons.search),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: _addVideoIcon,
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(TikTokIcons.messages),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(TikTokIcons.profile),
            title: SizedBox.shrink(),
          ),
        ],
      );

  Widget get _addVideoIcon => Container(
        width: 60.0,
        height: 40.0,
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 30.0,
                  height: 39.0,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(200, 250, 45, 108),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                Container(
                  width: 30.0,
                  height: 39.0,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(200, 32, 211, 234),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                width: 30.0 * 1.7,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: _iconColor,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Icon(
                  Icons.add,
                  size: 25.0,
                  color: _currentIndex == 0 ? Colors.grey[900] : Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
}
