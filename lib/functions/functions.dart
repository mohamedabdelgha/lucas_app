import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lucas_app/widgets/colors.dart';

// delete reservation future -----------------------------------------------------------------------------------
Future<void> deleteReservation(String documentId, BuildContext context) async {
  try {
    await FirebaseFirestore.instance
        .collection('reservations') // Replace with your collection name
        .doc(documentId)
        .delete();
    print('Document with ID $documentId successfully deleted.');
// Check if the widget is mounted before using its context
    if (context.mounted) {
      _showSnackBar(
          Icons.check_circle, 'Your reservation has been canceled.', context);
    }
  } catch (e) {
    print('Error deleting document: $e');
  }
}

// delete cart item future -----------------------------------------------------------------------------------
Future<void> deleteCartItem(
    String documentId, String userid, BuildContext context) async {
  try {
    await FirebaseFirestore.instance
        .collection('users') // Replace with your collection name
        .doc(userid)
        .collection('cart')
        .doc(documentId)
        .delete();
    print('Document with ID $documentId successfully deleted.');
// Check if the widget is mounted before using its context
    if (context.mounted) {
      _showSnackBar(Icons.check_circle, 'Your item has been deleted.', context);
    }
  } catch (e) {
    print('Error deleting document: $e');
  }
}

// delete fav item future -----------------------------------------------------------------------------------
Future<void> deleteFavItem(
    String documentId, String userid, BuildContext context) async {
  try {
    await FirebaseFirestore.instance
        .collection('users') // Replace with your collection name
        .doc(userid)
        .collection('fav')
        .doc(documentId)
        .delete();
    print('Document with ID $documentId successfully deleted.');
// Check if the widget is mounted before using its context
    if (context.mounted) {
      _showSnackBar(Icons.check_circle, 'Your item has been deleted.', context);
    }
  } catch (e) {
    print('Error deleting document: $e');
  }
}
// ------------------------------------------------------------------------------------------------------------

void _showSnackBar(IconData icon, String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(icon, color: whiteColor),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: whiteColor, fontSize: 16),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      showCloseIcon: true,
      closeIconColor: whiteColor,
      margin: EdgeInsets.all(5),
      // duration: Duration(seconds: 5),
      elevation: 1,
      backgroundColor: lightBrownColor,
    ),
  );
}

// ------------------------------------------------------------------------------------------------------------
void showActionDialog(BuildContext context, String title, String message,
    VoidCallback onPressed, String buttonTitle) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      backgroundColor: lightGrayColor,
      title: Text(
        title,
        style: TextStyle(
            color: darkBrownColor,
            fontFamily: 'inter',
            fontSize: 18,
            fontWeight: FontWeight.w700),
      ),
      content: Text(
        message,
        style: TextStyle(
            color: darkBrownColor,
            fontFamily: 'inter',
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
      actions: [
        TextButton(
          onPressed: () {
            onPressed(); // Execute the callback
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text(
            buttonTitle,
            style: TextStyle(fontFamily: 'inter'),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(fontFamily: 'inter'),
          ),
        ),
      ],
    ),
  );
}

// ------------------------------------------------------------------------------------------------------------
Future<bool> isProductInFavorites(String userId, String proID) async {
  try {
    // Get a reference to the `fav` collection inside the user's document
    final favCollection = FirebaseFirestore.instance
        .collection('users') // Access the users collection
        .doc(userId) // Access the specific user document
        .collection('fav'); // Access the fav subcollection

    // Query the collection to see if a document with the given proID exists
    final querySnapshot =
        await favCollection.where('proID', isEqualTo: proID).get();

    // Check if any documents are returned
    return querySnapshot.docs.isNotEmpty;
  } catch (e) {
    print('Error checking product in favorites: $e');
    return false;
  }
}

// ------------------------------------------------------------------------------------------------------------
