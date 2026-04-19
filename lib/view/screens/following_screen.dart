import 'package:flutter/material.dart';

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
            Slider(
              divisions: 10,
              value: engagement,
              onChanged: (value) {
                setState(() {
                  engagement = value;
                });
              },
            ),
            Text("Increase Engagement > ${((engagement*100).round() / 100)*100}%"),
          ],
        ),
      ),
    );
  }
}
