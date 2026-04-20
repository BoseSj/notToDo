import 'package:flutter/material.dart';
import 'package:not_todo/view/widgets/postCard_widget.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Column(
        spacing: 12,
        children: [
          PostCardWidget(),
          PostCardWidget(),
          PostCardWidget(),
          PostCardWidget(),
          PostCardWidget(),
          PostCardWidget(),
          PostCardWidget(),
        ],
      ),
    );
  }
}
