import 'package:flutter/material.dart';
import 'package:lucas_app/widgets/colors.dart';

class ConfirmPage extends StatelessWidget {
  final String time;
  final String date;
  final String cuname;
  final String cunumber;
  final String guestNo;
  final String tableNo;
  final String place;

  const ConfirmPage({
    super.key,
    required this.time,
    required this.date,
    required this.cuname,
    required this.cunumber,
    required this.guestNo,
    required this.tableNo,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            // Background decorations
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
            // Content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 180,
                  height: 180,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: darkBrownColor),
                  child: Icon(
                    Icons.check,
                    size: width / 3,
                    color: whiteColor,
                  ),
                ),
                Text(
                  'Reservation Confirmation',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: darkBrownColor,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDetailRow('Name:', cuname),
                        buildDetailRow('Date:', date),
                        buildDetailRow('Guests:', guestNo),
                        buildDetailRow('Place:', place),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDetailRow('Contact Number:', cunumber),
                        buildDetailRow('Time:', time),
                        buildDetailRow('Table Number:', tableNo),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      width: width,
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          color: darkBrownColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        'Done',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build each row of details
  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: grayColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
