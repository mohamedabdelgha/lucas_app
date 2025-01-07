import 'package:flutter/material.dart';
import 'package:lucas_app/pages/community.dart';
import 'package:lucas_app/pages/feedbacks.dart';
import 'package:lucas_app/pages/stuff.dart';
import 'package:lucas_app/widgets/colors.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double Width = MediaQuery.of(context).size.width;
    final double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: lightBrownColor,
              size: 35,
            )),
      ),
      body: SizedBox(
        width: Width,
        height: Height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'About Us',
                style: TextStyle(
                    color: darkBrownColor,
                    fontFamily: 'inter',
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but ",
                style: TextStyle(
                    color: grayColor,
                    fontFamily: 'inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: Width,
                  height: Height / 4,
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(color: darkBrownColor, width: 2),
                          start: BorderSide(color: darkBrownColor, width: 2),
                          end: BorderSide(color: darkBrownColor, width: 2)),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('images/place.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'More About Us',
                style: TextStyle(
                    color: darkBrownColor,
                    fontFamily: 'inter',
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    spacing: 20,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommunityPage()));
                        },
                        child: Container(
                          width: 170,
                          height: 85,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage('images/Rectangle_2.png'),
                                  fit: BoxFit.cover)),
                          child: Text(
                            'Community',
                            style: TextStyle(
                                fontFamily: 'inter',
                                fontSize: 22,
                                color: whiteColor),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeedbackScreen()));
                        },
                        child: Container(
                          width: 170,
                          height: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage('images/Rectangle_3.png'),
                                  fit: BoxFit.cover)),
                          child: Text(
                            'Feedbacks',
                            style: TextStyle(
                                fontFamily: 'inter',
                                fontSize: 22,
                                color: whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StuffPage()));
                    },
                    child: Container(
                      width: 170,
                      height: 170,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/Rectangle_1.png'),
                              fit: BoxFit.cover)),
                      child: Text(
                        'Manager & Stuff',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'inter',
                          fontSize: 20,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
