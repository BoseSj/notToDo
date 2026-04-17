import 'package:flutter/material.dart';

class DashboardViewModel extends ChangeNotifier {
  int _selectedPageIndex = 0;

  int get selectedPageIndex => _selectedPageIndex;
  Brightness get selectedPageBrightness {
    return (selectedPageIndex % 2 != 0) ? .dark : .light;
  }

  void selectPage(int index) {
    _selectedPageIndex = index;
    notifyListeners();
  }
}

final dashboardViewModel = DashboardViewModel();
