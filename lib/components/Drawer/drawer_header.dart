import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class drawerHeader extends StatefulWidget {
  var email = FirebaseAuth.instance.currentUser?.email;

  var username = "Aizen";

  drawerHeader({Key? key}) : super(key: key);
  @override
  _drawerHeaderState createState() => _drawerHeaderState();
}

class _drawerHeaderState extends State<drawerHeader> {
  @override
  Widget build(BuildContext context) {
    if (widget.email != null) {
      widget.email = widget.email.toString();
      widget.username = widget.email!.substring(0, widget.email!.indexOf('@'));
    }
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
            widget.email.toString(),
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
