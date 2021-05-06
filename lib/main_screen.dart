import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/dashboard.dart';
import 'package:test/responsive.dart';
import 'providers/control2.dart';
import 'side_menu.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:context.read<Menu>().scaffoldKey,
      drawer: side_menu(),
        body: SafeArea(
            child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(Responsive.isDesktop(context))
        Expanded(
          child: side_menu(),
        ),
        Expanded(
            //covers 5/6 of screen
            flex: 5,
            child: Dashboard()),
      ],
    ))
    );
  }
}
