import 'package:bestfitnesstrackereu/pages/user_administration/user_administration_view_dekstop.dart';
import 'package:bestfitnesstrackereu/pages/user_administration/user_administration_view_mobile.dart';
import 'package:bestfitnesstrackereu/pages/user_administration/user_administration_view_tablet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

// user_administration page displayer - ScreenTypeLayout decides which screen is getting displayed
// in work - at the moment not in use

class UserAdministrationView extends StatelessWidget {
  const UserAdministrationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: UsersAdministrationViewDesktop(),
      tablet: UsersAdministrationViewTablet(),
      mobile: UsersAdministrationViewMobile(),
    );
  }
}
