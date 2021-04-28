import 'package:flutter/material.dart';
import 'package:my_portfolio/data/constants.dart';
import 'package:my_portfolio/data/experience_data.dart';

class Experience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
          child: Text(
            'Experience',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.08),
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: [
                  experienceManyRoles(
                      context,
                      purpleLabsExperienceMap['company'],
                      purpleLabsExperienceMap['role'],
                      purpleLabsExperienceMap['date'],
                      purpleLabsExperienceMap['details'],
                      purpleLabsExperienceMap['role2'],
                      purpleLabsExperienceMap['date2'],
                      purpleLabsExperienceMap['details2'],
                      purpleLabsExperienceMap['techStacks']),
                  for (Map<String, dynamic> data in experienceMap)
                    experience(
                        context, data['company'], data['role'], data['date'], data['details'], data['techStacks'])
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget experienceManyRoles(BuildContext context, String company, String role, String date, List<String> details,
      String role2, String date2, List<String> details2, List<String> techStacks) {
    double _width = MediaQuery.of(context).size.width > maxWidth ? defaultWidth : MediaQuery.of(context).size.width;

    return Wrap(
      spacing: 5,
      direction: Axis.vertical,
      children: <Widget>[
        Text(
          company,
          style: Theme.of(context).textTheme.headline2,
        ),
        Container(
          width: _width * ratio,
          child: Wrap(alignment: WrapAlignment.spaceBetween, children: <Widget>[
            Text(
              role,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              date,
              style: Theme.of(context).textTheme.headline4,
            ),
          ]),
        ),
        SizedBox(height: 1),
        for (String detail in details)
                experienceBulletPoint(context, _width, detail),

          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text('• ', style: Theme.of(context).textTheme.headline4),
          //     Container(
          //       width: _width * ratio,
          //       child: Text(
          //         detail,
          //         style: Theme.of(context).textTheme.headline4,
          //       ),
          //     ),
          //   ],
          // ),
        SizedBox(height: 1),
        Container(
          width: _width * ratio,
          child: Wrap(alignment: WrapAlignment.spaceBetween, children: <Widget>[
            Text(
              role2,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              date2,
              style: Theme.of(context).textTheme.headline4,
            ),
          ]),
        ),
        SizedBox(height: 1),
        for (String detail in details2)
                experienceBulletPoint(context, _width, detail),

          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text('• ', style: Theme.of(context).textTheme.headline4),
          //     Container(
          //       width: _width * ratio,
          //       child: Text(
          //         detail,
          //         style: Theme.of(context).textTheme.headline4,
          //       ),
          //     ),
          //   ],
          // ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget experienceBulletPoint(BuildContext context, double width, String text) {
    return   Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('• ', style: Theme.of(context).textTheme.headline4),
              Container(
                width: width * ratio,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          );  }

  Widget experience(
      BuildContext context, String company, String role, String date, List<String> details, List<String> techStacks) {
    double _width = MediaQuery.of(context).size.width > maxWidth ? defaultWidth : MediaQuery.of(context).size.width;

    return Wrap(
      spacing: 5,
      direction: Axis.vertical,
      children: <Widget>[
        Text(
          company,
          style: Theme.of(context).textTheme.headline2,
        ),
        Container(
          width: _width * ratio,
          child: Wrap(alignment: WrapAlignment.spaceBetween, children: <Widget>[
            Text(
              role,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              date,
              style: Theme.of(context).textTheme.headline4,
            ),
          ]),
        ),
        SizedBox(height: 1),
        for (String detail in details)
        experienceBulletPoint(context, _width, detail),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text('• ', style: Theme.of(context).textTheme.headline4),
          //     Container(
          //       width: _width * ratio,
          //       child: Text(
          //         detail,
          //         style: Theme.of(context).textTheme.headline4,
          //       ),
          //     ),
          //   ],
          // ),
        SizedBox(height: 30),
      ],
    );
  }
}
