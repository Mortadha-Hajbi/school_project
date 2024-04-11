import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:school/Map/map.dart';
import 'package:school/events.dart';
import 'package:school/home.dart';
import 'package:school/introduction.dart';
import 'package:school/schools_list.dart';

class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  _navbarState createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int _selectedIndex = 0;

  Map<int, Widget>? _pages;

  @override
  Widget build(BuildContext context) {
    _pages = {
      0: OnBoardingScreen(),
      1: schoolListPage(),
      2: EventPage(),
      3: Location(),
    };

    void _onTabTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      body: _pages![_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(122, 0, 0, 0),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                gap: 8,
                activeColor: Color.fromARGB(255, 255, 255, 255),
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Color.fromARGB(255, 35, 35, 35)
                    .withOpacity(1), // selected tab background color
                tabs: [
                  GButton(
                    iconColor: Colors.white,
                    icon: LineIcons.home,
                    text: 'home',
                  ),
                  GButton(
                    iconColor: Colors.white,
                    icon: LineIcons.listOl,
                    text: 'List',
                  ),
                  GButton(
                    iconColor: Colors.white,
                    icon: LineIcons.calendarWithDayFocus,
                    text: 'Profil',
                  ),
                  GButton(
                    iconColor: Colors.white,
                    icon: Icons.place,
                    text: 'location',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
