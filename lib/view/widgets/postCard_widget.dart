import 'package:flutter/material.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        child: Stack(
          alignment: .bottomCenter,
          children: [
            SizedBox(
              width: .infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.all(.circular(20)),
                child: Image.asset("assets/images/homeBG.avif", fit: .cover),
              ),
            ),
            Text(
              "This is a post",
              style: TextStyle(
                color: Colors.white,
                fontWeight: .w600,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
