import 'package:flutter/material.dart';
import 'package:lucas_app/pages/about.dart';
import 'package:lucas_app/pages/orders.dart';
import 'package:lucas_app/pages/product.dart';
import 'package:lucas_app/pages/profile.dart';
import 'package:lucas_app/pages/support.dart';
import 'package:lucas_app/widgets/colors.dart';
import 'package:lucas_app/widgets/popup.dart';

// -----------------------------------------------------------------------------------------------------------------------
// Custom Clipper for Slanted Container ----------------------------------------------------------------------------------
class SlantedContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 150);
    path.quadraticBezierTo(
      10, 0, // Control point
      size.width, 0, // End point
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

//------------------------------------------------------------------------------------------------------------------------
//input fields class -----------------------------------------------------------------------------------------------------
class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData icon;

  const CustomTextField(
      {super.key, required this.labelText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelStyle: TextStyle(
            color: brownColor,
            fontSize: 16,
            fontFamily: 'inter',
            fontWeight: FontWeight.bold),
        labelText: labelText, // Label text
        prefixIcon: Icon(
          icon,
          color: brownColor,
          size: 30,
        ), // Icon at the start
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: brownColor), // Brown border color
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: brownColor), // Brown border color when focused
        ),
        // Optional: You can add the following line to make the cursor color brown
        focusColor: brownColor, // Cursor color on focus
      ),
      cursorColor: brownColor, // Cursor color when focused
    );
  }
}

//------------------------------------------------------------------------------------------------------------------------
//divider tool class -----------------------------------------------------------------------------------------------------
class Divider_tool extends StatelessWidget {
  const Divider_tool({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: darkBrownColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'OR',
            style: TextStyle(
                color: darkBrownColor, fontFamily: 'inter', fontSize: 18),
          ),
        ),
        Expanded(
          child: Divider(
            color: darkBrownColor,
          ),
        ),
      ],
    );
  }
}

//------------------------------------------------------------------------------------------------------------------------
//search bar class -------------------------------------------------------------------------------------------------------
class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: lightGrayColor, borderRadius: BorderRadius.circular(50)),
      child: TextFormField(
        style: TextStyle(color: grayColor, fontSize: 20, fontFamily: 'inter'),
        decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
                color: grayColor,
                fontFamily: 'inter',
                fontSize: 18,
                fontWeight: FontWeight.w500),
            border: InputBorder.none,
            icon: Icon(
              Icons.search,
              color: grayColor,
              size: 30,
            )),
        cursorColor: grayColor, // Cursor color when focused
      ),
    );
  }
}

//------------------------------------------------------------------------------------------------------------------------
//drawer class -----------------------------------------------------------------------------------------------------------
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteColor,
      child: Column(
        children: [
          // Profile Section
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: whiteColor),
            accountName: Text(
              'Rahma Salem',
              style: TextStyle(color: blackColor, fontFamily: 'inter'),
            ),
            accountEmail: Text(
              'rahma164@gmail.com',
              style: TextStyle(color: grayColor, fontFamily: 'inter'),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 60,
              backgroundColor: darkBrownColor,
              backgroundImage: AssetImage('images/profile.png'),
            ),
          ),
          // Drawer items
          ListTile(
            leading: Icon(
              Icons.person,
              color: lightBrownColor,
            ),
            title: Text(
              'Edit Profile',
              style: TextStyle(color: blackColor, fontFamily: 'inter'),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.list_outlined,
              color: lightBrownColor,
            ),
            title: Text(
              'My Orders',
              style: TextStyle(color: blackColor, fontFamily: 'inter'),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyOrdersPage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.lock,
              color: lightBrownColor,
            ),
            title: Text(
              'Privacy',
              style: TextStyle(color: blackColor, fontFamily: 'inter'),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.password,
              color: lightBrownColor,
            ),
            title: Text(
              'Change Password',
              style: TextStyle(color: blackColor, fontFamily: 'inter'),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.support,
              color: lightBrownColor,
            ),
            title: Text(
              'Support',
              style: TextStyle(color: blackColor, fontFamily: 'inter'),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SupportScreen()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: lightBrownColor,
            ),
            title: Text(
              'About Us',
              style: TextStyle(color: blackColor, fontFamily: 'inter'),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutPage()));
            },
          ),
          // Toggles
          ListTile(
            leading: Icon(
              Icons.location_on,
              color: lightBrownColor,
            ),
            title: Text(
              'Location',
              style: TextStyle(color: blackColor, fontFamily: 'inter'),
            ),
            trailing: Switch(value: true, onChanged: (value) {}),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: lightBrownColor,
            ),
            title: Text(
              'Notifications',
              style: TextStyle(color: blackColor, fontFamily: 'inter'),
            ),
            trailing: Switch(value: false, onChanged: (value) {}),
          ),
          ListTile(
            leading: Icon(
              Icons.update,
              color: lightBrownColor,
            ),
            title: Text(
              'Updates',
              style: TextStyle(color: blackColor, fontFamily: 'inter'),
            ),
            trailing: Switch(value: true, onChanged: (value) {}),
          ),
          // Log out button
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: lightBrownColor,
            ),
            title: Text(
              'Log Out',
              style: TextStyle(color: blackColor, fontFamily: 'inter'),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

//------------------------------------------------------------------------------------------------------------------------
//offer widget class -----------------------------------------------------------------------------------------------------------
class OfferWidget extends StatelessWidget {
  final String proID;
  final double width;
  final double height;
  const OfferWidget(
      {required this.proID,
      required this.width,
      required this.height,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        width: width,
        height: height / 5,
        decoration: BoxDecoration(
            color: darkBrownColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("it's coffe time",
                      style: TextStyle(
                          color: whiteColor,
                          fontFamily: 'inter',
                          fontSize: 16)),
                  Text('Buy one, Get one',
                      style: TextStyle(
                          color: whiteColor,
                          fontFamily: 'inter',
                          fontSize: 20)),
                  Text('for free',
                      style: TextStyle(
                          color: whiteColor,
                          fontFamily: 'inter',
                          fontSize: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      print(proID);
                    },
                    child: Container(
                      width: 120,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: lightBrownColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                            fontFamily: 'inter',
                            fontSize: 16,
                            color: whiteColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
          bottom: 15,
          right: 0,
          child: Image.asset(
            'images/cup1.png',
            scale: 0.85,
          ))
    ]);
  }
}

//filter widget class -----------------------------------------------------------------------------------------------------------
class FilterWidget extends StatelessWidget {
  final String text;
  final bool isPressed;
  final VoidCallback onTap;

  const FilterWidget({
    required this.text,
    required this.isPressed,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap, // Handle the tap event
        child: IntrinsicWidth(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isPressed ? lightBrownColor : whiteColor,
              boxShadow: isPressed
                  ? [
                      BoxShadow(
                          color: lightBrownColor,
                          blurRadius: 5,
                          offset: Offset(2, 2))
                    ]
                  : [],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isPressed ? whiteColor : grayColor,
                fontFamily: 'inter',
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//prodect card class -----------------------------------------------------------------------------------------------------------
class ProductCard extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String discription;
  final String price;
  final String image;
  final String category;
  const ProductCard({
    required this.width,
    required this.height,
    required this.title,
    required this.discription,
    required this.price,
    required this.image,
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 0, left: 8, bottom: 10),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          alignment: Alignment.bottomCenter,
          width: width / 2.3,
          height: height / 5,
          decoration: BoxDecoration(
              color: lightGrayColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: blackColor, fontSize: 16, fontFamily: 'inter'),
              ),
              Text(
                discription,
                style: TextStyle(
                    color: grayColor, fontSize: 14, fontFamily: 'inter'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductPage()));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: lightBrownColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: grayColor,
                            offset: Offset(2, 2),
                            blurRadius: 5),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 14,
                            fontFamily: 'inter'),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: whiteColor,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(top: 0, child: Image.asset(image))
      ]),
    );
  }
}

// -----------------------------------------------------------------------------------------------------------------------------
// best seller class -----------------------------------------------------------------------------------------------------------
class BestSeller extends StatelessWidget {
  final double width;
  const BestSeller({required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width,
        height: 100,
        decoration: BoxDecoration(
          color: lightGrayColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------------------------------------------------------
// class -----------------------------------------------------------------------------------------------------------
class functionedBTNS extends StatelessWidget {
  final Color color;
  final Icon icon;
  const functionedBTNS({required this.color, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: icon,
      ),
    );
  }
}

// -----------------------------------------------------------------------------------------------------------------------------
// class -----------------------------------------------------------------------------------------------------------
class ReservationCard extends StatelessWidget {
  final String date;
  final String time;
  final String tableNO;
  final String guestNO;
  final String place;
  final double width;
  final double height;
  const ReservationCard(
      {super.key,
      required this.date,
      required this.time,
      required this.tableNO,
      required this.guestNO,
      required this.place,
      required this.width,
      required this.height});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: width,
        height: height / 6,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: BorderDirectional(
                top: BorderSide(color: darkBrownColor, width: 2),
                bottom: BorderSide(color: darkBrownColor, width: 2),
                end: BorderSide(color: darkBrownColor, width: 2))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset(
            'images/place.png',
          ),
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Date',
                style: TextStyle(color: grayColor, fontFamily: 'inter'),
              ),
              Text(
                date,
                style: TextStyle(
                    color: blackColor,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Guests NO',
                style: TextStyle(color: grayColor, fontFamily: 'inter'),
              ),
              Text(
                guestNO,
                style: TextStyle(
                    color: blackColor,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                place,
                style: TextStyle(
                    color: blackColor,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Time',
                style: TextStyle(color: grayColor, fontFamily: 'inter'),
              ),
              Text(
                time,
                style: TextStyle(
                    color: blackColor,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Table NO',
                style: TextStyle(color: grayColor, fontFamily: 'inter'),
              ),
              Text(
                tableNO,
                style: TextStyle(
                    color: blackColor,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Edit',
                    style: TextStyle(
                        color: brownColor, fontFamily: 'inter', fontSize: 16),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_outline,
                      size: 30,
                      color: grayColor,
                    ))
              ],
            ),
          )
        ]));
  }
}

// -----------------------------------------------------------------------------------------------------------------------------
// perchase card class -----------------------------------------------------------------------------------------------------------
class PerchaseCard extends StatelessWidget {
  final String date;
  final String time;
  final String name;
  final String price;
  final double width;
  final double height;
  const PerchaseCard(
      {super.key,
      required this.date,
      required this.time,
      required this.name,
      required this.price,
      required this.width,
      required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height / 6.5,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: BorderDirectional(
                top: BorderSide(color: darkBrownColor, width: 2),
                bottom: BorderSide(color: darkBrownColor, width: 2),
                end: BorderSide(color: darkBrownColor, width: 2))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Image.asset(
                'images/cup1.png',
                scale: 1.3,
              ),
              SizedBox(
                width: width / 10,
              ),
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: darkBrownColor,
                        fontFamily: 'inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'inter'),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: width / 4,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: darkBrownColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: blackColor,
                                offset: Offset(2, 2),
                                blurRadius: 5)
                          ]),
                      child: Text(
                        'See More',
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 16,
                            fontFamily: 'inter'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      size: 30,
                      color: darkBrownColor,
                    )),
                IconButton(
                    onPressed: () {
                      showCustomPopup(context);
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      size: 30,
                      color: grayColor,
                    ))
              ],
            ),
          )
        ]));
  }
}

// -----------------------------------------------------------------------------------------------------------------------------
// perchased card class -----------------------------------------------------------------------------------------------------------
class PerchasedCard extends StatelessWidget {
  final String date;
  final String time;
  final String name;
  final String price;
  final String quantity;
  final double width;
  final double height;
  const PerchasedCard(
      {super.key,
      required this.date,
      required this.time,
      required this.name,
      required this.price,
      required this.quantity,
      required this.width,
      required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height / 7,
        decoration: BoxDecoration(
          color: lightGrayColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Image.asset(
                'images/cup1.png',
                scale: 1.3,
              ),
              SizedBox(
                width: width / 10,
              ),
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '$quantity X $name',
                    style: TextStyle(
                        color: darkBrownColor,
                        fontFamily: 'inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'inter'),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      size: 30,
                      color: darkBrownColor,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_outline,
                      size: 30,
                      color: grayColor,
                    ))
              ],
            ),
          )
        ]));
  }
}

// -----------------------------------------------------------------------------------------------------------------------------
// info card class -----------------------------------------------------------------------------------------------------------
class InfoCard extends StatelessWidget {
  final double width;
  final double height;
  final String data;
  const InfoCard(
      {super.key,
      required this.width,
      required this.height,
      required this.data});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Container(
          width: width,
          height: height / 15,
          decoration: BoxDecoration(
              color: lightGrayColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: grayColor, offset: Offset(2, 2), blurRadius: 10)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data,
                    style: TextStyle(
                        color: grayColor, fontFamily: 'inter', fontSize: 17),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: grayColor,
                        size: 25,
                      ))
                ]),
          )),
    );
  }
}
// -----------------------------------------------------------------------------------------------------------------------------
// rate widget class -----------------------------------------------------------------------------------------------------------

class RateWidget extends StatefulWidget {
  const RateWidget({super.key});

  @override
  _RateWidgetState createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
  int _currentRating = 0; // Holds the user's current rating

  void _onStarTap(int index) {
    setState(() {
      _currentRating = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () => _onStarTap(index + 1),
          icon: Icon(
            index < _currentRating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 30.0,
          ),
        );
      }),
    );
  }
}
// -----------------------------------------------------------------------------------------------------------------------------
// image slider class -----------------------------------------------------------------------------------------------------------

class ImageSliderScreen extends StatefulWidget {
  const ImageSliderScreen({super.key});

  @override
  _ImageSliderScreenState createState() => _ImageSliderScreenState();
}

class _ImageSliderScreenState extends State<ImageSliderScreen> {
  int _expandedIndex = -1;

  final List<Map<String, String>> _images = [
    {
      'image': 'images/manager.png',
      'title': 'Chef',
      'details': 'Specialist in Italian cuisine',
    },
    {
      'image': 'images/manager.png',
      'title': 'Cashier',
      'details': 'Ahmed Ali\n01234567891',
    },
    {
      'image': 'images/manager.png',
      'title': 'Services',
      'details': 'Barista and customer service',
    },
  ];

  void _toggleExpand(int index) {
    setState(() {
      _expandedIndex = _expandedIndex == index ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: SizedBox(
          height: 300, // Add a bounded height here
          child: PageView.builder(
            itemCount: _images.length,
            controller: PageController(viewportFraction: 0.7),
            itemBuilder: (context, index) {
              final isExpanded = _expandedIndex == index;
              return GestureDetector(
                onTap: () => _toggleExpand(index),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: isExpanded ? 300 : 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(_images[index]['image']!),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: grayColor,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: isExpanded
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black54,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _images[index]['title']!,
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'inter'),
                              ),
                              SizedBox(height: 10),
                              Text(
                                _images[index]['details']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 16,
                                    fontFamily: 'inter'),
                              ),
                            ],
                          ),
                        )
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------------------------------------------------------
// status class -----------------------------------------------------------------------------------------------------------
class StatusAvatar extends StatelessWidget {
  final String image;
  const StatusAvatar({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: darkBrownColor,
      child: Image.asset(image),
    );
  }
}

// -----------------------------------------------------------------------------------------------------------------------------
// post card class -----------------------------------------------------------------------------------------------------------
class PostCard extends StatelessWidget {
  final double width;
  final double height;
  const PostCard({required this.width, required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: customGrayColor, width: 0.7),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundColor: darkBrownColor,
                radius: 30,
                child: Image.asset('images/profile.png'),
              ),
              SizedBox(
                width: width / 25,
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
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '11/10/2024',
                      style: TextStyle(
                          color: grayColor,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width / 25,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: grayColor,
                  ))
            ],
          ),
          SizedBox(
            height: height / 50,
          ),
          Text(
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
            style: TextStyle(
                color: blackColor,
                fontFamily: 'inter',
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              height: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_rounded,
                        color: Colors.red,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      '500',
                      style: TextStyle(color: grayColor, fontFamily: 'inter'),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.comment_outlined,
                        color: customGrayColor,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      '500',
                      style: TextStyle(color: grayColor, fontFamily: 'inter'),
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send_outlined,
                    size: 25,
                    color: customGrayColor,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------------------------------------------------------
// people filters class -----------------------------------------------------------------------------------------------------------
class PeopleFilterWidget extends StatelessWidget {
  final String text;
  final bool isPressed;
  final VoidCallback onTap;

  const PeopleFilterWidget({
    required this.text,
    required this.isPressed,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap, // Handle the tap event
        child: IntrinsicWidth(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isPressed ? darkBrownColor : whiteColor,
              boxShadow: isPressed
                  ? [
                      BoxShadow(
                          color: customGrayColor,
                          blurRadius: 5,
                          offset: Offset(2, 2))
                    ]
                  : [],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isPressed ? whiteColor : grayColor,
                fontFamily: 'inter',
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------------------------------------------------------
// people card class -----------------------------------------------------------------------------------------------------------
class PeopleCard extends StatelessWidget {
  final String username;
  final String email;
  final double width;
  final double height;
  const PeopleCard(
      {required this.username,
      required this.email,
      required this.width,
      required this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height / 12,
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: darkBrownColor,
                radius: 30,
                child: Image.asset('images/profile.png'),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 16,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        color: grayColor,
                        fontSize: 14,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_add_outlined,
                size: 30,
                color: darkBrownColor,
              ))
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------------------------------------------------------
// request card class -----------------------------------------------------------------------------------------------------------
class RequestCard extends StatelessWidget {
  final String username;
  final String email;
  final double width;
  final double height;
  const RequestCard(
      {required this.username,
      required this.email,
      required this.width,
      required this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: customGrayColor, width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: width / 5,
                    child: Image.asset('images/manager.png'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              username,
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: 16,
                                  fontFamily: 'inter',
                                  fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'View Profile',
                                style: TextStyle(
                                    color: darkBrownColor,
                                    fontFamily: 'inter',
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          email,
                          style: TextStyle(
                              color: grayColor,
                              fontSize: 14,
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  width: width / 4.5,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: darkBrownColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontFamily: 'inter',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: width / 4.5,
                                  height: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: lightGrayColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                        color: grayColor,
                                        fontFamily: 'inter',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------------------------------------------------------
// people card class -----------------------------------------------------------------------------------------------------------
class FriendsCard extends StatelessWidget {
  final String username;
  final String email;
  final double width;
  final double height;
  const FriendsCard(
      {required this.username,
      required this.email,
      required this.width,
      required this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height / 12,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: darkBrownColor,
                radius: 30,
                child: Image.asset('images/profile.png'),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 16,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        color: grayColor,
                        fontSize: 14,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: width / 4.5,
              height: 35,
              decoration: BoxDecoration(
                  color: lightGrayColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Unfriend',
                style: TextStyle(
                    color: grayColor,
                    fontFamily: 'inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------------------------------------------------------
// order card class -----------------------------------------------------------------------------------------------------------
class OrderCard extends StatelessWidget {
  final String date;
  final String time;
  final String name;
  final String price;
  final String quantity;
  final String status;
  final double width;
  final double height;
  const OrderCard(
      {super.key,
      required this.date,
      required this.time,
      required this.name,
      required this.price,
      required this.status,
      required this.quantity,
      required this.width,
      required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height / 6.5,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: lightGrayColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: grayColor, offset: Offset(-1, 2), blurRadius: 10)
            ]),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Image.asset(
                'images/cup1.png',
                scale: 1.3,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '$quantity X $name',
                    style: TextStyle(
                        color: darkBrownColor,
                        fontFamily: 'inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'subtotal : $price',
                    style: TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'inter'),
                  ),
                  Text(
                    'taxis : $price',
                    style: TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'inter'),
                  ),
                  Text(
                    'total order : $price',
                    style: TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'inter'),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status,
                style: TextStyle(
                    color: status == 'Deliverd' ? Colors.green : Colors.red,
                    fontFamily: 'inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                date,
                style: TextStyle(
                    color: blackColor,
                    fontFamily: 'inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ]));
  }
}
