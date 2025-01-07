import 'package:flutter/material.dart';
import 'package:lucas_app/widgets/colors.dart';
import 'package:lucas_app/widgets/constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
              bottom: 0,
              child: Image.asset('images/backgroundImg.png'),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Image.asset('images/decorationImg.png'),
            ),
            ListView(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: PerchasedCard(
                    date: 'date',
                    quantity: '4',
                    time: 'time',
                    name: 'Latte',
                    price: '40 LE',
                    width: Width,
                    height: Height),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: PerchasedCard(
                    date: 'date',
                    quantity: '4',
                    time: 'time',
                    name: 'Latte',
                    price: '40 LE',
                    width: Width,
                    height: Height),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: PerchasedCard(
                    date: 'date',
                    quantity: '4',
                    time: 'time',
                    name: 'Latte',
                    price: '40 LE',
                    width: Width,
                    height: Height),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: PerchasedCard(
                    date: 'date',
                    quantity: '4',
                    time: 'time',
                    name: 'Latte',
                    price: '40 LE',
                    width: Width,
                    height: Height),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: Width,
                  margin: EdgeInsets.all(10),
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: darkBrownColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 18,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ]),
          ]),
        ));
  }
}
