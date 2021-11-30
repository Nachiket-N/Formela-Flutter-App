import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import './pending_forms_items.dart';

class PendingFormsBody extends StatefulWidget {
  const PendingFormsBody({Key? key}) : super(key: key);

  @override
  _PendingFormsBodyState createState() => _PendingFormsBodyState();
}

class _PendingFormsBodyState extends State<PendingFormsBody> {
  // var pendingFormsList;

  Future<List<PendingFormsListItem>> _getPendingFormsList() async {
    var pendingFormsList = <PendingFormsListItem>[];

    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("forms")
        .where("Pending", isEqualTo: true)
        .get();

    List<QueryDocumentSnapshot> docs = snapshot.docs;

    var i = 0;
    for (var doc in docs) {
      i++;
      var data = doc.data() as Map<String, dynamic>;

      var docid = doc.id;
      // print(docid);

      var obj = PendingFormsListItem(
        formid: docid,
        avatarPath: 'assets/images/person${i}.png',
        title: data['Form_Name'],
        from: data['Given By'],
        dueDate: DateTime.parse(data['To Date'].toDate().toString()),
      );

      i = i % 3;

      pendingFormsList.add(obj);
    }
    // print(pendingFormsList);
    return pendingFormsList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPendingFormsList(),
      builder: (context, AsyncSnapshot<List<PendingFormsListItem>> snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data![0]);

          return ListView(
            children: <Widget>[...?snapshot.data],
          );
        } else {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
