import 'package:flutter/material.dart';
import 'package:my_portfolio/data/constants.dart';
import 'package:my_portfolio/screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:my_portfolio/data/project_data.dart';

class Projects extends StatelessWidget {
  final PageController pageController;

  Projects(this.pageController);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width > maxWidth ? defaultWidth : MediaQuery.of(context).size.width;

    final ScreenProvider screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.075),
          child: Text(
            'Projects',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: _width * ratio,
              child: Wrap(alignment: WrapAlignment.center, spacing: 5, runSpacing: 5, children: <Widget>[
                for (MapEntry<String, Map<String, dynamic>> project in projectMap.entries)
                  projectTile(context, screenProvider, project.key, project.value['summary'])
              ]),
            ),
          ),
        ),
      ],
    );
  }

  double getDouble(BuildContext context) {
    if (MediaQuery.of(context).size.width > defaultWidth) {
      return (defaultWidth * ratio / 4 - 5);
    } else if (MediaQuery.of(context).size.width < 700) {
      return 150;
    } else {
      return MediaQuery.of(context).size.width * ratio / 4 - 5;
    }
  }

  Widget projectTile(BuildContext context, ScreenProvider screenProvider, String title, String summary) {
    bool isSelected = screenProvider.selectedProject == title;

    return Material(
      color: isSelected ? Colors.grey[300] : Colors.grey[100],
      child: InkWell(
        onTap: () {
          screenProvider.selectedProject = title;
          pageController.animateToPage(3, duration: Duration(milliseconds: 600), curve: Curves.linear);
        },
        hoverColor: isSelected ? Colors.grey[300] : Colors.grey[200],
        child: Container(
          height: getDouble(context),
          width: getDouble(context),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.black : Colors.black45,
                      letterSpacing: 0.3,
                      height: 1.5),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\n' + summary,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: isSelected ? Colors.black : Colors.black45,
                            letterSpacing: 0.1,
                            height: 1.5)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
