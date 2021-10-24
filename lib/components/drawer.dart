// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import './Drawer/drawer_header.dart';
import 'Drawer/drawer_list.dart';

class formelaDrawer extends StatelessWidget {
  final String username;
  final String email;

  const formelaDrawer({Key? key, required this.username, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Divider(),
              formelaDrawerItem(
                icon: Icons.event,
                text: 'Pending Forms',
                onTap: () => Navigator.pushNamed(context, '/pendingForms'),
              ),
              formelaDrawerItem(
                icon: Icons.dashboard_outlined,
                text: 'Filled Forms',
                onTap: () => Navigator.pushNamed(context, '/filledForms'),
              ),
              Divider(),
              formelaDrawerItem(
                icon: Icons.settings_outlined,
                text: 'Settings',
                onTap: () => Navigator.pushNamed(context, '/settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
