import 'package:flutter/material.dart';


class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "HeroImage",
      child: Image.asset("assets/images/homeBG.avif", fit: BoxFit.cover),
    );
  }
}
