import 'package:flutter/material.dart';

import 'components/app_bar.dart';
import 'components/drawer.dart';

import './components/Pending Form/pending_forms_body.dart';

class PendingForms extends StatefulWidget {
  @override
  _PendingFormsPageState createState() => _PendingFormsPageState();
}

class _PendingFormsPageState extends State<PendingForms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: formelaAppBar(titleName: "Pending Forms"),
      drawer:
          formelaDrawer(username: "Nachiket Naik", email: "nnn@somaiya.edu"),
      body: Container(
        color: Color.fromRGBO(65, 62, 75, 1),
        child: PendingFormsBody(),
      ),
    );
  }
}
