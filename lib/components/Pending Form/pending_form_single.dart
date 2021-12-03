// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:formela/components/Pending%20Form/pending_forms_items.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'pending_forms_items.dart';
import 'customedtext.dart';
import '../app_bar.dart';

class PendingFormSingle extends StatefulWidget {
  final String formid;
  final String avatarPath;
  final String title;
  final String from;
  final DateTime dueDate;

  PendingFormSingle({
    Key? key,
    required this.formid,
    required this.avatarPath,
    required this.title,
    required this.from,
    required this.dueDate,
  }) : super(key: key);

  @override
  _PendingFormSingleState createState() => _PendingFormSingleState();
}

class _PendingFormSingleState extends State<PendingFormSingle> {
  var rating = 0.0;
  int _value = 1;

  var overallExp = "";
  var updatesOnFutureEvents = "Yes";
  var suggestions = "";

  Future<void> _updateDB({var obj, String? formid}) async {
    await FirebaseFirestore.instance.collection("form_responses").add(obj);

    await FirebaseFirestore.instance
        .collection("forms")
        .doc(formid)
        .update({'Pending': false});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    BoxDecoration customBox = BoxDecoration(
      color: const Color.fromRGBO(255, 255, 255, 1),
      border: Border.all(
        color: const Color.fromRGBO(65, 62, 75, 1),
      ),
    );

    TextFormField userInputText = TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          print(
              'This form will help us get feedback on the services that we provided you. We can work towards improvement from it.');
        } else {
          print(value);
        }
        return null;
      },
    );

    return Scaffold(
      appBar: formelaAppBar(
        titleName: 'Pending Form: ${widget.title}',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              color: Color(0xFF413E4B),
              child: PendingFormsListItem(
                formid: widget.formid,
                avatarPath: widget.avatarPath,
                title: widget.title,
                from: widget.from,
                dueDate: widget.dueDate,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //////////////////////////////////////////////////////////
            Container(
              height: height * .15,
              width: width,
              decoration: customBox,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomizedText(
                    inputText: "How was your overall experience?",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      overallExp = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print(
                            'This form will help us get feedback on the services that we provided you. We can work towards improvement from it.');
                      } else {
                        print(value);
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
            //////////////////////////////////////////////////////////

            Container(
              height: height * .15,
              width: width,
              decoration: customBox,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomizedText(
                    inputText:
                        "Would you like to receive updates on future events?",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                            value: 1,
                            groupValue: _value,
                            //hoverColor: Color.fromRGBO(255, 189, 89, 1),
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                // updatesOnFutureEvents = "Yes";
                                _value = 1;
                                // print("Yes the delivery is reached on time");
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        CustomizedText(
                          inputText: 'YES',
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Radio(
                            value: 2,
                            groupValue: _value,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              // updatesOnFutureEvents = "No";
                              setState(() {
                                _value = 2;
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        CustomizedText(
                          inputText: 'NO',
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            //-------------------------------------------------------------------------------------------//
            SizedBox(
              height: 20,
            ),
            Container(
              height: height * .15,
              width: width,
              decoration: customBox,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomizedText(inputText: "Rate our event!"),
                  SizedBox(
                    height: 10,
                  ),
                  SmoothStarRating(
                    starCount: 5,
                    rating: rating,
                    size: 45,
                    isReadOnly: false,
                    filledIconData: Icons.star,
                    color: Color.fromRGBO(255, 189, 89, 1),
                    onRated: (value) {
                      rating = value;
                      print("rating value -> $value");
                    },
                  )
                ],
              ),
            ),
//---------------------------------------------------------------------------------//
            SizedBox(
              height: 20,
            ),
            Container(
              height: height * .15,
              width: width,
              decoration: customBox,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CustomizedText(
                    inputText: 'Any suggestions for future events:',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      suggestions = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print(
                            'This form will help us get feedback on the services that we provided you. We can work towards improvement from it.');
                      } else {
                        print(value);
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 15,
            ),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 189, 89, 1),
                ),
                onPressed: () {
                  if (overallExp != "" && suggestions != "") {
                    var obj = {
                      'Form_Name': widget.title,
                      'Filled_By': FirebaseAuth.instance.currentUser?.email,
                      "Overall_Experience": overallExp,
                      "Receive_Future_Updates": updatesOnFutureEvents,
                      "Rating": rating,
                      "Suggestions": suggestions,
                    };

                    _updateDB(obj: obj, formid: widget.formid);

                    print("Your Form is succesfully submitted");

                    Navigator.pushNamed(context, '/pendingForms');
                  } else {
                    print("Some fields have been left empty");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
