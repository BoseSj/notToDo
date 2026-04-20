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

  FilledButton logInButton({required BuildContext context}) {
    return FilledButton(
      onPressed: () {
        if (userID.value.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Enter name"),
            ),
          );
          return;
        }
        if (password.value.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Enter password"),
            ),
          );
          return;
        }
        Coordinator(context: context).login();
      },
      child: const Text("Log In"),
    );
  }

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
                DropdownButtonFormField(
                  hint: Text("Selec account type"),
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
                logInButton(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
