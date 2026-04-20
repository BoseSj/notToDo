import 'package:flutter/material.dart';
import 'package:not_todo/coordinator/coordinator.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController userID = TextEditingController();
  TextEditingController password = TextEditingController();

  bool? isGuestMode = false;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log In")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: .min,
              spacing: 12,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(40),
                  splashColor: Colors.cyan,
                  onTap: () {
                    print("Tapped the well");
                  },
                  child: Icon(Icons.person_rounded, size: 178),
                ),
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
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.settings),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22)),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(value: "SM", child: Text("Social Media")),
                    DropdownMenuItem(value: "MP", child: Text("Marketplace")),
                  ],
                  onChanged: (value) {
                    print(value);
                  },
                ),
                SwitchListTile(
                  title: const Text("Remember me"),
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value;
                    });
                  },
                ),
                FilledButton(
                  onPressed: () {
                    Coordinator(context: context).login();
                  },
                  child: const Text("Log In"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
