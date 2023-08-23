import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String cardName;
  final String cardCode;
  final String groupName;

  ProfileCard({
    required this.cardName,
    required this.cardCode,
    required this.groupName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor:
                  Colors.white, // Set the background color of the circle avatar
              radius: 30,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors
                        .blueAccent, // Set the border color to blue accent
                    width: 2.0, // Set the border width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.person_2_outlined, // Use the provided profile icon
                    size: 40, // Adjust the icon size as needed
                    color:
                        Colors.blueAccent, // Set the icon color to blue accent
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  cardName,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  cardCode,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 8.0),
                Text(
                  groupName,
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
