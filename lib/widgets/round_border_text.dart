import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget roundBorderText(String text, Color color, {String link}) {
  _launchURL() async {
    if (link != null) {
      if (await canLaunch(link)) {
        await launch(link);
      } else {
        print('Could not launch $link');
      }
    }
  }

  return InkWell(
    onTap: _launchURL,
    customBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    hoverColor: Colors.deepOrange[50],
    child: Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: color),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: color),
      ),
    ),
  );
}
