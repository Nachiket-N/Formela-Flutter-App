// ignore_for_file: camel_case_types, prefer_const_constructors
import 'dart:ui';
import 'package:flutter/material.dart';

Widget formelaDrawerItem({
  required IconData icon,
  required String text,
  required GestureTapCallback onTap,
}) {
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
