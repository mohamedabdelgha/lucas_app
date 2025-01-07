import 'package:flutter/material.dart';
import 'package:lucas_app/widgets/colors.dart';
import 'package:lucas_app/widgets/constants.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        surfaceTintColor: whiteColor,
        backgroundColor: whiteColor,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 35,
                color: darkBrownColor,
              ),
            );
          },
        ),
        title: FittedBox(
          child: Text(
            'My Orders',
            style: TextStyle(
              color: darkBrownColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'inter',
            ),
          ),
        ),
      ),
      body: Stack(children: [
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
        SizedBox(
          width: width,
          height: height,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: darkBrownColor,
                      child: Image.asset('images/profile.png'),
                    ),
                    SizedBox(
                      width: width / 20,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'rahma salem',
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: blackColor),
                        ),
                        Text(
                          'rahoma@gmail.com',
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: grayColor),
                        )
                      ],
                    ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Divider(
                  thickness: 2,
                  color: customGrayColor,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: OrderCard(
                    status: 'Deliverd',
                    date: 'date',
                    quantity: '4',
                    time: 'time',
                    name: 'Latte',
                    price: '40 LE',
                    width: width,
                    height: height),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: OrderCard(
                    status: 'On progress',
                    date: 'date',
                    quantity: '4',
                    time: 'time',
                    name: 'Latte',
                    price: '40 LE',
                    width: width,
                    height: height),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: OrderCard(
                    status: 'Deliverd',
                    date: 'date',
                    quantity: '4',
                    time: 'time',
                    name: 'Latte',
                    price: '40 LE',
                    width: width,
                    height: height),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
