import 'package:flutter/material.dart';
import 'package:my_portfolio/data/constants.dart';
import 'package:my_portfolio/pages/project_pages/breast_cancer_classification.dart';
import 'package:my_portfolio/pages/project_pages/bridge.dart';
import 'package:my_portfolio/pages/project_pages/ego_booster.dart';
import 'package:my_portfolio/pages/project_pages/ego_booster_batch.dart';
import 'package:my_portfolio/pages/project_pages/flutter_portfolio.dart';
import 'package:my_portfolio/pages/project_pages/medium.dart';
import 'package:my_portfolio/pages/project_pages/moim.dart';
import 'package:my_portfolio/pages/project_pages/vscode_portfolio.dart';
import 'package:my_portfolio/screen_provider.dart';
import 'package:provider/provider.dart';

class ProjectPage extends StatelessWidget {
  final PageController pageController;

  ProjectPage(this.pageController);

  @override
  Widget build(BuildContext context) {
    final ScreenProvider screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    double _width = MediaQuery.of(context).size.width > maxWidth ? defaultWidth : MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.01, 0, MediaQuery.of(context).size.height * 0.005),
          child: InkWell(
            onTap: () => pageController.animateToPage(2, duration: Duration(milliseconds: 600), curve: Curves.linear),
            child: Icon(
              Icons.keyboard_arrow_up,
              size: 40,
              color: Colors.grey[350],
            ),
          ),
        ),
        Text(
          screenProvider.selectedProject,
          style: Theme.of(context).textTheme.headline1,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height * 0.02, 0, MediaQuery.of(context).size.height * 0.02),
            child: SingleChildScrollView(
              child: Container(
                  width: _width * ratio, child: getBodyWidget(context, screenProvider.selectedProject, _width)),
            ),
          ),
        ),
      ],
    );
  }

  Widget getBodyWidget(BuildContext context, String name, double width) {
    switch (name) {
      case 'Ego Booster':
        return egoBoosterWidget(context, width);
      case 'Ego Booster Batch':
        return egoBoosterBatchWidget(context, width);
      case 'Portfolio Website':
        return flutterPortfolioWidget(context, width);
      case 'Super Java':
        return mediumWidget(context, width);
      case 'MOIM':
        return moimWidget(context, width);
      case 'Bridge':
        return bridgeWidget(context, width);
      case 'Breast Cancer Image Classification':
        return breastCancetImageWidget(context, width);
      case 'VSCode Themed Website':
        return vsCodeWebsiteWidget(context, width);
      default:
        return Container(
            width: 500,
            height: 500,
            child: Center(
              child: Text('404 Not Found', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline4),
            ));
    }
  }
}
