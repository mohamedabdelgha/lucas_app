import 'package:flutter/material.dart';
import 'package:lucas_app/pages/home.dart';
import 'package:lucas_app/pages/signup.dart';
import 'package:lucas_app/widgets/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(0, 1), // Starts off-screen (bottom)
      end: Offset(0, 0), // Ends at its original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: Width,
        height: Height,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Image.asset(
                  'images/splashImg2.png',
                  scale: 0.9,
                )),
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: SlantedContainerClipper(),
                child: Container(
                  height: Height / 1.6,
                  width: Width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                        'images/decorationImg.png',
                      )),
                      color: Color(0xFFB89C86),
                      borderRadius: BorderRadius.only(
                          // topLeft: Radius.circular(10),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 50.0, left: 50.0, top: 50),
                    child: SlideTransition(
                      position: _animation,
                      child: Column(
                        spacing: 15,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff6F4E37),
                            ),
                          ),
                          CustomTextField(
                            icon: Icons.email,
                            labelText: 'email',
                          ),
                          CustomTextField(
                            icon: Icons.lock,
                            labelText: 'password',
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Forget password',
                              style: TextStyle(
                                  // decoration: TextDecoration.underline,
                                  color: Color(0xff6F4E37),
                                  fontFamily: 'inter',
                                  fontSize: 16),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: Width / 2,
                                  height: Height / 15,
                                  decoration: BoxDecoration(
                                      color: Color(0xff6F4E37),
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xff453022),
                                            offset: Offset(3, 5)),
                                      ]),
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'inter',
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dont Have Account? ',
                                  style: TextStyle(
                                      color: Color(0xff453022),
                                      fontSize: 16,
                                      fontFamily: 'inter'),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Signup()));
                                  },
                                  child: Text('Sign UP',
                                      style: TextStyle(
                                          color: Color(0xff453022),
                                          fontSize: 16,
                                          fontFamily: 'inter',
                                          fontWeight: FontWeight.bold)),
                                ),
                              ]),
                          Divider_tool(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.g_mobiledata,
                                  size: 60,
                                  color: Color(0xff453022),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.facebook,
                                  size: 50,
                                  color: Color(0xff453022),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
