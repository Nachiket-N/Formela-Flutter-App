import 'dart:ui';
import 'package:flutter/material.dart';

class PendingFormsListItem extends StatelessWidget {
  final String avatarPath;
  final String title;
  final String from;
  final DateTime dueDate;

  const PendingFormsListItem({
    Key? key,
    required this.avatarPath,
    required this.title,
    required this.from,
    required this.dueDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 40, 25, 40),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 1),
          width: 3,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: CircleAvatar(
              backgroundImage: AssetImage(avatarPath.toString()),
              radius: 40,
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Title : ${title}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'from : ${from}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Due date : ${dueDate.day}/${dueDate.month}/${dueDate.year} ',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
