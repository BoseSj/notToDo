import 'package:flutter/material.dart';
import 'package:not_todo/view/viewmodels/dashboard_viewmodel.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: dashboardViewModel,
      builder: (context, child) {
        return NavigationBar(
          selectedIndex: dashboardViewModel.selectedPageIndex,
          onDestinationSelected: (int index) {
            dashboardViewModel.selectPage(index);
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.feed), label: "Feed"),
            NavigationDestination(icon: Icon(Icons.people), label: "Following"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
        );
      },
    );
  }
}
