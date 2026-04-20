import 'package:flutter/material.dart';
import 'package:not_todo/view/screens/dashboard_screen.dart';
import 'package:not_todo/view/screens/login_screen.dart';
import 'package:not_todo/view/screens/profile_screen.dart';

class Coordinator {
  final BuildContext context;

  Coordinator({required this.context});
}

extension Auth on Coordinator {
  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DashboardScreen();
        },
      ),
    );
  }

  void logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LogInScreen();
        },
      ),
    );
  }
}

extension App on Coordinator {
  void profile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Profile"),
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            body: ProfileScreen(),
          );
        },
      ),
    );
  }
}
