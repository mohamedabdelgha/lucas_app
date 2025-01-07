import 'package:flutter/material.dart';
import 'package:lucas_app/pages/login.dart';
import 'package:lucas_app/widgets/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: Width,
        height: Height,
        decoration: BoxDecoration(gradient: bgColor),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'It Is Never Too Late',
                  style: TextStyle(
                    fontFamily: 'italiano',
                    fontSize: 55,
                    color: whiteColor,
                  ),
                ),
                Text(
                  'For Coffee',
                  style: TextStyle(
                    fontFamily: 'italiano',
                    fontSize: 55,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
            Image.asset(
              'images/splashImg.png',
              scale: 0.9,
            ),
            Column(
              children: [
                Text(
                  'Choose your Favorite Coffee ',
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 16,
                    color: whiteColor,
                  ),
                ),
                Text(
                  'The best coffee taste in the world ',
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 16,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: Width - 50,
                  decoration: BoxDecoration(
                    color: lightBrownColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: whiteColor, fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
