import 'package:flutter/material.dart';
import 'package:lucas_app/widgets/colors.dart';
import 'package:lucas_app/widgets/constants.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    final double Width = MediaQuery.of(context).size.width;
    final double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SizedBox(
        width: Width,
        height: Height,
        child: Stack(
          children: [
            Positioned(
                top: 0, left: 0, child: Image.asset('images/Ellipse_108.png')),
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset('images/Ellipse_109.png')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Your Feedback',
                    style: TextStyle(
                        color: darkBrownColor,
                        fontFamily: 'inter',
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  Center(child: Image.asset('images/Feedback-rafiki_1.png')),
                  Text(
                    'Add Your Rating',
                    style: TextStyle(
                        color: blackColor,
                        fontFamily: 'inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  RateWidget(),
                  Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                            color: blackColor,
                            fontFamily: 'inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true, // Enables background color
                              fillColor: whiteColor, // Background color
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: grayColor,
                                    width: 1.0), // Border color and width
                                borderRadius: BorderRadius.circular(
                                    8.0), // Rounded corners
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: brownColor,
                                    width:
                                        1.0), // Border color and width when focused
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              hintText: 'Your name',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                            color: blackColor,
                            fontFamily: 'inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: whiteColor,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grayColor, width: 1.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: brownColor, width: 1.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              hintText: 'Your email',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Feedback',
                        style: TextStyle(
                            color: blackColor,
                            fontFamily: 'inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10),
                        child: Center(
                          child: TextField(
                            minLines: 2,
                            maxLines: 3,
                            maxLength: 200,
                            decoration: InputDecoration(
                              filled: true, // Enables background color
                              fillColor: whiteColor,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grayColor, width: 1.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: brownColor, width: 1.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              hintText: 'Your feedback',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: Width,
                      margin: EdgeInsets.all(10),
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: darkBrownColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Send Your Feedback',
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 18,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: Height / 20,
              left: 10,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: lightBrownColor,
                    size: 35,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
