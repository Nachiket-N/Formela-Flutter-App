// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import './Drawer/drawer_header.dart';

Drawer formelaDrawer({username, email}) {
  return Drawer(
    child: SingleChildScrollView(
      child: Container(
        color: const Color(0xFF88878f),
        child: Column(
          children: [
            drawerHeader(
              username: username,
              email: email,
            ),
            // MyDrawerList(),
          ],
        ),
      ),
    ),
  );
}
