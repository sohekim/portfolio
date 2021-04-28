import 'package:flutter/material.dart';
import 'package:my_portfolio/data/constants.dart';
import 'package:my_portfolio/widgets/bullet_points.dart';
import 'package:my_portfolio/widgets/round_border_text.dart';
import 'package:my_portfolio/widgets/title_body.dart';

Widget bridgeWidget(
  BuildContext context,
  double width,
) {
  bool isCollapsed = MediaQuery.of(context).size.width < 450 ? true : false;
  double minus = isCollapsed ? 0 : 150;

  return Wrap(
    spacing: 25,
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
                  'Google J-Term 24H final project - Serverless Android App for students to request or pick up orders from off-campus',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: roundBorderText('Github', accentColor, link: 'https://github.com/sohekim/FinalProject'),
              ),
              Container(
                width: width * ratio - minus,
                child: Wrap(spacing: width * 0.04, children: [
                  textColumn('Language', 'Java', context, width),
                  textColumn('Google Firebase', 'Google Firebase Realtime Database\nGoogle Firebase Authentication',
                      context, width),
                  textColumn('Tools', 'Android Studio\nGithub\nFigma', context, width),
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
              'Ahona Salsabil',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Features',
          Wrap(direction: Axis.vertical, spacing: 5, children: [
            bulletPoint(context, width, ratio, 'Sign up and log in with school email', isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio,
                'Register page for Getters who can pickup food to upload destination and arrival time',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Request page for students to send pickup request to Getters',
                isCollapsed: isCollapsed),
            Container(
              width: width * ratio - minus,
              child: Text(
                '\nSample UX flow for students to order pick up',
                style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 15),
              ),
            ),
            Image.asset('assets/bridge/11.png', width: isCollapsed ? width * ratio : width * ratio * 0.4),
            Container(
              width: width * ratio - minus,
              child: Text(
                '\nSample UX flow for getters to register trips and confirming requests from other students',
                style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 15),
              ),
            ),
            Image.asset('assets/bridge/22.png', width: isCollapsed ? width * ratio : width * ratio * 0.6),
          ]),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Implementation',
          Wrap(direction: Axis.vertical, spacing: 5, children: [
            bulletPoint(context, width, ratio, 'Conduct user research on how to improve life on campus',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Use figma to wireframe the basic UX flow', isCollapsed: isCollapsed),
            bulletPoint(
                context, width, ratio, 'Design database models and implement them using NoSql Google realtime database',
                isCollapsed: isCollapsed),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Image.asset(
                'assets/bridge/data.png',
                width: (width * ratio - minus) - 5,
              ),
            ),
            bulletPoint(context, width, ratio, 'Use Google Firebase Authentication for sign up and log in',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Prototype the app in less than 24 hours', isCollapsed: isCollapsed),
          ]),
          isCollapsed: isCollapsed),
    ],
  );
}
