import 'package:flutter/material.dart';
import 'package:my_portfolio/data/constants.dart';
import 'package:my_portfolio/widgets/bullet_points.dart';
import 'package:my_portfolio/widgets/round_border_text.dart';
import 'package:my_portfolio/widgets/title_body.dart';

Widget moimWidget(
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
            direction: Axis.vertical,
            spacing: 15,
            children: [
              Container(
                width: width * ratio - minus,
                child: Text(
                  '**Under Construction** Startup building a serverless cross-platform flutter app for college students',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Container(
                width: width * ratio - minus,
                child: Wrap(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: roundBorderText('Github', accentColor, link: 'https://github.com/nossu3751/moim'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: roundBorderText('Figma', accentColor,
                        link: 'https://www.figma.com/file/zInrUelzVQQEfLmU7gy8pd/Ingunn?node-id=0%3A1'),
                  )
                ]),
              ),
              Container(
                width: width * ratio - minus,
                child: Wrap(spacing: width * 0.04, children: [
                  textColumn('SDK', 'Flutter', context, width),
                  textColumn('Language', 'Dart', context, width),
                  textColumn('Tools', 'Google Firebase Authentication\nGoogle Firestore Database\nFigma\nGithub',
                      context, width),
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
              'Youbin Ahn, Nosung Ryu, Jungkyu Lee, Seho Kim',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Features',
          Wrap(direction: Axis.vertical, spacing: 5, children: [
            bulletPoint(context, width, ratio, "Log in and Sign up using user's school email",
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, "Task management service by user's adding and removing completed task",
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, "Course schedule maker to find, add, and remove user's courses",
                isCollapsed: isCollapsed),
            bulletPoint(
                context, width, ratio, "Feed page for user's to post questions and get answered by other students",
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, "GPA Calculator based on the user's courses and grades",
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Live chat service between users', isCollapsed: isCollapsed),
          ]),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Implementation',
          Wrap(direction: Axis.vertical, spacing: 5, children: [
            bulletPoint(context, width, ratio, 'Recruit four college students as co-founders',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio,
                'Conduct user research with college students from 10+ colleges on what app do college students need',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Use figma to wireframe the basic UX flow', isCollapsed: isCollapsed),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Image.asset(
                'assets/moim/figma.png',
                width: width * ratio - minus,
              ),
            ),
            bulletPoint(context, width, ratio, 'Use Google Firebase Authentication for sign up and log in',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Design database models and implement them using NoSql Google firestore',
                isCollapsed: isCollapsed),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Image.asset(
                'assets/moim/m-db1.png',
                width: width * ratio - minus,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Image.asset(
                'assets/moim/m-db2.png',
                width: width * ratio - minus,
              ),
            ),
          ]),
          isCollapsed: isCollapsed)
    ],
  );
}
