import 'package:flutter/material.dart';
import 'package:not_todo/view/widgets/hero_widget.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: HeroImage(),
    );
  }
}