import 'package:flutter/material.dart';
import 'package:sicatu_app/common/constants.dart';

class SearchEmpty extends StatelessWidget {
  // const SearchEmpty({Key? key}) : super(key: key);

  IconData icon;
  String title;
  String subtitle;

  SearchEmpty({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: biruColor,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              title,
              style: ktittle,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              subtitle,
              style: kdescription14hitam,
            ),
          ],
        ),
      ),
    );
  }
}
