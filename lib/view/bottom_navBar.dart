import 'package:chilli/view/explore/explore_screen.dart';
import 'package:chilli/view/home/home_screen.dart';
import 'package:chilli/view/marketPlace/marketPlace_screen.dart';
import 'package:flutter/material.dart';
// import 'package:simple_floating_bottom_nav_bar/floating_bottom_nav_bar.dart';
// import 'package:simple_floating_bottom_nav_bar/floating_item.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  dynamic size;
  int selectedIndex = 0;

  final List<Widget> widgetOptions = [
    const HomeScreen(),
    const ExploreScreen(),
    const MarketplaceScreen(),
    const Text('fourth screen'),
    const Text('five screen'),
    const Text('six screen'),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [

            widgetOptions.elementAt(selectedIndex),

            Container(
              height: 60,
              width: size.width * 0.85,
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                children: [

                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: selectedIndex == 0 ? Colors.white : Colors.transparent,
                            shape: BoxShape.circle
                        ),
                        child: Image.asset(
                          "assets/image/home.png",
                          color: selectedIndex == 0 ? Colors.black : Colors.white,
                        ),
                      ),
                      onTap: () {
                        onItemTapped(0);
                      },
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: selectedIndex == 1 ? Colors.white : Colors.transparent,
                            shape: BoxShape.circle
                        ),
                        child: Image.asset(
                          "assets/image/search.png",
                          color: selectedIndex == 1 ? Colors.black : Colors.white,
                        ),
                      ),
                      onTap: () {
                        onItemTapped(1);
                      },
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: selectedIndex == 2 ? Colors.white : Colors.transparent,
                            shape: BoxShape.circle
                        ),
                        child: Image.asset(
                          "assets/image/store.png",
                          color: selectedIndex == 2 ? Colors.black : Colors.white,
                        ),
                      ),
                      onTap: () {
                        onItemTapped(2);
                      },
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: selectedIndex == 3 ? Colors.white : Colors.transparent,
                            shape: BoxShape.circle
                        ),
                        child: Image.asset(
                          "assets/image/add.png",
                          color: selectedIndex == 3 ? Colors.black : Colors.white,
                        ),
                      ),
                      onTap: () {
                        onItemTapped(3);
                      },
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: selectedIndex == 4 ? Colors.white : Colors.transparent,
                            shape: BoxShape.circle
                        ),
                        child: Image.asset(
                          "assets/image/group.png",
                          color: selectedIndex == 4 ? Colors.black : Colors.white,
                        ),
                      ),
                      onTap: () {
                        onItemTapped(4);
                      },
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: selectedIndex == 5 ? Colors.white : Colors.transparent,
                            shape: BoxShape.circle
                        ),
                        child: Image.asset("assets/image/boy.png"),
                      ),
                      onTap: () {
                        onItemTapped(5);
                      },
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: Center(
    //     child: widgetOptions.elementAt(selectedIndex),
    //   ),
    //   bottomNavigationBar: Container(
    //     height: 60,
    //     width: size.width * 0.85,
    //     padding: const EdgeInsets.all(2),
    //     margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
    //     decoration: BoxDecoration(
    //       color: Colors.black.withOpacity(0.2),
    //       borderRadius: BorderRadius.circular(30)
    //     ),
    //     child: Row(
    //       children: [
    //
    //         Expanded(
    //           child: GestureDetector(
    //             child: Container(
    //               padding: const EdgeInsets.all(15),
    //               decoration: BoxDecoration(
    //                 color: selectedIndex == 0 ? Colors.white : Colors.transparent,
    //                 shape: BoxShape.circle
    //               ),
    //               child: Image.asset(
    //                 "assets/image/home.png",
    //                 color: selectedIndex == 0 ? Colors.black : Colors.white,
    //               ),
    //             ),
    //             onTap: () {
    //               onItemTapped(0);
    //             },
    //           ),
    //         ),
    //
    //         Expanded(
    //           child: GestureDetector(
    //             child: Container(
    //               padding: const EdgeInsets.all(15),
    //               decoration: BoxDecoration(
    //                   color: selectedIndex == 1 ? Colors.white : Colors.transparent,
    //                   shape: BoxShape.circle
    //               ),
    //               child: Image.asset(
    //                 "assets/image/search.png",
    //                 color: selectedIndex == 1 ? Colors.black : Colors.white,
    //               ),
    //             ),
    //             onTap: () {
    //               onItemTapped(1);
    //             },
    //           ),
    //         ),
    //
    //         Expanded(
    //           child: GestureDetector(
    //             child: Container(
    //               padding: const EdgeInsets.all(15),
    //               decoration: BoxDecoration(
    //                   color: selectedIndex == 2 ? Colors.white : Colors.transparent,
    //                   shape: BoxShape.circle
    //               ),
    //               child: Image.asset(
    //                 "assets/image/store.png",
    //                 color: selectedIndex == 2 ? Colors.black : Colors.white,
    //               ),
    //             ),
    //             onTap: () {
    //               onItemTapped(2);
    //             },
    //           ),
    //         ),
    //
    //         Expanded(
    //           child: GestureDetector(
    //             child: Container(
    //               padding: const EdgeInsets.all(15),
    //               decoration: BoxDecoration(
    //                   color: selectedIndex == 3 ? Colors.white : Colors.transparent,
    //                   shape: BoxShape.circle
    //               ),
    //               child: Image.asset(
    //                 "assets/image/add.png",
    //                 color: selectedIndex == 3 ? Colors.black : Colors.white,
    //               ),
    //             ),
    //             onTap: () {
    //               onItemTapped(3);
    //             },
    //           ),
    //         ),
    //
    //         Expanded(
    //           child: GestureDetector(
    //             child: Container(
    //               padding: const EdgeInsets.all(15),
    //               decoration: BoxDecoration(
    //                   color: selectedIndex == 4 ? Colors.white : Colors.transparent,
    //                   shape: BoxShape.circle
    //               ),
    //               child: Image.asset(
    //                 "assets/image/group.png",
    //                 color: selectedIndex == 4 ? Colors.black : Colors.white,
    //               ),
    //             ),
    //             onTap: () {
    //               onItemTapped(4);
    //             },
    //           ),
    //         ),
    //
    //         Expanded(
    //           child: GestureDetector(
    //             child: Container(
    //               padding: const EdgeInsets.all(15),
    //               decoration: BoxDecoration(
    //                   color: selectedIndex == 5 ? Colors.white : Colors.transparent,
    //                   shape: BoxShape.circle
    //               ),
    //               child: Image.asset("assets/image/boy.png"),
    //             ),
    //             onTap: () {
    //               onItemTapped(5);
    //             },
    //           ),
    //         ),
    //
    //       ],
    //     ),
    //   ),
    // );
  }
}
