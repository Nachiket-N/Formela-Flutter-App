// ignore_for_file: camel_case_types

import 'dart:ui';
import 'package:flutter/material.dart';

class drawerHeader extends StatefulWidget {
  final String username;
  final String email;

  const drawerHeader({Key? key, required this.username, required this.email})
      : super(key: key);
  @override
  _drawerHeaderState createState() => _drawerHeaderState();
}

class _drawerHeaderState extends State<drawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFBD59),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ),
          Text(
            widget.username,
            style: const TextStyle(
                color: Color(0xFF413E4B),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 20),
          ),
          Text(
            widget.email,
            style: const TextStyle(
              color: Color(0xFF413E4B),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
