import 'package:flutter/material.dart';

import './filled_forms_items.dart';

class FilledFormsBody extends StatefulWidget {
  const FilledFormsBody({Key? key}) : super(key: key);

  @override
  _FilledFormsBodyState createState() => _FilledFormsBodyState();
}

class _FilledFormsBodyState extends State<FilledFormsBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: const EdgeInsets.all(8.0),
      children: <FilledFormsListItem>[
        FilledFormsListItem(
          avatarPath: 'assets/images/person1.png',
          title: "MBApedia",
          from: "Alumni Cell, KJSCE",
          filledOn: DateTime(2021, 11, 14),
        ),
        FilledFormsListItem(
          avatarPath: 'assets/images/person2.png',
          title: "ICW",
          from: "Alumni Cell, KJSCE",
          filledOn: DateTime(2021, 9, 19),
        ),
        FilledFormsListItem(
          avatarPath: 'assets/images/person3.png',
          title: "Stock Unlock",
          from: "Alumni Cell, KJSCE",
          filledOn: DateTime(2021, 4, 25),
        ),
      ],
    );
  }
}
