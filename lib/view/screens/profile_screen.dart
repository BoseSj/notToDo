import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController userID = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Column(
          mainAxisSize: .min,
          spacing: 12,
          children: [
            Icon(Icons.person_rounded, size: 178),
            TextField(
              controller: userID,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
              ),
              onEditingComplete: () {
                setState(() {});
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
              ),
              onEditingComplete: () {
                setState(() {});

                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            Text("User ID: ${userID.text}"),
            Text("Password ID: ${password.text}"),
          ],
        ),
      ),
    );
  }
}
