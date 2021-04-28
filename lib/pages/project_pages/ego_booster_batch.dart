import 'package:flutter/material.dart';
import 'package:my_portfolio/data/constants.dart';
import 'package:my_portfolio/widgets/bullet_points.dart';
import 'package:my_portfolio/widgets/round_border_text.dart';
import 'package:my_portfolio/widgets/title_body.dart';

Widget egoBoosterBatchWidget(
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
                  'Ego Booster batch service to send weekly Ego Booster emails to subscribers',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: roundBorderText('Github', accentColor, link: 'https://github.com/sohekim/egobooster-subscription'),
              ),
              Container(
                width: width * ratio - minus,
                child: Wrap(spacing: width * 0.04, children: [
                  textColumn('Framework', 'Spring Boot Batch\nSpring Boot Mail', context, width),
                  textColumn('Deployment', 'Jenkins\nAWS EC2\nAWS RDS', context, width),
                  textColumn('Database', 'MySQL', context, width),
                  textColumn('Others', 'Google SMTP', context, width),
                ]),
              ),
            ],
          ),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Features',
          Wrap(direction: Axis.vertical, children: [
            bulletPoint(
                context, width, ratio, "Send weekly Ego Booster emails to Subscribers by using Ego Booster APIs\n",
                isCollapsed: isCollapsed),
            Image.asset(
              'assets/egobooster-batch/both.png',
              width: width * ratio - minus,
            ),
          ]),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Implementation',
          Wrap(direction: Axis.vertical, spacing: 5, children: [
            bulletPoint(context, width, ratio,
                "Use Spring Rest Template to call Ego Booster APIs to get Ego Booster Quotes, subscribers' emails, and batch history",
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, "Design the logo and layout of the email message",
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, "Use Java Mail Sender And Google SMTP server to send emails",
                isCollapsed: isCollapsed),
            Text(
              '\nDeployment',
              style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 15),
            ),
            bulletPoint(
                context, width, ratio, 'Integerate Jenkins with AWS EC2 Instance responsible for subscription service',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Set up Jenkins pipeline and add scheduled subscription email job',
                isCollapsed: isCollapsed),
          ]),
          isCollapsed: isCollapsed),
    ],
  );
}
