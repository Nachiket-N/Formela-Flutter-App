import 'package:flutter/material.dart';

class FilledFormsTitle extends StatelessWidget {
  const FilledFormsTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Filled forms',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'MontserratAlternates',
        fontSize: 24,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1,
      ),
    );
  }
}
