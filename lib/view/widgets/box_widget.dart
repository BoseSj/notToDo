import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box({super.key, this.value = '', this.tint = Colors.blueAccent});

  final String value;
  final Color tint;
  final double size = 75;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: tint,
        borderRadius: BorderRadius.all(Radius.circular(22)),
        boxShadow: [
          BoxShadow(blurRadius: 18, color: Colors.amber.withAlpha(175)),
        ],
      ),
      child: Center(
        child: Text(
          value,
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

