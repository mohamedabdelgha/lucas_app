import 'package:flutter/material.dart';
import 'package:lucas_app/pages/cart.dart';
import 'package:lucas_app/pages/community.dart';
import 'package:lucas_app/pages/fav.dart';
import 'package:lucas_app/pages/mainScreen.dart';
import 'package:lucas_app/pages/reservation.dart';
import 'package:lucas_app/widgets/colors.dart';
import 'package:lucas_app/widgets/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Mainscreen(),
    ReservePage(),
    FavoritesPage(),
    CartPage(),
    CommunityPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      drawer: DrawerWidget(),
      appBar: AppBar(
        surfaceTintColor: whiteColor,
        backgroundColor: whiteColor,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                // Using Builder to get the correct context
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu_open_outlined,
                size: 35,
                color: darkBrownColor,
              ),
            );
          },
        ),
        title: FittedBox(
          child: Text(
            'LUCAS',
            style: TextStyle(
              color: darkBrownColor,
              fontSize: 30,
              fontFamily: 'Jomolhari',
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: lightBrownColor,
              child: Image.asset(
                'images/profile.png',
                width: 50,
              ),
            ),
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        width: width,
        height: height / 10,
        color: whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            _pages.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                width: _currentIndex == index ? 60 : 50,
                height: _currentIndex == index ? 60 : 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _getIconForIndex(index),
                      color: _currentIndex == index
                          ? darkBrownColor
                          : Color.fromARGB(255, 214, 213, 213),
                      size: 35,
                    ),
                    if (_currentIndex == index)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        height: 2,
                        width: 24,
                        color: darkBrownColor,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.home_rounded;
      case 1:
        return Icons.calendar_month_rounded;
      case 2:
        return Icons.favorite;
      case 3:
        return Icons.shopping_cart;
      case 4:
        return Icons.chat_bubble_outline_rounded;
      default:
        return Icons.home_rounded;
    }
  }
}
