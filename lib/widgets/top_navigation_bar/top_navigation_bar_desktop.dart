import 'package:bestfitnesstrackereu/widgets/top_navigation_bar/top_navigation_bar_logo.dart';
import 'package:flutter/material.dart';
import '../../routing/route_names.dart';
import '../top_navbar_item/top_navbar_item.dart';

class TopNavigationBarDesktop extends StatelessWidget {
  const TopNavigationBarDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool currentRouteIsAdmin = false;
    bool currentRouteIsUser = false;
    bool currentRouteIsScientist = false;

    Navigator.popUntil(context, (currentRoute) {
      if (currentRoute.settings.name == RegristrationScientistRoute || currentRoute.settings.name == RegristrationAdminRoute ||
          currentRoute.settings.name == DashboardRoute || currentRoute.settings.name == UsersAdministrationRoute) {
        currentRouteIsAdmin = true;
      }
      if (currentRoute.settings.name == RegristrationScientistRoute ) {
        currentRouteIsScientist = true;
      }
      if (currentRoute.settings.name == InformationRoute || currentRoute.settings.name == NeuigkeitenRoute ||
          currentRoute.settings.name == AuthenticationPageRoute || currentRoute.settings.name == RegristrationUserRoute ||
          currentRoute.settings.name == ForgotPasswordRoute) {
        currentRouteIsUser = true;
      }
      // Return true so popUntil() pops nothing.
      return true;
    });

    if(currentRouteIsUser == true){

    return Container(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          SizedBox(width: 30,),
          TopNavBarLogo(),
          SizedBox(width: 30,),
          Visibility(child: Text( "TheBestFitnessTracker", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal,))),

          Spacer(),      //Space between logo+text and widgets in the center of the row
          TopNavBarItem('Informationen', InformationRoute),
          SizedBox(width: 40,),
          TopNavBarItem('Neuigkeiten', NeuigkeitenRoute),
          SizedBox(width: 40,),

          Spacer(), //Space between widgets in the center of the row and end of row
          SizedBox(width: 40,),
          TopNavBarItem('Login', AuthenticationPageRoute),
          SizedBox(width: 40,),
          TopNavBarItem('Teilehmer \n werden', RegristrationUserRoute),
          SizedBox(width: 40,),

        ],
      ),
        );}


    if(currentRouteIsAdmin == true) {
      return Container(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            SizedBox(width: 30,),
            TopNavBarLogo(),
            SizedBox(width: 30,),
            Visibility(child: Text( "Adminpage", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal,))),

            Spacer(),      //Space between logo+text and widgets in the center of the row
            TopNavBarItem('Userverwaltung', UsersAdministrationRoute),
            SizedBox(width: 40,),
            TopNavBarItem('Dashboard', DashboardRoute),
            SizedBox(width: 40,),

            Spacer(), //Space between widgets in the center of the row and end of row
            SizedBox(width: 40,),
            TopNavBarItem('Login', AuthenticationPageRoute),
            SizedBox(width: 40,),
            TopNavBarItem('Teilehmer \n werden', RegristrationUserRoute),
            SizedBox(width: 40,),

          ],
        ),
      );
    }
    if (currentRouteIsScientist == true) {
      return Container(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            SizedBox(width: 30,),
            TopNavBarLogo(),
            SizedBox(width: 30,),
            Visibility(child: Text( "Wissenschaftler", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal,))),

            Spacer(),      //Space between logo+text and widgets in the center of the row
            TopNavBarItem('Userverwaltung', UsersAdministrationRoute),
            SizedBox(width: 40,),
            TopNavBarItem('Dashboard', DashboardRoute),
            SizedBox(width: 40,),

            Spacer(), //Space between widgets in the center of the row and end of row
            SizedBox(width: 40,),
            TopNavBarItem('Login', AuthenticationPageRoute),
            SizedBox(width: 40,),
            TopNavBarItem('Teilehmer \n werden', RegristrationUserRoute),
            SizedBox(width: 40,),

          ],
        ),
      );
    }
  }
}