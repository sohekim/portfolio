import 'package:flutter/material.dart';

Widget bulletPoint(BuildContext context, double width, double ratio, String text, {bool isCollapsed = false}) {
  double minus = isCollapsed ? 0 : 150;
  return Wrap(
    direction: Axis.horizontal,
    children: [
      Text(
        '• ',
        style: Theme.of(context).textTheme.headline4,
      ),
      Container(
        width: width * ratio - minus,
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    ],
  );
}
