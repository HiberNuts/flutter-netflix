// ignore_for_file: unused_field, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:netflix/screens/DownloadScreen.dart';
import 'package:netflix/screens/MoreScreen.dart';
import 'package:netflix/widgets/coustom_appbar.dart';

import '../widgets/bodyScreen.dart';
import 'SearchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;
  PageController pageController = PageController();

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  int selected_index = 0;
  void onTap(int index) {
    setState(() {
      selected_index = index;
    });
    pageController.jumpToPage(selected_index);
  }

  Future getData() async {}

  @override
  Widget build(BuildContext context) {
    // PageController pagecontroller = PageController();

    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 70.0),
          child: const CoustomAppBar(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: selected_index,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.download_outlined,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_outlined,
                size: 30,
              ),
              label: '',
            ),
          ],
        ),
        body: PageView(
          controller: pageController,
          children: [
            bodyScreen(),
            const SearchScreen(),
            const DownloadScreen(),
            const MoreScreen(),
          ],
          onPageChanged: (value) {
            setState(() {
              selected_index = value;
            });
          },
        ));
  }
}

















//  SliverToBoxAdapter(
//             child: Container(
//               height: 250.0,
//               width: double.infinity,
//               child:
//                   Image.network("https://wallpaperaccess.com/full/790323.jpg"),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.add,
//                       color: Colors.white,
//                     ),
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(primary: Colors.white),
//                     icon: const Icon(Icons.play_arrow, color: Colors.black),
//                     label: const Text(
//                       "Play",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.info_outline,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ]),
//           ),

// SizedBox(
//                   width: 400,
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         height: 150,
//                         width: 150,
//                         child: Image.network(
//                             "https://www.comingsoon.net/assets/uploads/gallery/narcos/narcos_301_unit_00124r.jpg"),
//                       ),
//                       SizedBox(
//                         height: 150,
//                         width: 150,
//                         child: Image.network(
//                             "https://www.comingsoon.net/assets/uploads/gallery/narcos/narcos_301_unit_00124r.jpg"),
//                       ),
//                       SizedBox(
//                         height: 150,
//                         width: 150,
//                         child: Image.network(
//                             "https://www.comingsoon.net/assets/uploads/gallery/narcos/narcos_301_unit_00124r.jpg"),
//                       )
//                     ],
//                   ),
//                 ),
