import 'package:flutter/material.dart';
import 'package:lucas_app/widgets/colors.dart';
import 'package:lucas_app/widgets/constants.dart';

class StuffPage extends StatelessWidget {
  const StuffPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double Width = MediaQuery.of(context).size.width;
    final double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        iconTheme: IconThemeData(size: 35, color: lightBrownColor),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'The Owner',
              style: TextStyle(
                  color: darkBrownColor,
                  fontFamily: 'inter',
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              style: TextStyle(
                  color: grayColor,
                  fontFamily: 'inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(8),
                width: Width,
                height: Height / 5,
                decoration: BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(color: darkBrownColor, width: 2),
                      start: BorderSide(color: darkBrownColor, width: 2),
                      end: BorderSide(color: darkBrownColor, width: 2)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      width: Width / 2.5,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('images/manager.png'),
                              fit: BoxFit.cover)),
                      child: Container(
                        height: 100,
                        color: darkBrownColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.facebook,
                              color: whiteColor,
                            ),
                            Icon(
                              Icons.phone,
                              color: whiteColor,
                            ),
                            Icon(
                              Icons.facebook,
                              color: whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'MR/ Mohamed Elabd',
                          style: TextStyle(
                              color: darkBrownColor,
                              fontFamily: 'inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'mohamed@gmail.com',
                          style: TextStyle(
                              color: grayColor,
                              fontFamily: 'inter',
                              fontSize: 14),
                        ),
                        Text(
                          '011111111111111',
                          style: TextStyle(
                              color: grayColor,
                              fontFamily: 'inter',
                              fontSize: 14),
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy\n of the printing and typesetting\n industry.",
                          style: TextStyle(
                              overflow: TextOverflow.fade, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'The Team',
              style: TextStyle(
                  color: darkBrownColor,
                  fontFamily: 'inter',
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              style: TextStyle(
                  color: grayColor,
                  fontFamily: 'inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ImageSliderScreen(),
            )
          ],
        ),
      ),
    );
  }
}
