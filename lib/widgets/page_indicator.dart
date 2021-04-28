import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {
  // final PageController pageController;
  // PageIndicator(this.pageController, this.pageNotifier);

  final ValueNotifier<int> pageNotifier;

  PageIndicator(this.pageNotifier);

  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.pageNotifier.value;
    widget.pageNotifier.addListener(_changePage);
  }

  @override
  void dispose() {
    widget.pageNotifier.removeListener(_changePage);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 40,
        top: MediaQuery.of(context).size.height / 2 - 50,
        child: Container(
            child: Column(children: [
          dot(0, _currentPage),
          SizedBox(height: 10),
          dot(1, _currentPage),
          SizedBox(height: 10),
          dot(2, _currentPage),
          SizedBox(height: 10),
          dot(3, _currentPage)
        ])));
  }

  _changePage() {
    setState(() {
      _currentPage = widget.pageNotifier.value;
    });
  }

  Widget dot(int myIndex, int currentPage) {
    if (myIndex == currentPage) {
      return Icon(
        Icons.circle,
        size: 11,
      );
    } else {
      return Icon(
        Icons.circle,
        size: 7,
        color: Colors.black54,
      );
    }
  }
}
