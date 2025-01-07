import 'package:flutter/material.dart';
import 'package:lucas_app/widgets/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final double Width = MediaQuery.of(context).size.width;
    final double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      backgroundColor: darkBrownColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: Width,
            height: Height / 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                      Navigator.pop(context); // Navigate back
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: whiteColor,
                      size: 35,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: Image.asset(
                        'images/profile.png',
                        scale: 0.7,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rahma Salem',
                          style: TextStyle(
                              color: whiteColor,
                              fontFamily: 'inter',
                              fontSize: 20),
                        ),
                        Text(
                          'rahmasalem999@gmail.com',
                          style: TextStyle(
                              color: grayColor,
                              fontFamily: 'inter',
                              fontSize: 14),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.call,
                          size: 35,
                          color: whiteColor,
                        ))
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              // width: Width,
              // height: Height / 1.2,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(60))),
              child: Column(children: [
                Expanded(child: ListView(
                children: [],
                )),
                SizedBox(
                  width: Width,
                  height: Height / 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Color(0xffDFDFDF),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              )),
                              Icon(
                                Icons.attach_file,
                                size: 30,
                                color: grayColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: lightBrownColor,
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.send,
                          color: whiteColor,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
