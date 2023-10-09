import 'package:flutter/material.dart';
import 'package:yours_todo/views/bottom_navigation_screen.dart';
import 'package:yours_todo/views/recycle_bin_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBinScreen.id:
        return MaterialPageRoute(builder: (_) => const RecycleBinScreen());
      case BottomNavigationScreen.id:
        return MaterialPageRoute(builder: (_) => BottomNavigationScreen());
      default:
        return null;
    }
  }
}
