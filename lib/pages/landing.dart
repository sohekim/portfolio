import 'package:flutter/material.dart';
import 'package:my_portfolio/data/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Landing extends StatelessWidget {
  final PageController pageController;

  Landing(this.pageController);

  @override
  Widget build(BuildContext context) {
    double _width;
    bool isSmall = false;
    if (MediaQuery.of(context).size.width < 600) {
      _width = MediaQuery.of(context).size.width * 0.9;
      isSmall = true;
    } else if (MediaQuery.of(context).size.width > maxWidth) {
      _width = defaultWidth * ratio;
      isSmall = false;
    } else {
      _width = MediaQuery.of(context).size.width * ratio;
      isSmall = false;
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            width: _width,
            child: Wrap(alignment: WrapAlignment.end, crossAxisAlignment: WrapCrossAlignment.center, children: <Widget>[
              Wrap(alignment: WrapAlignment.end, crossAxisAlignment: WrapCrossAlignment.center, children: <Widget>[
                navText(context, 'About', 1, 500),
                navText(context, 'Projects', 2, 700),
                InkWell(
                  onTap: _launchResumeURL,
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hoverColor: Colors.deepOrange[50],
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: accentColor),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Text(
                      'Resume',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: accentColor, letterSpacing: 0.3),
                    ),
                  ),
                ),
              ]),
            ]),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text('{ Sohee Kim }',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width >= 1500
                    ? MediaQuery.of(context).size.width * 0.093
                    : isSmall
                        ? MediaQuery.of(context).size.width * 0.25
                        : 120,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.07),
              child: getLinkIcons()),
          Wrap(alignment: WrapAlignment.spaceBetween, children: <Widget>[
            Container(child: getRichText(context)),
          ]),
        ]),
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

  Widget navText(BuildContext context, String text, int pageNum, int duration) {
    return Padding(
      padding: const EdgeInsets.only(right: 50.0),
      child: InkWell(
        onTap: () =>
            pageController.animateToPage(pageNum, duration: Duration(milliseconds: duration), curve: Curves.linear),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }

  Widget getLinkIcons() {
    return Wrap(crossAxisAlignment: WrapCrossAlignment.center, spacing: 10, children: <Widget>[
      Tooltip(
        message: 'Kim66s@mtholyoke.edu',
        textStyle: TextStyle(fontSize: 15, color: Colors.white, letterSpacing: 0.3),
        showDuration: Duration(seconds: 2),
        child: Icon(
          Icons.mail,
          size: 40,
        ),
      ),
      InkWell(
        onTap: _launchGitURL,
        child: Image.asset(
          'assets/github.png',
          height: 30,
        ),
      ),
      InkWell(
        onTap: _launchLinkedInURL,
        child: Image.asset(
          'assets/linkedin.png',
          height: 30,
        ),
      ),
      InkWell(
        onTap: _launchMediumURL,
        child: Image.asset(
          'assets/medium_logo.png',
          height: 30,
        ),
      ),
    ]);
  }

  _launchGitURL() async {
    const url = 'https://github.com/sohekim';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchLinkedInURL() async {
    const url = 'https://www.linkedin.com/in/sohee98/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchMediumURL() async {
    const url = 'https://kim66s.medium.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchResumeURL() async {
    const url = 'https://docs.google.com/document/d/1ZJaYUG7Dmt5C81pVpiXGmr3Jeg7env7lc_CAUhObDRQ/edit?usp=sharing';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget getRichText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Hello, I'm a ",
        style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16),
        children: <TextSpan>[
          TextSpan(text: 'Software Engineer', style: Theme.of(context).textTheme.headline2),
          TextSpan(text: ' who builds', style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16)),
          TextSpan(text: ' ideas into real', style: Theme.of(context).textTheme.headline2),
          TextSpan(
              text: ' products and services. ', style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16)),
          TextSpan(
              text: "\nI believe that I'll create ",
              style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16)),
          TextSpan(text: 'innovative and powerful technologies', style: Theme.of(context).textTheme.headline2),
          TextSpan(text: " that can", style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16)),
          TextSpan(text: ' solve ', style: Theme.of(context).textTheme.headline2),
          TextSpan(text: "some of the", style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16)),
          TextSpan(text: " world's unsolvable problems.", style: Theme.of(context).textTheme.headline2),
          TextSpan(text: '\n\nComputer Science', style: Theme.of(context).textTheme.headline2),
          TextSpan(text: ' && ', style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16)),
          TextSpan(text: 'Philosophy', style: Theme.of(context).textTheme.headline2),
          TextSpan(
              text: " @Mount Holyoke College '23", style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16)),
          TextSpan(
              text: '\nPassionate Writing && ', style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16)),
          TextSpan(text: 'Sharing Knowledge ', style: Theme.of(context).textTheme.headline2),
          TextSpan(text: '@Medium', style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16)),
          TextSpan(text: '\nFull Time Backend Engineer Intern', style: Theme.of(context).textTheme.headline2),
          TextSpan(text: ' @PurpleLabs', style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16)),
          TextSpan(text: '\n\nLooking for', style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16)),
          TextSpan(
              text: ' 2022 Summer Internship ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
          TextSpan(text: '= true;', style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16)),
        ],
      ),
    );
  }

  Widget resumeLink() {
    return InkWell(
      onTap: _launchResumeURL(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: accentColor),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Text(
          'Resume',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: accentColor, letterSpacing: 0.3),
        ),
      ),
    );
  }
}
