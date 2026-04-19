import 'package:flutter/material.dart';
import 'package:not_todo/view/pages/Dashboard/dashboard.dart';
import 'package:not_todo/view/viewmodels/dashboard_viewmodel.dart';
import 'package:not_todo/view/widgets/homeNavBar.dart';
// import 'package:not_todo/view/pages/home_tree.dart';

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
          home: Scaffold(
            appBar: AppBar(
              title: const Text("Not to DO!"),
              actions: [
                IconButton(
                  onPressed: () {
                    dashboardViewModel.toggleBrightness();
                  },
                  icon: dashboardViewModel.bightnessIcon,
                ),
              ],
            ),
            body: Dashboard(),
            bottomNavigationBar: HomeNavBar(),
          ),
        );
      },
    );
  }
}
