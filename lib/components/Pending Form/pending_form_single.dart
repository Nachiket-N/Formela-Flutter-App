// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:formela/components/Pending%20Form/pending_forms_items.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'pending_forms_items.dart';
import 'customedtext.dart';
import '../app_bar.dart';

class PendingFormSingle extends StatefulWidget {
  final String avatarPath;
  final String title;
  final String from;
  final DateTime dueDate;

  PendingFormSingle({
    Key? key,
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
                    inputText: "Description : ",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  userInputText,
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
                    inputText: "Was the delivery on time ?",
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
                                _value = 1;
                                print("Yes the delivery is reached on time");
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
                              setState(() {
                                _value = 2;
                                print("No,the delivery was delayed");
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
                  CustomizedText(inputText: "Rate our Packages!"),
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
                    inputText: 'Any Suggestions would be appreciated ! ',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  userInputText
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
                  print("Your Form is succesfully submitted");
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
