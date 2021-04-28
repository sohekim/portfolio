import 'package:flutter/material.dart';
import 'package:my_portfolio/data/constants.dart';
import 'package:my_portfolio/widgets/bullet_points.dart';
import 'package:my_portfolio/widgets/round_border_text.dart';
import 'package:my_portfolio/widgets/title_body.dart';

Widget flutterPortfolioWidget(
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
          Wrap(spacing: 15, direction: Axis.vertical, children: [
            Container(
              width: width * ratio - minus,
              child: Text(
                'Responsive personal portfolio web app to present relevant experiences and showcase projects',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Container(
              width: width * ratio - minus,
              child: Wrap(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: roundBorderText('Github', accentColor, link: 'https://github.com/sohekim/sohekim.github.io'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: roundBorderText('Medium Post : Flutter Web Deployment', accentColor,
                      link:
                          'https://blog.usejournal.com/beginners-guide-to-flutter-web-set-up-to-deployment-39c967d7dfae'),
                ),
              ]),
            ),
            Container(
              width: width * ratio - minus,
              child: Wrap(spacing: width * 0.04, children: [
                textColumn('SDK', 'Flutter', context, width),
                textColumn('Language', 'Dart', context, width),
                textColumn('Tools', 'Github\nGithub Pages', context, width),
              ]),
            ),
          ]),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Features',
          Wrap(direction: Axis.vertical, spacing: 5, children: [
            bulletPoint(context, width, ratio, 'Introduction', isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, "Showcase projects with each project's detail page", isCollapsed: isCollapsed),
          ]),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Implementation',
          Wrap(direction: Axis.vertical, spacing: 5, children: [
            bulletPoint(context, width, ratio, 'Design and implement simple and clean layout for front end',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Build the web app using Flutter', isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Use Provider pattern for widget state management',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio,
                'Make the web app responsive by adjusting the size of the content according to the screen size',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Deploy using Github Page', isCollapsed: isCollapsed)
          ]),
          isCollapsed: isCollapsed)
    ],
  );
}
