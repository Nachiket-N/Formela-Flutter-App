import 'package:flutter/material.dart';

import 'components/app_bar.dart';
import 'components/drawer.dart';

import './components/Filled_Form/filled_forms_body.dart';

class FilledForms extends StatefulWidget {
  @override
  _FilledFormsPageState createState() => _FilledFormsPageState();
}

class _FilledFormsPageState extends State<FilledForms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: formelaAppBar(titleName: "Filled Forms"),
      drawer: formelaDrawer(),
      body: Container(
        color: Color.fromRGBO(65, 62, 75, 1),
        child: FilledFormsBody(),
      ),
    );
  }
}
