import 'package:flutter/material.dart';
import 'package:not_todo/view/screens/login_screen.dart';
import 'package:not_todo/view/viewmodels/dashboard_viewmodel.dart';


void main() {
  runApp(const RootWidget());
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: dashboardViewModel,
      builder: (context, child) {
        return MaterialApp(
          title: "Root Widget",
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: dashboardViewModel.selectedBrightness,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: LogInScreen(),
        );
      },
    );
  }
}