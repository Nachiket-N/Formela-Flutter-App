import 'package:flutter/material.dart';
import 'dart:ui';

class CustomizedText extends StatefulWidget {
  final String inputText;
  const CustomizedText({
    Key? key,
    required this.inputText,
  }) : super(key: key);

  @override
  _CustomizedTextState createState() => _CustomizedTextState();
}

class _CustomizedTextState extends State<CustomizedText> {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Text(
        widget.inputText,
        style: const TextStyle(
            color: Color.fromRGBO(65, 62, 75, 1),
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.w800,
            height: 1),
      ),
    );
  }
}
