import 'package:flutter/material.dart';
import 'package:my_portfolio/data/constants.dart';
import 'package:my_portfolio/widgets/title_body.dart';

Widget breastCancetImageWidget(
  BuildContext context,
  double width,
) {
  bool isCollapsed = MediaQuery.of(context).size.width < 450 ? true : false;
  double minus = isCollapsed ? 0 : 150;

  return Wrap(
    spacing: 30,
    direction: Axis.vertical,
    children: [
      titleAndBody(
          context,
          width,
          'Overview',
          Wrap(
            spacing: 15,
            direction: Axis.vertical,
            children: [
              Container(
                width: width * ratio - minus,
                child: Text(
                  'CS 305 : Machine Learning Final Project - Classification of Breast Tumor Histopathological Images Using Transfer Learning',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Container(
                width: width * ratio - minus,
                child: Wrap(spacing: width * 0.04, children: [
                  textColumn('Language', 'Python', context, width),
                  textColumn('Library', 'Tensor Flow', context, width),
                  textColumn('Tools', 'Jupiter Notebook', context, width),
                ]),
              ),
            ],
          ),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Team',
          Container(
            width: width * ratio - minus,
            child: Text(
              'Phatnari Akkharakamonsit, Nguyen Nguyen',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Result',
          Wrap(direction: Axis.horizontal, children: [
            Image.asset(
              'assets/breast/1.png',
              width: (width * ratio - minus) / 2 - 5,
            ),
            Image.asset(
              'assets/breast/2.png',
              width: (width * ratio - minus) / 2 - 5,
            ),
            Image.asset(
              'assets/breast/3.png',
              width: (width * ratio - minus) / 2 - 5,
            ),
            Image.asset(
              'assets/breast/4.png',
              width: (width * ratio - minus) / 2 - 5,
            ),
            Image.asset(
              'assets/breast/5.png',
              width: (width * ratio - minus) / 2 - 5,
            ),
            Image.asset(
              'assets/breast/6.png',
              width: (width * ratio - minus) / 2 - 5,
            ),
            Image.asset(
              'assets/breast/7.png',
              width: (width * ratio - minus) / 2 - 5,
            ),
            Image.asset(
              'assets/breast/8.png',
              width: (width * ratio - minus) / 2 - 5,
            ),
            Image.asset(
              'assets/breast/9.png',
              width: (width * ratio - minus) / 2 - 5,
            )
          ]),
          isCollapsed: isCollapsed)
    ],
  );
}
