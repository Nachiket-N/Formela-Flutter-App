// ignore_for_file: camel_case_types, prefer_const_constructors
import 'dart:ui';
import 'package:flutter/material.dart';

Widget formelaDrawerItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    selectedTileColor: Color(0xFF413E4B),
    tileColor: Colors.transparent,
    title: Row(
      children: <Widget>[
        Icon(
          icon,
          size: 20,
          color: Color(0xFFFFBD59),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFBD59),
              fontSize: 16,
            ),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}

/*
class drawerList extends StatefulWidget {
  int _selectDestination = 0;

  drawerList({Key? key}) : super(key: key);
  @override
  _drawerListState createState() => _drawerListState();
}

class _drawerListState extends State<drawerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF88878f),
      padding: EdgeInsets.only(
        top: 50,
        bottom: 450,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Header',
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Filled Forms'),
            selected: _selectedDestination == 0,
            onTap: () => selectDestination(0),
          ),
        ],
      ),
      //   child: Column(
      //     // shows the list of menu drawer
      //     children: [
      //       menuItem(
      //         1,
      //         "Pending forms",
      //         Icons.event,
      //         currentPage == DrawerSections.pendingforms ? true : false,
      //       ),
      //       menuItem(
      //         2,
      //         "Filled forms",
      //         Icons.dashboard_outlined,
      //         currentPage == DrawerSections.filledforms ? true : false,
      //       ),
      //       Divider(),
      //       menuItem(
      //         3,
      //         "Settings",
      //         Icons.settings_outlined,
      //         currentPage == DrawerSections.settings ? true : false,
      //       ),
      //     ],
      //   ),
    );
  }
}

Widget menuItem(int id, String title, IconData icon, bool selected) {
  return Material(
    color: selected ? Color(0xFF413E4B) : Colors.transparent,
    child: InkWell(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          if (id == 1) {
            currentPage = DrawerSections.pendingforms;
          } else if (id == 2) {
            currentPage = DrawerSections.filledforms;
          } else if (id == 3) {
            currentPage = DrawerSections.settings;
          }
        });
      },
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 20,
                color: Color(0xFFFFBD59),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFFBD59),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

enum DrawerSections {
  pendingforms,
  filledforms,
  settings,
}

*/
/*
Widget MyDrawerList() {
    return Container(
      color: Color(0xFF88878f),
      padding: EdgeInsets.only(
        top: 50,
        bottom: 450,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Pending forms", Icons.event,
              currentPage == DrawerSections.pendingforms ? true : false),
          menuItem(2, "Filled forms", Icons.dashboard_outlined,
              currentPage == DrawerSections.filledforms ? true : false),
          Divider(),
          menuItem(3, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
        ],
      ),
    );
  }
*/