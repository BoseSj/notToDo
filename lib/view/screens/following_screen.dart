import 'package:flutter/material.dart';
import 'package:not_todo/view/widgets/hero_widget.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  double engagement = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              height: 500,
              width: .infinity,
              padding: EdgeInsets.all(25),
              child: ClipRRect(
                borderRadius: BorderRadius.all(.circular(20)),
                child: HeroImage(),
              ),
            ),
            Slider(
              divisions: 10,
              activeColor: Colors.amber,
              thumbColor: Colors.amber,
              value: engagement,
              onChanged: (value) {
                setState(() {
                  engagement = value;
                });
              },
            ),
            Text(
              "Increase Engagement > ${((engagement * 100).round() / 100) * 100}%",
            ),
          ],
        ),
      ),
    );
  }
}
