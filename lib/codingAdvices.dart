import 'package:flutter/material.dart';
import 'box.dart';

class CodingAdvices extends StatelessWidget {
  const CodingAdvices({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          spacing: 18,
          children: [
            Row(mainAxisAlignment: .spaceBetween, children: []),
            Column(
              mainAxisSize: .min,
              spacing: 5,
              children: [
                TextPlate(title: "Dont catch errors, throw 'em!"),
                TextPlate(title: "Do everything synchronusly!"),
                TextPlate(title: "Write everything twice!"),
                TextPlate(title: "Massive ViewModel is the answer!"),
                TextPlate(title: "Dont write test cases!"),
                TextPlate(title: "Dont maintain your code!"),
              ],
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Box(value: "1", tint: Colors.orange),
                Box(value: "2", tint: Colors.blue),
                Box(value: "3", tint: Colors.brown),
                Box(value: "4", tint: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class TextPlate extends StatelessWidget {
  const TextPlate({super.key, required this.title, this.tint = Colors.blue});

  final String title;
  final Color tint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: tint,
        boxShadow: [BoxShadow(color: Colors.yellow, blurRadius: 15)],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        title,
        textAlign: .center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}