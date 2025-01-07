import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lucas_app/widgets/colors.dart';
import 'package:lucas_app/widgets/constants.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  String selectedFilter = 'All'; // Initial selected filter
  final PageController _pageController = PageController();
  final ScrollController _controller = ScrollController();
  Timer? _timer; // Timer variable

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startSlideshow();
  }

  void _startSlideshow() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (mounted) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SizedBox(
        width: Width,
        height: Height,
        child: ListView(
          controller: _controller,
          scrollDirection: Axis.vertical,
          children: [
            SearchInput(),
            SizedBox(
              width: Width,
              height: Height / 5,
              child: PageView(
                controller: _pageController,
                children: [
                  OfferWidget(
                    width: Width,
                    height: Height,
                    proID: '1',
                  ),
                  OfferWidget(
                    width: Width,
                    height: Height,
                    proID: '2',
                  ),
                  OfferWidget(
                    width: Width,
                    height: Height,
                    proID: '3',
                  ),
                ],
              ),
            ),
            SizedBox(
              width: Width,
              height: Height / 17,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FilterWidget(
                    text: 'All',
                    isPressed: selectedFilter == 'All',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'All';
                      });
                    },
                  ),
                  FilterWidget(
                    text: 'Espresso',
                    isPressed: selectedFilter == 'Espresso',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'Espresso';
                      });
                    },
                  ),
                  FilterWidget(
                    text: 'Hot Drinks',
                    isPressed: selectedFilter == 'Hot Drinks',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'Hot Drinks';
                      });
                    },
                  ),
                  FilterWidget(
                    text: 'Soft Drinks',
                    isPressed: selectedFilter == 'Soft Drinks',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'Soft Drinks';
                      });
                    },
                  ),
                  FilterWidget(
                    text: 'Breakfast',
                    isPressed: selectedFilter == 'Breakfast',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'Breakfast';
                      });
                    },
                  ),
                  FilterWidget(
                    text: 'Desert',
                    isPressed: selectedFilter == 'Desert',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'Desert';
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: Width,
              height: Height / 3.2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ProductCard(
                    height: Height,
                    width: Width,
                    title: 'Delight Pistachio',
                    discription: 'Easy Pistachio Flavour',
                    price: '90' ' LE',
                    image: 'images/drink1.png',
                    category: 'soft drinks',
                  ),
                  ProductCard(
                    height: Height,
                    width: Width,
                    title: 'Delight Mango',
                    discription: 'Easy Pistachio Flavour',
                    price: '80' ' LE',
                    image: 'images/drink2.png',
                    category: 'soft drinks',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Seller',
                    style: TextStyle(
                        color: blackColor,
                        fontFamily: 'inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          'See All',
                          style: TextStyle(
                              color: grayColor,
                              fontFamily: 'inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.arrow_forward_ios, size: 14),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BestSeller(
              width: Width,
            ),
            BestSeller(
              width: Width,
            ),
            BestSeller(
              width: Width,
            ),
            BestSeller(
              width: Width,
            ),
          ],
        ),
      ),
    );
  }
}
