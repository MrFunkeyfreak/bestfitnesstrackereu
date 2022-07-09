import 'package:flutter/material.dart';

// used to navigate to the pages - for this using a global key and the navigateTo
// used in every navigation
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    navigatorKey.currentState.pop();
    //return navigatorKey.currentState.pushNamed(routeName);
    return navigatorKey.currentState.pushNamedAndRemoveUntil(routeName, (Route route) => false);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }
}