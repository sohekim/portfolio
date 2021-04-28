import 'package:flutter/material.dart';
import 'package:my_portfolio/data/constants.dart';
import 'package:my_portfolio/widgets/round_border_text.dart';
import 'package:my_portfolio/widgets/title_body.dart';
import 'package:url_launcher/url_launcher.dart';

Widget mediumWidget(
  BuildContext context,
  double width,
) {
  bool isCollapsed = MediaQuery.of(context).size.width < 450 ? true : false;
  double minus = isCollapsed ? 0 : 150;

  Map<String, String> articleLinks = {
    'How to Shift to Functional Programming in Java':
        'https://medium.com/swlh/super-java-how-to-shift-to-functional-programming-in-java-a13d3176cc61',
    'Why Functional Programming in Object-Oriented Programming':
        'https://levelup.gitconnected.com/super-java-functional-programming-in-object-oriented-programming-84dab44a915f',
    'Anonymous Class, Functional Interface, and Lambda Expression':
        'https://medium.com/swlh/super-basic-java-anonymous-class-functional-interface-and-lambda-expression-fba411a787',
    'Beginner’s guide to Flutter Web — Set up To GitHub Page Deployment':
        'https://blog.usejournal.com/beginners-guide-to-flutter-web-set-up-to-deployment-39c967d7dfae'
  };

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
                  "Technical blog to share what I've learned, mainly on Java ",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: roundBorderText('Sohee Kim Medium Page', accentColor, link: 'https://kim66s.medium.com/'),
              ),
            ],
          ),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Statistics',
          Wrap(spacing: width * 0.04, children: [
            Column(children: [
              Text('10K', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
              Text('Total Views', style: Theme.of(context).textTheme.headline4)
            ]),
            Column(children: [
              Text('1.7K', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
              Text('Total Claps', style: Theme.of(context).textTheme.headline4)
            ]),
            Column(children: [
              Text('100 +', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
              Text('Fans', style: Theme.of(context).textTheme.headline4)
            ])
          ]),
          isCollapsed: isCollapsed),
      titleAndBody(
          context,
          width,
          'Articles',
          SingleChildScrollView(
            child: Container(
              width: width * ratio - 150,
              child: Wrap(
                alignment: WrapAlignment.center,
    
                spacing: 5,
                runSpacing: 5,
                children: [
                  for (String title in articleLinks.keys)
                    articleTile(context, title, width, articleLinks[title], isCollapsed)
                ],
              ),
            ),
          ),
          isCollapsed: isCollapsed)
    ],
  );
}

Widget articleTile(BuildContext context, String title, double width, String link, bool isCollapsed) {
 
  double size = isCollapsed ? 150 : (width * ratio - 150) / 4 - 5;

  _launchURL() async {
    if (link != null) {
      if (await canLaunch(link)) {
        await launch(link);
      } else {
        print('Could not launch $link');
      }
    }
  }

  return Material(
      color: Colors.grey[100],
      child: InkWell(
          onTap: _launchURL,
          hoverColor: Colors.grey[200],
          child: Container(
            height: size,
            width: size,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline4),
              ),
            ),
          )));
}
