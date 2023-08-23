import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final String title;
  final List<Map<String, String>> subtitleData;

  DetailsCard({required this.title, required this.subtitleData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Rounded edges
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 20.0, // Main title font size
                  fontWeight: FontWeight.w400,
                  color: Colors.blueAccent
              ),
            ),
            SizedBox(height: 20.0), // Spacer between main title and subtitles
            for (var data in subtitleData)
              _buildSubtitle(data['subtitle']!, data['text']!),
          ],
        ),
      ),
    );
  }

  Widget _buildSubtitle(String subtitle, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 12.0, // Subtitle font size
            fontWeight: FontWeight.w200, // Subtitle font weight
          ),
        ),
        SizedBox(height: 8.0), // Spacer between subtitle and text
        Text(
          text,
          style: TextStyle(
            fontSize: 14.0, // Text font size
            fontWeight: FontWeight.bold,
            color: Color(0xFF04064d),
          ),
        ),
        SizedBox(height: 15.0),
      ],
    );
  }
}