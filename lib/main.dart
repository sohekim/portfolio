import 'package:flutter/material.dart';
// import 'package:my_portfolio/landing_before.dart';
import 'package:my_portfolio/pages/landing.dart';
import 'package:my_portfolio/pages/project_page.dart';
// import 'package:my_portfolio/pages/experience_before.dart';
import 'package:my_portfolio/pages/about.dart';
import 'package:my_portfolio/pages/projects.dart';
import 'package:my_portfolio/screen_provider.dart';
import 'package:my_portfolio/widgets/page_indicator.dart';
import 'package:provider/provider.dart';

//T O D O
//icons are pixelated
// work expereince below padding

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sohee Kim Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            headline1: TextStyle(fontSize: 18.5, color: Colors.black, fontWeight: FontWeight.w900, letterSpacing: 0.3),
            headline2: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black, letterSpacing: 0.3, height: 1.5),
            headline3: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black, letterSpacing: 0.2, height: 1.5),
            //grey
            headline4: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w300, color: Colors.grey[700], letterSpacing: 0.2, height: 1.5)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 620 ? true : false;
    return ChangeNotifierProvider<ScreenProvider>(
      create: (_) => ScreenProvider(),
      child: Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                if (!isMobile) PageIndicator(_currentPageNotifier),
                PageView(
                    physics: PageScrollPhysics(),
                    clipBehavior: Clip.antiAlias,
                    controller: pageController,
                    scrollDirection: Axis.vertical,
                    onPageChanged: (int index) {
                      _currentPageNotifier.value = index;
                    },
                    children: [
                      Landing(pageController),
                      About(pageController),
                      Projects(pageController),
                      ProjectPage(pageController),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
