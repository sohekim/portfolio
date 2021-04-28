import 'package:flutter/material.dart';
import 'package:my_portfolio/data/constants.dart';
import 'package:my_portfolio/widgets/bullet_points.dart';
import 'package:my_portfolio/widgets/round_border_text.dart';
import 'package:my_portfolio/widgets/title_body.dart';

Widget vsCodeWebsiteWidget(
  BuildContext context,
  double width,
) {
  bool isCollapsed = MediaQuery.of(context).size.width < 450 ? true : false;
  double minus = isCollapsed ? 0 : 150;
  double photoMinus = isCollapsed ? 0 : 350;

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
                  'VS Code Inspired Portfolio Website Prototype',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Container(
                width: width * ratio - minus,
                child: Wrap(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: roundBorderText('Github', accentColor, link: 'https://github.com/sohekim/vscode-portfolio'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: roundBorderText(
                        'Medium Post : VS Code inspired Custom Tab Bar and Navigation Bar', accentColor,
                        link:
                            'https://kim66s.medium.com/flutter-web-portfolio-vs-code-inspired-custom-tab-bar-and-navigation-bar-1-2-a5c626dd87bf'),
                  ),
                ]),
              ),
              Container(
                width: width * ratio - minus,
                child: Wrap(spacing: width * 0.04, children: [
                  textColumn('SDK', 'Flutter', context, width),
                  textColumn('Language', 'Dart', context, width),
                  textColumn('Tools', 'Github', context, width),
                ]),
              ),
            ],
          ),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Features',
          Wrap(direction: Axis.vertical, spacing: 5, children: [
            bulletPoint(context, width, ratio, "Clone VSCode style layout using Flutter Web app",
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Open and show file content when selected on vertical navigation bar',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Use tab bar to open, close, and show file content on the main screen',
                isCollapsed: isCollapsed),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset('assets/vscode/v1.png', width: (width * ratio - photoMinus)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset('assets/vscode/v2.png', width: (width * ratio - photoMinus)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset('assets/vscode/v3.png', width: (width * ratio - photoMinus)),
            )
          ]),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Implementation',
          Wrap(direction: Axis.vertical, spacing: 5, children: [
            bulletPoint(
                context, width, ratio, 'Implement a syncronous custom tab bar and navigation menu bar from scratch',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Use provider pattern to manage the state of tab data',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio,
                'Once the tab or the file from the navigation bar is selected, the provider notifies all listeners and updates the UI',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio,
                'Add animation when the website is loaded for the folder container to show from the top',
                isCollapsed: isCollapsed),
          ]),
          isCollapsed: isCollapsed),
    ],
  );
}
