import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarTitle extends StatefulWidget {

  final String tabTitle;
  TabBarTitle({this.tabTitle});

  @override
  _TabBarTitleState createState() => _TabBarTitleState();
}

class _TabBarTitleState extends State<TabBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.tabTitle, style: GoogleFonts.poppins(color: Colors.blue));
  }
}
