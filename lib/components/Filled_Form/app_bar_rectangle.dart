// No longer needed

import 'package:flutter/material.dart';
import './burger_widget.dart';
import './title.dart';

AppBar FilledFormAppBar({required String titleName}) {
  return AppBar(
    backgroundColor: const Color(0xFFFFBD59),
    iconTheme: const IconThemeData(color: Color(0xFF413E4B)),
    title: Text(
      titleName,
      style: TextStyle(
        color: Color(0xFF413E4B),
        fontFamily: 'MontserratAlternates',
        fontWeight: FontWeight.w800,
        fontSize: 20,
      ),
    ),
  );
}
