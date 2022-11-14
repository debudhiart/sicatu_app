import 'package:flutter/material.dart';

import '../../common/constants.dart';

class SearchLoading extends StatelessWidget {
  // const SearchLoading({Key? key}) : super(key: key);

  String title;
  String subtitle;

  SearchLoading({
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
            CircularProgressIndicator(),
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
