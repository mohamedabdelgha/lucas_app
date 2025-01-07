import 'package:flutter/material.dart';
import 'package:lucas_app/pages/chatpage.dart';
import 'package:lucas_app/widgets/colors.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double Width = MediaQuery.of(context).size.width;
    final double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      body: Container(
        width: Width,
        height: Height,
        color: whiteColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 0, left: 0, child: Image.asset('images/Ellipse_108.png')),
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset('images/Ellipse_109.png')),
            Positioned(
                child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/Webinar-rafiki.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    'You can contact us if there is a problem such as a delayed order or the appropriate order not arriving',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: blackColor,
                        fontFamily: 'inter',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatScreen()));
                  },
                  child: Container(
                    width: Width - 150,
                    alignment: Alignment.center,
                    height: 60,
                    decoration: BoxDecoration(
                        color: darkBrownColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Start Messaging',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )),
            Positioned(
                top: Height / 20,
                left: 10,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: darkBrownColor,
                      size: 30,
                    ))),
          ],
        ),
      ),
    );
  }
}
