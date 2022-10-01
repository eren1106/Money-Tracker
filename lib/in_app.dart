import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/screens/add_screen.dart';
import 'package:money_tracker/screens/home_screen.dart';
import 'package:money_tracker/screens/login_screen.dart';
import 'package:money_tracker/screens/register_screen.dart';
import 'package:money_tracker/screens/report_screen.dart';

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
   return 
    //Scaffold(
    //   body: PageView(
    //     children: [
    //       HomeScreen(),
    //       AddScreen(),
    //       ReportScreen(),
    //     ],
    //     physics: const NeverScrollableScrollPhysics(),
    //     controller: _pageController,
    //     onPageChanged: (page) {
    //       setState(() {
    //         _page = page;
    //       });
    //     },
    //   ),
    //   bottomNavigationBar: Container(
    //     child: CupertinoTabBar(
    //       backgroundColor: Theme.of(context).backgroundColor,
    //       items: [
    //         BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.home,
    //             color: _page == 0
    //                 ? Theme.of(context).selectedRowColor
    //                 : Theme.of(context).unselectedWidgetColor,
    //           ),
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.add_circle,
    //             color: _page == 1
    //                 ? Theme.of(context).selectedRowColor
    //                 : Theme.of(context).unselectedWidgetColor,
    //           ),
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.bar_chart,
    //             color: _page == 2
    //                 ? Theme.of(context).selectedRowColor
    //                 : Theme.of(context).unselectedWidgetColor,
    //           ),
    //         ),
    //       ],
    //       onTap: (page) {
    //         _pageController.jumpToPage(page);
    //       },
    //     ),
    //   ),
    // );
    LoginScreen();
    // RegisterScreen();
  }
}
