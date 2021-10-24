import 'package:flutter/material.dart';

import 'components/app_bar.dart';
import 'components/drawer.dart';

class Filledforms extends StatefulWidget {
  @override
  _FilledformsPageState createState() => _FilledformsPageState();
}

class _FilledformsPageState extends State<Filledforms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: formelaAppBar(titleName: "Filled Forms"),
      drawer:
          formelaDrawer(username: "Nachiket Naik", email: "nnn@somaiya.edu"),
    );
  }
}


// final responses = const [
  //   {
  //     'title': 'MBApedia',
  //     'from': 'Navya',
  //     'date': DateTime.july,
  //   },
  //   {
  //     'title': 'Artificial Reality',
  //     'from': 'Amogh',
  //     'date': DateTime.august,
  //   },
  //   {
  //     'title': 'Mrunmayee',
  //     'from': 'Data Science Platter',
  //     'date': DateTime.february,
  //   },
  // ];