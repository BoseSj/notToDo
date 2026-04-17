import 'package:flutter/material.dart';
import 'package:not_todo/view/pages/Dashboard/dashboard_tree.dart';
import 'package:not_todo/view/viewmodels/dashboard_viewmodel.dart';


final dashboardViewModel = DashboardViewModel();

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: dashboardViewModel,
      builder: (context, child) {
        return Center(
          child: homeScreenTabs.elementAt(dashboardViewModel.selectedPageIndex),
        );
      },
    );
  }
}
