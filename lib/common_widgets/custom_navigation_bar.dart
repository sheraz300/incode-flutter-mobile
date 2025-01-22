import 'package:flutter/material.dart';
import 'package:incode/screens/history%20screen/history_screen.dart';
import 'package:incode/screens/home_screen.dart';
import 'package:incode/screens/profile%20screen/profile_screen.dart';
import 'package:incode/screens/work%20screen/work_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeScreen(),
    const HistoryScreen(),
    const WorkScreen(),
    const ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: _children[_currentIndex],
          bottomNavigationBar: SizedBox(
            height: 68,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(233, 236, 239, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Container(
                          width: 60,
                          height: 4,
                          decoration: BoxDecoration(
                            color: _currentIndex == 0
                                ? const Color.fromRGBO(202, 33, 49, 1)
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () => onTabTapped(0),
                          child: Column(
                            children: [
                              _currentIndex == 0
                                  ? const Icon(Icons.menu_book,
                                      color: Color(0xFF7D0C16))
                                  : const Icon(
                                      Icons.menu_book,
                                      color: Colors.black,
                                    ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Projects',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: _currentIndex == 0
                                      ? const Color(0xFF7D0C16)
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => onTabTapped(1),
                          child: Column(
                            children: [
                              _currentIndex == 1
                                  ? const Icon(Icons.history,
                                      color: Color(0xFF7D0C16))
                                  : const Icon(Icons.history,
                                      color: Colors.black),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'History',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: _currentIndex == 1
                                      ? const Color(0xFF7D0C16)
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () => onTabTapped(2),
                          child: Column(
                            children: [
                              _currentIndex == 2
                                  ? const Icon(Icons.work,
                                      color: Color(0xFF7D0C16))
                                  : const Icon(Icons.work, color: Colors.black),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Work',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: _currentIndex == 2
                                      ? const Color(0xFF7D0C16)
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => onTabTapped(3),
                          child: Column(
                            children: [
                              _currentIndex == 3
                                  ? const Icon(Icons.person,
                                      color: Color(0xFF7D0C16))
                                  : const Icon(Icons.person,
                                      color: Colors.black),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Profile',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: _currentIndex == 3
                                      ? const Color(0xFF7D0C16)
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xFF7D0C16),
            shape: const CircleBorder(),
            child: const Icon(Icons.qr_code_scanner, color: Colors.white),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ],
    );
  }
}
