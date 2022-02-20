import 'package:flutter/material.dart';

import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:linco/profile.dart';
import 'package:linco/subhome.dart';
import 'package:linco/tasklist/tasklist.dart';
import 'package:linco/vip.dart/vip.dart';
import 'package:linco/vip1%20members/vip1_vip.dart';

import 'home.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  final List<Widget> _pages = [
    SubHome(),
    TaskList(),

    Vip1Homes(),

    Vip1Vip(),
    // ProfileInformarion(),
    // Home(),
    // History(),
    // Search(),
    // Alarm(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewPadding = MediaQuery.of(context).viewPadding;
    double barHeight;
    double barHeightWithNotch = 67;
    double arcHeightWithNotch = 67;

    if (size.height > 700) {
      barHeight = 70;
    } else {
      barHeight = size.height * 0.1;
    }

    if (viewPadding.bottom > 0) {
      barHeightWithNotch = (size.height * 0.07) + viewPadding.bottom;
      arcHeightWithNotch = (size.height * 0.075) + viewPadding.bottom;
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(143, 50, 49, 1),
      body: _pages[currentPage],
      bottomNavigationBar: CircleBottomNavigationBar(
        initialSelection: currentPage,
        barHeight: viewPadding.bottom > 0 ? barHeightWithNotch : barHeight,
        arcHeight: viewPadding.bottom > 0 ? arcHeightWithNotch : barHeight,
        itemTextOff: viewPadding.bottom > 0 ? 0 : 1,
        itemTextOn: viewPadding.bottom > 0 ? 0 : 1,
        circleOutline: 15.0,
        shadowAllowance: 0.0,
        circleSize: 50.0,
        blurShadowRadius: 50.0,
        circleColor: Color.fromRGBO(223, 128, 24, 1),
        activeIconColor: Color.fromRGBO(143, 50, 49, 1),
        inactiveIconColor: Colors.grey,
        tabs: getTabsData(),
        onTabChangedListener: (index) => setState(() => currentPage = index),
        barBackgroundColor: Color.fromRGBO(15, 51, 63, 4),
      ),
    );
  }
}

List<TabData> getTabsData() {
  return [
    TabData(
      icon: Icons.task,
      iconSize: 25.0,
      title: 'Task',
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.receipt_rounded,
      iconSize: 25,
      title: 'Record',
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.home,
      iconSize: 25.0,
      title: 'Home',
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.important_devices,
      iconSize: 25,
      title: 'VIP',
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    // TabData(
    //   icon: Icons.person,
    //   iconSize: 25,
    //   title: 'Profile',
    //   fontSize: 15,
    //   fontWeight: FontWeight.bold,
    // ),
  ];
}
