import 'package:flutter/material.dart';
import 'package:my_portfolio/data/constants.dart';
import 'package:my_portfolio/widgets/bullet_points.dart';
import 'package:my_portfolio/widgets/round_border_text.dart';
import 'package:my_portfolio/widgets/title_body.dart';

Widget egoBoosterWidget(
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
                  'API Server and Web Server to find, share, and subscribe Ego Boosting quotes',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Container(
                width: width * ratio - minus,
                child: Wrap(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: roundBorderText('egobooster.net', accentColor, link: 'http://egobooster.net/'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: roundBorderText('Github', accentColor, link: 'https://github.com/sohekim/egobooster'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: roundBorderText('API Swagger', accentColor,
                        link: "http://egobooster.net/swagger-ui/index.html#/"),
                  ),
                ]),
              ),
              Container(
                width: width * ratio - minus,
                child: Wrap(spacing: width * 0.04, children: [
                  textColumn('Framework', 'Spring Boot\nSpring Boot Data JPA\nSpring Boot Web', context, width),
                  textColumn('Deployment', 'AWS EC2\nAWS RDS\nAWS ElastiCache', context, width),
                  textColumn('Database', 'Spring Boot Data Redis\nMySQL', context, width),
                  textColumn('Others', 'Junit\nThymeleaf Template Engine\nSwagger', context, width),
                ]),
              ),
            ],
          ),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Features',
          Wrap(direction: Axis.vertical, spacing: 5, alignment: WrapAlignment.center, children: [
            bulletPoint(context, width, ratio, 'Ego Booster RESTful API', isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Personalize Ego Booster Quotes with custom links to share with friends',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Find Ego Booster Quotes by keyword', isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Weekly Ego Booster Email Subscription Service',
                isCollapsed: isCollapsed),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Image.asset(
                'assets/egobooster/egobooster-1.png',
                width: (width * ratio - 350),
                alignment: Alignment.center,
              ),
            ),
            Image.asset(
              'assets/egobooster/egobooster-1.png',
              width: (width * ratio - 350),
              alignment: Alignment.center,
            )
          ]),
          isCollapsed: MediaQuery.of(context).size.width < 450 ? true : false),
      SizedBox(height: 5),
      titleAndBody(
          context,
          width,
          'Implementation',
          Wrap(direction: Axis.vertical, spacing: 10, children: [
            bulletPoint(
                context, width, ratio, "Design the System Architecture for API Server, Batch Server, and Deploy Server",
                isCollapsed: isCollapsed),
            bulletPoint(
                context, width, ratio, 'Design Entities And Database Models and implement them using Sprint Data JPA',
                isCollapsed: isCollapsed),
            Image.asset(
              'assets/egobooster/architect.png',
              width: (width * ratio - minus),
            ),
            bulletPoint(context, width, ratio,
                'Utilize MySQL to store egobooster quotes and, for efficiency, Redis to store simple key-values',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Add Ego Booster Service and Controller Test cases using Junit',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio,
                'Implement CRUD RESTful API to provide a single entry point to the database from different applications',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio,
                'Design the Logo and Layout and build the front end view using Spring Boot Thymeleaf and jQuery',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio, 'Add Swagger API documentaion', isCollapsed: isCollapsed),
            Text(
              '\nDeployment',
              style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 15),
            ),
            bulletPoint(context, width, ratio,
                'Deploy API Server with Thymeleaf Template Engine to AWS EC2 instance by transfering the jar file to the instance and executing it',
                isCollapsed: isCollapsed),
            bulletPoint(context, width, ratio,
                'Use AWS MySQL RDS and AWS ElastiCache for production profile instead of locally installed MySQL and Redis',
                isCollapsed: isCollapsed),
          ]),
          isCollapsed: MediaQuery.of(context).size.width < 450 ? true : false),
    ],
  );
}
