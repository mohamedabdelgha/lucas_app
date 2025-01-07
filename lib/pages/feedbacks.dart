import 'package:flutter/material.dart';
import 'package:lucas_app/pages/feedback.dart';
import 'package:lucas_app/widgets/colors.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget buildRatingBar(int stars, double percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text('$stars'),
          SizedBox(width: 8),
          Icon(Icons.star, color: Colors.amber, size: 16),
          SizedBox(width: 8),
          Expanded(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  height: 10,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: grayColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width *
                        percentage *
                        _animation.value,
                    decoration: BoxDecoration(
                      color: darkBrownColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 8),
          Text('${(percentage * 100).toInt()}%'),
        ],
      ),
    );
  }

  Widget buildFeedbackCard(String name, String feedback, String daysAgo) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                      'images/profile.png'), // Replace with user image asset
                ),
                SizedBox(width: 12),
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text('$daysAgo days ago', style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: List.generate(5,
                  (index) => Icon(Icons.star, color: Colors.amber, size: 16)),
            ),
            SizedBox(height: 8),
            Text(feedback, style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text('Feedback',
            style: TextStyle(
                color: darkBrownColor,
                fontSize: 22,
                fontFamily: 'inter',
                fontWeight: FontWeight.w500)),
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: brownColor, size: 35),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: lightGrayColor, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text('4.5',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'inter')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              5,
                              (index) => Icon(Icons.star,
                                  color: Colors.amber, size: 24)),
                        ),
                        Text('based on 35 feedback',
                            style: TextStyle(
                                color: grayColor, fontFamily: 'inter')),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  buildRatingBar(5, 0.5),
                  buildRatingBar(4, 0.8),
                  buildRatingBar(3, 0.3),
                  buildRatingBar(2, 0.2),
                  buildRatingBar(1, 0.0),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  buildFeedbackCard(
                    'Rahma Salem',
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    '10',
                  ),
                  buildFeedbackCard(
                    'Rahma Salem',
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    '10',
                  ),
                  buildFeedbackCard(
                    'Rahma Salem',
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    '10',
                  ),
                  buildFeedbackCard(
                    'Rahma Salem',
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    '10',
                  ),
                  buildFeedbackCard(
                    'Rahma Salem',
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    '10',
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedbackPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: darkBrownColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              child: Center(
                child: Text('Leave Your Feedback',
                    style: TextStyle(
                        fontSize: 18, color: whiteColor, fontFamily: 'inter')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
