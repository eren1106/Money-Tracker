import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/screens/AddScreen.dart';
import 'package:money_tracker/screens/HomeScreen.dart';
import 'package:money_tracker/screens/ReportScreen.dart';

class InApp extends StatefulWidget {
  InApp({Key? key}) : super(key: key);

  @override
  State<InApp> createState() => _InAppState();
}

class _InAppState extends State<InApp> {
  int _page = 0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          HomeScreen(),
          AddScreen(),
          ReportScreen(),
        ],
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            _page = page;
          });
        },
      ),
      bottomNavigationBar: Container(
        child: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,
              ),
            ),
          ],
          onTap: (page){
            _pageController.jumpToPage(page);
          },
        ),
      ),
    );
  }
}
