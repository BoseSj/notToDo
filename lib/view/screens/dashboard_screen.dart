import 'package:flutter/material.dart';
import 'package:not_todo/view/pages/Dashboard/dashboard.dart';
import 'package:not_todo/view/screens/profile_screen.dart';
import 'package:not_todo/view/viewmodels/dashboard_viewmodel.dart';
import 'package:not_todo/view/widgets/homeNavBar.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });

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
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
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
                },
                icon: Icon(Icons.person),
              );
            },
          ),
        ],
      ),
      body: Dashboard(),
      bottomNavigationBar: HomeNavBar(),
    );
  }
}
