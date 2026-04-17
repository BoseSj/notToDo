import 'package:flutter/material.dart';

class DashboardViewModel extends ChangeNotifier {
  int _selectedPageIndex = 0;

  int get selectedPageIndex => _selectedPageIndex;

  void selectPage(int index) {
    _selectedPageIndex = index;
    notifyListeners();
  }
}

final dashboardViewModel = DashboardViewModel();
