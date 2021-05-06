import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/control2.dart';
import 'package:test/main_screen.dart';
import 'package:provider/provider.dart';
import 'providers/control.dart';


void main() {
  return runApp(ChangeNotifierProvider(
    create: (context) => ThemeController(),
    child: Chart(),
  ));
}

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    //bool change = context.read<MenuController>().check;
    //final menu =Provider.of<MenuController>(context,listen: true);
    return Consumer<ThemeController>(builder: (context, data, child) {
      return MaterialApp(
        title: 'Flutter Admin Panel',
        theme: !data.check
            ? ThemeData.dark().copyWith(
                textTheme:
                    GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                        .apply(bodyColor: Colors.white),
                //canvasColor: Colors.black54
              )
            : ThemeData.light().copyWith(
                textTheme:
                    GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                        .apply(bodyColor: Colors.black,),
                canvasColor: Theme.of(context).secondaryHeaderColor
              ),
        home: MultiProvider(
          providers: [ChangeNotifierProvider(create: (context) => Menu(),
          )],
          child: MainScreen(),
        )
      );
    });
  }
}

