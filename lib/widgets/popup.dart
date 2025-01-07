import 'package:flutter/material.dart';
import 'package:lucas_app/widgets/colors.dart';

void showCustomPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true, // Dismiss on tap outside
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: whiteColor,
        child: CustomPopupContent(),
      );
    },
  );
}

class CustomPopupContent extends StatelessWidget {
  const CustomPopupContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Delete Item',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'inter',
                color: darkBrownColor),
          ),
          SizedBox(height: 20),
          Text(
            'Do you wanna remove this item',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'inter',
                color: darkBrownColor),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the popup
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the popup
                },
                child: Text('Delete'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
