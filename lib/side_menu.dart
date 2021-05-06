import 'package:flutter/material.dart';
import 'providers/control.dart';
import 'package:provider/provider.dart';
class side_menu extends StatefulWidget {
  bool isSwitched = false;
  @override
  _side_menuState createState() => _side_menuState();
}

// ignore: camel_case_types
class _side_menuState extends State<side_menu> {
  @override
     Widget build(BuildContext context) {   
    final menu =Provider.of<ThemeController>(context);
    // print(context.read<MenuController>().check);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(Icons.money_off_csred_sharp),
            ),
            DrawListTile(
              title: "Dashboard",
              icon:Icons.border_all_rounded,
            ),
            DrawListTile(
              title: "Task",
              icon:Icons.task,
            ),
            DrawListTile(
              title: "Documents",
              icon:Icons.document_scanner_rounded,
            ),
            DrawListTile(
              title: "Store",
              icon:Icons.store,
            ),
            DrawListTile(
              title: "Profile",
              icon:Icons.account_circle
            ),
            DrawListTile(
              title: "Settings",
              icon:Icons.settings,
            ),
            ListTile(leading: Icon(Icons.logout),title:Text("Logout"),onTap: (){},),
            
            Switch(value: menu.check, onChanged: (value){
              setState(() {
                menu.setControl();
              }
              );
            }
            ),
          ],
        ),
      ),
    );
  }
}

class DrawListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawListTile({
    Key key,
    this.title, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        horizontalTitleGap: 0.0,
        onTap: () {},
        leading: Icon(icon),
        title: Text(title,),
        );
  }
}
