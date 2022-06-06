import 'package:bestfitnesstrackereu/extensions/string_extensions.dart';
import 'package:bestfitnesstrackereu/pages/dashboard/dashboard_view.dart';
import 'package:bestfitnesstrackereu/pages/forgot_password/forgot_password_view.dart';
import 'package:bestfitnesstrackereu/pages/information/information_view.dart';
import 'package:bestfitnesstrackereu/pages/login/authentication.dart';
import 'package:bestfitnesstrackereu/pages/neuigkeiten/neuigkeiten_view.dart';
import 'package:bestfitnesstrackereu/pages/profile/profile_view.dart';
import 'package:bestfitnesstrackereu/pages/registration/registration_admins_view.dart';
import 'package:bestfitnesstrackereu/pages/registration/registration_scientist_view.dart';
import 'package:bestfitnesstrackereu/routing/route_names.dart';
import 'package:flutter/material.dart';
import '../pages/404/error_page.dart';
import '../pages/registration/registration_users_view.dart';
import '../pages/user_administration/user_administration_view.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name.getRoutingData; // Get the routing Data
  switch (routingData.route) {
    case InformationRoute:
      return _getPageRoute(InformationView(), settings);
    case NeuigkeitenRoute:
      return _getPageRoute(NeuigkeitenView(), settings);
    case AuthenticationPageRoute:
      return _getPageRoute(AuthenticationPage(), settings);
    case RegristrationUserRoute:
      return _getPageRoute(RegistrationUsersView(), settings);
    case RegristrationScientistRoute:
      return _getPageRoute(RegistrationScientistView(), settings);
    case RegristrationAdminRoute:
      return _getPageRoute(RegistrationAdminsView(), settings);
    case DashboardRoute:
      return _getPageRoute(DashboardView(), settings);
    case ForgotPasswordRoute:
      return _getPageRoute(ForgotPasswordView(), settings);
    case ProfileRoute:
      return _getPageRoute(ProfileView(), settings);
    case UsersAdministrationRoute:
      return _getPageRoute(UserAdministrationView(), settings);
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