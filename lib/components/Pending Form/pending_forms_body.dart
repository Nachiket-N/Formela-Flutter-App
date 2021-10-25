import 'package:flutter/material.dart';

import './pending_forms_items.dart';

class PendingFormsBody extends StatefulWidget {
  const PendingFormsBody({Key? key}) : super(key: key);

  @override
  _PendingFormsBodyState createState() => _PendingFormsBodyState();
}

class _PendingFormsBodyState extends State<PendingFormsBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: const EdgeInsets.all(8.0),
      children: <PendingFormsListItem>[
        PendingFormsListItem(
          avatarPath: 'assets/images/person1.png',
          title: "MBApedia",
          from: "Alumni Cell, KJSCE",
          dueDate: DateTime(2021, 11),
        ),
        PendingFormsListItem(
          avatarPath: 'assets/images/person2.png',
          title: "ICW",
          from: "Alumni Cell, KJSCE",
          dueDate: DateTime(2021, 9),
        ),
        PendingFormsListItem(
          avatarPath: 'assets/images/person3.png',
          title: "Stock Unlock",
          from: "Alumni Cell, KJSCE",
          dueDate: DateTime(2021, 4),
        ),
      ],
    );
  }
}
