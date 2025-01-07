import 'package:flutter/material.dart';
import 'package:lucas_app/widgets/colors.dart';
import 'package:lucas_app/widgets/constants.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
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
          child: Stack(children: [
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset('images/backgroundImg.png'),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset('images/decorationImg.png'),
            ),
            ListView(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: PerchaseCard(
                    date: 'date',
                    time: 'time',
                    name: 'Latte',
                    price: '40 LE',
                    width: Width,
                    height: Height),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: PerchaseCard(
                    date: 'date',
                    time: 'time',
                    name: 'Latte',
                    price: '40 LE',
                    width: Width,
                    height: Height),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: PerchaseCard(
                    date: 'date',
                    time: 'time',
                    name: 'Latte',
                    price: '40 LE',
                    width: Width,
                    height: Height),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: PerchaseCard(
                    date: 'date',
                    time: 'time',
                    name: 'Latte',
                    price: '40 LE',
                    width: Width,
                    height: Height),
              ),
            ]),
          ]),
        ));
  }
}
