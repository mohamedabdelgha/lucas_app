import 'package:flutter/material.dart';
import 'package:lucas_app/widgets/colors.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with TickerProviderStateMixin {
  double sliderValue = 0.0;
  int proquantity = 1;
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
            alignment: Alignment.bottomCenter,
            width: Width,
            height: Height / 1.35,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(100))),
            child: Stack(children: [
              Positioned(
                  top: -50,
                  right: 0,
                  child: Image.asset(
                    'images/decorationImg.png',
                    scale: 1.2,
                  )),
              Positioned(
                  bottom: -50,
                  left: 0,
                  child: Image.asset(
                    'images/backgroundImg.png',
                    scale: 1.1,
                  )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Height / 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: darkBrownColor, width: 2),
                              borderRadius: BorderRadius.circular(100),
                              color: sliderValue == 0.0
                                  ? darkBrownColor
                                  : Colors.transparent),
                          child: Text(
                            'S',
                            style: TextStyle(
                                fontFamily: 'inter',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: sliderValue == 0.0
                                    ? whiteColor
                                    : darkBrownColor),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: darkBrownColor, width: 2),
                              borderRadius: BorderRadius.circular(100),
                              color: sliderValue == 1.0
                                  ? darkBrownColor
                                  : Colors.transparent),
                          child: Text(
                            'M',
                            style: TextStyle(
                                fontFamily: 'inter',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: sliderValue == 1.0
                                    ? whiteColor
                                    : darkBrownColor),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: darkBrownColor, width: 2),
                              borderRadius: BorderRadius.circular(100),
                              color: sliderValue == 2.0
                                  ? darkBrownColor
                                  : Colors.transparent),
                          child: Text(
                            'L',
                            style: TextStyle(
                                fontFamily: 'inter',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: sliderValue == 2.0
                                    ? whiteColor
                                    : darkBrownColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cappuccino',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: darkBrownColor,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              color: lightBrownColor,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black87,
                                    offset: Offset(2, 2),
                                    blurRadius: 10)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (proquantity > 1) proquantity--;
                                  });
                                },
                                icon: Icon(Icons.remove),
                                color: whiteColor,
                              ),
                              Text('$proquantity',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: whiteColor,
                                      fontFamily: 'inter')),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    proquantity++;
                                  });
                                },
                                icon: Icon(Icons.add),
                                color: whiteColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Roasting',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                        Slider(
                          value: sliderValue,
                          label: sliderValue == 1.0
                              ? 'small'
                              : sliderValue == 2.0
                                  ? 'medium'
                                  : 'none',
                          min: 0.0,
                          max: 2.0,
                          divisions: 2,
                          activeColor:
                              darkBrownColor, // Replace with darkBrownColor
                          inactiveColor:
                              lightBrownColor, // Replace with lightBrownColor
                          onChanged: (value) {
                            setState(() {
                              sliderValue = value;
                            });
                            print(
                                'Slider Value: $sliderValue'); // Print the current value
                          },
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Ingradients',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Ingradients(
                              label: 'espresso',
                            ),
                            Ingradients(
                              label: 'Milk',
                            ),
                            Ingradients(
                              label: 'Sugar',
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'This Special coffee Flavor you can find it only in lucas',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: darkBrownColor,
                            fontFamily: 'inter',
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: darkBrownColor, width: 2.5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Price: ',
                                style: TextStyle(
                                    fontFamily: 'inter',
                                    fontSize: 16.0,
                                    color: blackColor),
                              ),
                              Text(
                                sliderValue == 0
                                    ? '${proquantity * 0 * 80} LE'
                                    : sliderValue == 1.0
                                        ? '${proquantity * 100} LE'
                                        : '${proquantity * 120} LE',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                    fontFamily: 'inter'),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkBrownColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 12.0),
                            ),
                            child: Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Add To Cart',
                                  style: TextStyle(
                                      fontFamily: 'inter',
                                      fontSize: 16.0,
                                      color: Colors.white),
                                ),
                                Icon(
                                  Icons.add_circle,
                                  color: whiteColor,
                                  size: 50,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        Positioned(
          top: Height / 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              'images/cup2.png', // Replace with your image path
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: 30,
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
            top: 30,
            right: 10,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back
                },
                icon: Icon(
                  Icons.favorite_outline,
                  color: whiteColor,
                  size: 30,
                ))),
      ]),
    );
  }
}

class Ingradients extends StatelessWidget {
  final String label;
  // final bool selected;

  const Ingradients({
    super.key,
    required this.label,
    // required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            width: 2,
            color: darkBrownColor,
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 4.0),
            Text(
              label,
              style: TextStyle(fontSize: 16.0, color: darkBrownColor),
            ),
          ],
        ),
      ),
    );
  }
}
