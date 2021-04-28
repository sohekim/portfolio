import 'package:flutter/material.dart';
import 'package:my_portfolio/data/constants.dart';

class About extends StatelessWidget {
  final PageController pageController;

  About(this.pageController);

  @override
  Widget build(BuildContext context) {
    double _ratio = 0.55;
    double width = MediaQuery.of(context).size.width;
    return width < 620 ? mobileVersion(context, width, _ratio) : webVersion(context, width * ratio, _ratio);
  }

  Container webVersion(BuildContext context, double _width, double _ratio) {
    return Container(
      width: _width,
      child: Center(
        child: Wrap(runAlignment: WrapAlignment.center, children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width < 1200 ? _width * (1 - _ratio) : 1200 * ratio * (1 - _ratio),
              child: Image.asset(
                'assets/sohee.jpg',
              ),
            ),
          ),
          Container(
            width: _width * _ratio,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text('Skills', style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 18)),
                    ),
                    skillContainer(context, _width, _ratio),
                    thinLine(_width, _ratio),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text('Experience', style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 18)),
                    ),
                    experienceWrap(context, _width, _ratio),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget mobileVersion(BuildContext context, double _width, double _ratio) {
    return SingleChildScrollView(
      child: Container(
        width: _width,
        child: Center(
          child: Wrap(
              direction: Axis.vertical,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: InkWell(
                    onTap: () =>
                        pageController.animateToPage(0, duration: Duration(milliseconds: 600), curve: Curves.linear),
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      size: 40,
                      color: Colors.grey[350],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    width:
                        MediaQuery.of(context).size.width * 0.8,
                    child: Container(
                      child: Image.asset(
                        'assets/sohee.jpg',
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text('Skills', style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 18)),
                      ),
                      skillContainer(context, _width, _ratio),
                      thinLine(_width, _ratio),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text('Experience', style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 18)),
                      ),
                      experienceWrap(context, _width, _ratio),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: InkWell(
                    onTap: () =>
                        pageController.animateToPage(2, duration: Duration(milliseconds: 600), curve: Curves.linear),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 40,
                      color: Colors.grey[350],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Container skillContainer(BuildContext context, double _width, double _ratio) {
    return Container(
      width: _width * _ratio,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 40,
        children: <Widget>[
          titleBody('Languages', 'Java\nDart\nSQL\nPython\nKotlin', context),
          titleBody('Tools', 'AWS\nJenkins\nGoogle Firebase\nBitrise\nGithub', context),
          titleBody('SDK & Frameworks', 'Spring Boot\nFlutter', context),
          titleBody('Databases', 'MySql\nRedis\nGoogle Firestore', context),
        ],
      ),
    );
  }

  Wrap experienceWrap(BuildContext context, double _width, double _ratio) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 15,
      children: <Widget>[
        experienceRow(
            context, _width, _ratio, 'PurpleLabs', 'Backend Engineer && Frontend Intern', 'July 2020 - Present'),
        experienceRow(context, _width, _ratio, 'Mount Holyoke College Computer Science Dept.',
            'Teaching Assistant && Mentor', 'Jan 2020 - Jul 2020'),
        experienceRow(context, _width, _ratio, 'Google J-Term', 'Participant', 'Dec 2019 - Jan 2020'),
        experienceRow(context, _width, _ratio, 'Hack Holyoke', 'Director of Logistics', 'Jan 2019 - Nov 2019'),
        experienceRow(context, _width, _ratio, 'Davidson College Summer Coding Bootcamp',
            'Scholarship Recipient && Participant', 'Jul 2019 - Aug 2019')
      ],
    );
  }

  Widget experienceRow(BuildContext context, double _width, double _ratio, String company, String role, String time) {
    return Container(
      width: _width * _ratio,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 20,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: company,
              style: Theme.of(context).textTheme.headline2,
              children: <TextSpan>[TextSpan(text: '\n' + role, style: Theme.of(context).textTheme.headline4)],
            ),
          ),
          Text(
            time,
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  Widget titleBody(String title, String body, BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(height: 5),
        Text(body, style: Theme.of(context).textTheme.headline4)
      ],
    );
  }

  Padding thinLine(double _width, double _ratio) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 10, 20),
      child: Container(
        height: 1.0,
        width: _width * _ratio,
        color: Colors.black12,
      ),
    );
  }
}
