import 'package:flutter/material.dart';
import 'package:not_todo/view/widgets/hero_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget get image {
    return Container(
      height: 200,
      width: .infinity,
      padding: EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.all(.circular(20)),
        child: HeroImage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [image]);
  }
}
