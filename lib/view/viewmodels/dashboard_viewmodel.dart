import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DashboardViewModel extends ChangeNotifier {
  int _selectedPageIndex = 0;

  int get selectedPageIndex => _selectedPageIndex;
  Brightness get selectedBrightness => _selectedBrightness;
  Brightness _selectedBrightness = .light;

  void toggleBrightness() {
    _selectedBrightness = _selectedBrightness == .dark ? .light : .dark;
    notifyListeners();
  }

  Icon get bightnessIcon {
    return _selectedBrightness == .light
        ? Icon(Icons.light_mode)
        : Icon(Icons.dark_mode);
  }

  void selectPage(int index) {
    _selectedPageIndex = index;
    notifyListeners();
  }
}

final dashboardViewModel = DashboardViewModel();

ValueNotifier<int> selectedIndex = ValueNotifier(12);
