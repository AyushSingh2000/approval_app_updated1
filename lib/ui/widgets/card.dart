import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/ui/colors/app_colors.dart';

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
      margin: EdgeInsets.zero,
      color: AppColors.appgrey,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // border: Border.all(
                //   color: Colors.blueAccent,
                //   width: 2.0,
                // ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(2.0),
                child: Icon(
                  CupertinoIcons.person_alt_circle_fill,
                  size: 45,
                  color: AppColors.appbarmainblue,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              // Use Expanded to make the column take available space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cardName,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    cardCode,
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    groupName,
                    style: const TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
