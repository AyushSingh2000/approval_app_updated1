import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/ui/colors/app_colors.dart';

class DetailsCard extends StatelessWidget {
  final String title;
  final List<Map<String, String>> subtitleData;

  DetailsCard({required this.title, required this.subtitleData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.appgrey,
      elevation: 1,
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
              style: const TextStyle(
                  fontSize: 20.0, // Main title font size
                  fontWeight: FontWeight.w500,
                  color: AppColors.appbarmainblue),
            ),
            const SizedBox(
                height: 20.0), // Spacer between main title and subtitles
            for (var data in subtitleData)
              _buildSubtitle(data['subtitle']!, data['text']!),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.arrow_down_circle_fill,
                  color: AppColors.appbarmainblue,
                )
              ],
            )
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
          style: const TextStyle(
            fontSize: 12.0, // Subtitle font size
            fontWeight: FontWeight.w200, // Subtitle font weight
          ),
        ),
        const SizedBox(height: 8.0), // Spacer between subtitle and text
        Text(
          text,
          style: const TextStyle(
            fontSize: 14.0, // Text font size
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 20, 85),
          ),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}
