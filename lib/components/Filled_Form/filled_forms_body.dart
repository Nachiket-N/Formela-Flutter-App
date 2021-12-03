import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import './filled_forms_items.dart';

class FilledFormsBody extends StatefulWidget {
  const FilledFormsBody({Key? key}) : super(key: key);

  @override
  _FilledFormsBodyState createState() => _FilledFormsBodyState();
}

class _FilledFormsBodyState extends State<FilledFormsBody> {
  Future<List<FilledFormsListItem>> _getFilledFormsList() async {
    var filledFormsList = <FilledFormsListItem>[];

    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("forms")
        .where("Pending", isEqualTo: false)
        .get();

    List<QueryDocumentSnapshot> docs = snapshot.docs;

    var i = 0;
    for (var doc in docs) {
      i++;
      var data = doc.data() as Map<String, dynamic>;

      var docid = doc.id;

      var obj = FilledFormsListItem(
        formid: docid,
        avatarPath: 'assets/images/person${i}.png',
        title: data['Form_Name'],
        from: data['Given By'],
        filledOn: DateTime.parse(data['To Date'].toDate().toString()),
      );

      i = i % 3;

      filledFormsList.add(obj);
    }
    // print(filledFormsList);
    return filledFormsList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getFilledFormsList(),
      builder: (context, AsyncSnapshot<List<FilledFormsListItem>> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: <Widget>[...?snapshot.data],
          );
        } else {
          return Center(
            child: Container(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                color: Color.fromRGBO(255, 189, 89, 1),
              ),
            ),
          );
        }
      },
    );
  }
}
