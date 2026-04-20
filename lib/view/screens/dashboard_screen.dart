import 'package:flutter/material.dart';
import 'package:not_todo/coordinator/coordinator.dart';
import 'package:not_todo/view/pages/Dashboard/dashboard.dart';
import 'package:not_todo/view/viewmodels/dashboard_viewmodel.dart';
import 'package:not_todo/view/widgets/homeNavBar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  IconButton profileIcon({required BuildContext context}) {
    return IconButton(
      onPressed: () {
        Coordinator(context: context).profile();
      },
      icon: Icon(Icons.person),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not to DO!"),
        actions: [
          IconButton(
            onPressed: () {
              dashboardViewModel.toggleBrightness();
            },
            icon: dashboardViewModel.bightnessIcon,
          ),
          profileIcon(context: context),
          IconButton(
            onPressed: () {
              Coordinator(context: context).logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Dashboard(),
      bottomNavigationBar: HomeNavBar(),
    );
  }
}
