import 'package:flutter/material.dart';
import 'package:lucas_app/widgets/colors.dart';
import 'package:lucas_app/widgets/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final double Width = MediaQuery.of(context).size.width;
    final double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: darkBrownColor,
      body: Stack(alignment: Alignment.center, children: [
        Positioned(
          bottom: 0,
          child: Container(
            width: Width,
            height: Height / 1.2,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(150))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 150.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                        color: blackColor,
                        fontFamily: 'inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  InfoCard(
                    data: 'rahma salem',
                    height: Height,
                    width: Width,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        color: blackColor,
                        fontFamily: 'inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  InfoCard(
                    data: 'elghani888@gmail.com',
                    height: Height,
                    width: Width,
                  ),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                        color: blackColor,
                        fontFamily: 'inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  InfoCard(
                    data: '01007981850',
                    height: Height,
                    width: Width,
                  ),
                  Text(
                    'Birth Date',
                    style: TextStyle(
                        color: blackColor,
                        fontFamily: 'inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  InfoCard(
                    data: '16/4/2024',
                    height: Height,
                    width: Width,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: Height / 10,
          child: CircleAvatar(
            backgroundColor: whiteColor,
            radius: 80,
            child: Image.asset(
              'images/profile.png',
              scale: 0.3,
            ),
          ),
        ),
        Positioned(
            top: Height / 20,
            left: 10,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: whiteColor,
                  size: 30,
                ))),
        Positioned(
          bottom: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Navigate back
              },
              child: Container(
                width: Width - 50,
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                    color: darkBrownColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'inter',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
