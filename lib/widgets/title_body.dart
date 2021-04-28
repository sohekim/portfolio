import 'package:flutter/material.dart';
import 'package:my_portfolio/data/constants.dart';

Widget titleAndBody(BuildContext context, double width, String title, Widget body, {bool isCollapsed = false}) {
  double minus = isCollapsed ? 0 : 150;
  return Container(
    width: width * ratio,
    child: Wrap(direction: isCollapsed ? Axis.vertical : Axis.horizontal, children: [
      Container(
        width: 150,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      Container(width: width * ratio - minus, child: body),
    ]),
  );
}

Widget textColumn(String title, String body, BuildContext context, double width) {
  return Wrap(
    direction: Axis.vertical,
    alignment: WrapAlignment.start,
    crossAxisAlignment: WrapCrossAlignment.start,
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 15),
      ),
      SizedBox(height: 5),
      Text(body, style: Theme.of(context).textTheme.headline4)
    ],
  );
}
