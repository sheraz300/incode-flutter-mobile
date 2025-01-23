import 'package:flutter/material.dart';
import 'package:incode/common_widgets/asset_image_widget.dart';
import 'package:incode/constants/assets.dart';
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
    const SizedBox(),
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
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    left: 21.0 + (_currentIndex * 77),
                    child: Container(
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                        color: _currentIndex == 2
                            ? Colors.transparent
                            : const Color.fromRGBO(202, 33, 49, 1),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
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
                                  ? const AssetImageWidget(
                                      path: AppAssets.progetti,
                                      color: Color(0xFF7D0C16),
                                    )
                                  : const AssetImageWidget(
                                      path: AppAssets.progetti,
                                    ),
                              const SizedBox(height: 4),
                              Text(
                                'Progetti',
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
                                  ? const AssetImageWidget(
                                      path: AppAssets.interventi,
                                      color: Color(0xFF7D0C16),
                                    )
                                  : const AssetImageWidget(
                                      path: AppAssets.interventi,
                                    ),
                              const SizedBox(height: 4),
                              Text(
                                'Interventi',
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
                        InkWell(
                          onTap: () => onTabTapped(2),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 32,
                                ),
                                Text(
                                  "Scan",
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
                        ),
                        InkWell(
                          onTap: () => onTabTapped(3),
                          child: Column(
                            children: [
                              _currentIndex == 3
                                  ? const AssetImageWidget(
                                      path: AppAssets.utilita,
                                      color: Color(0xFF7D0C16),
                                    )
                                  : const AssetImageWidget(
                                      path: AppAssets.utilita,
                                    ),
                              const SizedBox(height: 4),
                              Text(
                                'Utilita',
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
                        InkWell(
                          onTap: () => onTabTapped(4),
                          child: Column(
                            children: [
                              _currentIndex == 4
                                  ? const AssetImageWidget(
                                      path: AppAssets.profilo,
                                      color: Color(0xFF7D0C16),
                                    )
                                  : const AssetImageWidget(
                                      path: AppAssets.profilo,
                                    ),
                              const SizedBox(height: 4),
                              Text(
                                'Profilo',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: _currentIndex == 4
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
            onPressed: () {
              onTabTapped(2);
            },
            backgroundColor: const Color(0xFF7D0C16),
            shape: const CircleBorder(),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: AssetImageWidget(path: AppAssets.scan),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ],
    );
  }
}
