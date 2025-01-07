import 'package:flutter/material.dart';
import 'package:lucas_app/pages/confirm.dart';
import 'package:lucas_app/widgets/colors.dart';
import 'package:lucas_app/widgets/constants.dart';

class ReservePage extends StatelessWidget {
  const ReservePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReservationScreen(),
      backgroundColor: whiteColor,
    );
  }
}

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  // late AnimationController _controller;
  // late Animation<Offset> _animation;
  // late Animation<Offset> _animation1;
  String location = 'Indoors';
  int guests = 2;

  // Date and time selection
  DateTime selectedDate = DateTime.now();
  int selectedHour = 6;
  int selectedMinute = 15;
  String selectedPeriod = 'PM';

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(
    //   duration: const Duration(seconds: 1),
    //   vsync: this,
    // );
    // _animation = Tween<Offset>(
    //   begin: Offset(-1, 0), // Starts off-screen (bottom)
    //   end: Offset(0, 0), // Ends at its original position
    // ).animate(CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeInOut,
    // ));
    // _animation1 = Tween<Offset>(
    //   begin: Offset(1, 1), // Starts off-screen (bottom)
    //   end: Offset(0.3, 1), // Ends at its original position
    // ).animate(CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeInOut,
    // ));

    // // Start the animation
    // _controller.forward();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: whiteColor,
            body: SizedBox(
              width: Width,
              height: Height,
              child: Stack(children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Image.asset('images/backgroundImg.png'),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset('images/decorationImg.png'),
                ),
                Column(children: [
                  TabBar(
                    controller: _tabController,
                    indicatorColor: darkBrownColor,
                    labelColor: darkBrownColor,
                    unselectedLabelColor: grayColor,
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'inter',
                        fontSize: 16),
                    tabs: [
                      Tab(text: 'Reservation'),
                      Tab(text: 'My Reservation'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Page 1: Reservation
                        buildReservationPage(),
                        // Page 2: My Reservation
                        buildMyReservationPage(),
                      ],
                    ),
                  )
                ]),
              ]),
            )));
  }

  Widget buildReservationPage() {
    final Width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // Guests Section
          buildGuestsSection(),
          SizedBox(height: 20),

          // Date & Time Section
          Text('Date & Time',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'inter')),
          SizedBox(height: 12),
          buildDatePicker(),
          SizedBox(height: 20),
          buildTimePicker(),
          SizedBox(height: 30),

          // Continue Button
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: darkBrownColor, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                width: Width / 2.5,
                height: 50,
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'inter',
                      color: darkBrownColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              onTap: _onContinuePressed,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: darkBrownColor,
                    borderRadius: BorderRadius.circular(10)),
                width: Width / 2.5,
                height: 50,
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

// guest section widget ----------------------------------------------------------------------------------
  Widget buildGuestsSection() {
    final Width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: lightGrayColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(children: [
              CircleAvatar(
                radius: 25,
                backgroundImage:
                    AssetImage('images/profile.png'), // Profile image
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rahma Salem',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                          fontFamily: 'inter'),
                    ),
                    Text(
                      '012345678911',
                      style: TextStyle(color: grayColor, fontFamily: 'inter'),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: darkBrownColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.edit,
                    color: whiteColor,
                    size: 30,
                  ),
                ),
              ),
            ])),
        SizedBox(height: 20),
        // Guests Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Guests',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'inter'),
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (guests > 2) guests--;
                });
              },
              child: functionedBTNS(
                color: Color.fromARGB(255, 214, 213, 213),
                icon: Icon(
                  Icons.remove,
                  color: blackColor,
                  size: 20,
                ),
              ),
            ),
            Container(
              width: Width / 2,
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: lightGrayColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                '$guests',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'inter',
                    color: blackColor),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  guests++;
                });
              },
              child: functionedBTNS(
                color: darkBrownColor,
                icon: Icon(
                  Icons.add,
                  color: whiteColor,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: Text('Indoors',
                    style: TextStyle(fontFamily: 'inter', fontSize: 16)),
                value: 'Indoors',
                groupValue: location,
                activeColor: darkBrownColor,
                onChanged: (value) {
                  setState(() => location = value!);
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: Text('Outdoors',
                    style: TextStyle(fontFamily: 'inter', fontSize: 16)),
                value: 'Outdoors',
                groupValue: location,
                activeColor: darkBrownColor,
                onChanged: (value) {
                  setState(() => location = value!);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
// date & time section widget ----------------------------------------------------------------------------------

  Widget buildDatePicker() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: lightGrayColor, borderRadius: BorderRadius.circular(10)),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: 31,
        itemBuilder: (context, index) {
          int day = index + 1;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDate =
                    DateTime(selectedDate.year, selectedDate.month, day);
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:
                    day == selectedDate.day ? darkBrownColor : lightGrayColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('$day',
                  style: TextStyle(
                      color: day == selectedDate.day ? whiteColor : blackColor,
                      fontFamily: 'inter',
                      fontSize: 16)),
            ),
          );
        },
      ),
    );
  }

  Widget buildTimePicker() {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;
    return Container(
      width: Width,
      height: Height / 15,
      decoration: BoxDecoration(
          color: lightGrayColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildPicker(1, 12, selectedHour, (val) => selectedHour = val),
          Text(':',
              style: TextStyle(
                  fontSize: 25, fontFamily: 'inter', color: blackColor)),
          buildPicker(0, 59, selectedMinute, (val) => selectedMinute = val),
          buildAmPmPicker(),
        ],
      ),
    );
  }

  Widget buildPicker(int min, int max, int value, ValueChanged<int> onChange) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: lightGrayColor,
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 40,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) => setState(() => onChange(index + min)),
        childDelegate: ListWheelChildLoopingListDelegate(
          children: List.generate(
            max - min + 1,
            (index) => Center(
                child: Text('${index + min}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: index + min == value ? blackColor : grayColor))),
          ),
        ),
      ),
    );
  }

  Widget buildAmPmPicker() {
    return Container(
      height: 100,
      width: 60,
      decoration: BoxDecoration(
        color: lightGrayColor,
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 40,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          setState(() => selectedPeriod = index == 0 ? 'AM' : 'PM');
        },
        childDelegate: ListWheelChildLoopingListDelegate(
          children: ['AM', 'PM']
              .map((e) => Center(
                  child: Text(e,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:
                              e == selectedPeriod ? blackColor : grayColor))))
              .toList(),
        ),
      ),
    );
  }

  void _onContinuePressed() {
    String formattedDate =
        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
    String formattedTime = "$selectedHour:$selectedMinute $selectedPeriod";

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ConfirmPage(
                time: formattedTime,
                date: formattedDate,
                cuname: 'mohamed',
                cunumber: '0100153650',
                guestNo: '5',
                tableNo: '4',
                place: 'Indoors')));
  }

// my reservations widget -------------------------------------------------------------------------------------
  Widget buildMyReservationPage() {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SearchInput(),
          // reservations card
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ReservationCard(
                date: '16/4/2024',
                time: '5:10 PM',
                tableNO: '4',
                guestNO: '6',
                place: 'Indoors',
                width: Width,
                height: Height),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ReservationCard(
                date: '16/4/2024',
                time: '5:10 PM',
                tableNO: '4',
                guestNO: '6',
                place: 'Indoors',
                width: Width,
                height: Height),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ReservationCard(
                date: '16/4/2024',
                time: '5:10 PM',
                tableNO: '4',
                guestNO: '6',
                place: 'Indoors',
                width: Width,
                height: Height),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ReservationCard(
                date: '16/4/2024',
                time: '5:10 PM',
                tableNO: '4',
                guestNO: '6',
                place: 'Indoors',
                width: Width,
                height: Height),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ReservationCard(
                date: '16/4/2024',
                time: '5:10 PM',
                tableNO: '4',
                guestNO: '6',
                place: 'Indoors',
                width: Width,
                height: Height),
          ),
        ],
      ),
    );
  }
}
