import 'package:bestfitnesstrackereu/extensions/string_extensions.dart';
import 'package:bestfitnesstrackereu/pages/information/information_view.dart';
import 'package:bestfitnesstrackereu/pages/login/authentication.dart';
import 'package:bestfitnesstrackereu/pages/neuigkeiten/neuigkeiten_view.dart';
import 'package:bestfitnesstrackereu/routing/route_names.dart';
import 'package:flutter/material.dart';
import '../pages/404/error_page.dart';
import '../pages/registration/regristration_view.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name.getRoutingData; // Get the routing Data
  switch (routingData.route) {
    case InformationRoute:
      return _getPageRoute(InformationView(), settings);
    case NeuigkeitenRoute:
      return _getPageRoute(NeuigkeitenView(), settings);
    case AuthenticationPageRoute:
      return _getPageRoute(AuthenticationPage(), settings);
    case RegristrationRoute:
      return _getPageRoute(RegistrationView(), settings);
    default:
      return _getPageRoute(PageNotFound(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(
    child: child,      //Widget child for displaying the widget/view/page
    routeName: settings.name    //routeName for named routing
  );
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;      //Widget child for returning the widget/view/page
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
    settings: RouteSettings(name: routeName),     //setting routeName
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) => child,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}