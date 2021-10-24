import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BurgerWidget extends StatelessWidget {
  const BurgerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator VectorWidget - VECTOR
    return SvgPicture.asset(
      'assets/svg/hamburger.svg',
      semanticsLabel: 'vector',
    );
  }
}
