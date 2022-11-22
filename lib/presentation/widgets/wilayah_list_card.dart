import 'package:flutter/material.dart';
import 'package:sicatu_app/common/constants.dart';

class WilayahListCard extends StatelessWidget {
  // const WilayahListCard({Key? key}) : super(key: key);
  IconData icon;
  String title;

  WilayahListCard({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: biruColor,
                ),
                SizedBox(
                  width: 14,
                ),
                Text(title, style: kSubtitle),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: biruColor,
            ),
          ],
        ),
      ),
    );
  }
}
