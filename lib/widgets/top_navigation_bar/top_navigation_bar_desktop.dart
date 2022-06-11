import 'package:bestfitnesstrackereu/widgets/top_navigation_bar/top_navigation_bar_logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          Visibility(child: Text( "TheBestFitnessTracker", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal,))),

          Spacer(),      //Space between logo+text and widgets in the center of the row
          TopNavBarItem('Informationen', InformationRoute),
          SizedBox(width: 30,),
          TopNavBarItem('Neuigkeiten', NeuigkeitenRoute),
          SizedBox(width: 30,),

          Spacer(), //Space between widgets in the center of the row and end of row
          SizedBox(width: 30,),
          TopNavBarItem('Login', AuthenticationPageRoute),
          SizedBox(width: 30,),
          TopNavBarItem('Teilehmer \n werden', RegristrationUserRoute),
          SizedBox(width: 30,),

        ],
      ),
        );}


    if(currentRouteIsAdmin == true) {
      final user = FirebaseAuth.instance.currentUser;
      return Container(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            SizedBox(width: 30,),
            TopNavBarLogo(),
            SizedBox(width: 15,),
            Visibility(child: Text( "Admin", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal,))),

            Spacer(),      //Space between logo+text and widgets in the center of the row
            TopNavBarItem('Userverwaltung', UsersAdministrationRoute),
            SizedBox(width: 30,),
            TopNavBarItem('Dashboard', DashboardRoute),
            SizedBox(width: 30,),
            TopNavBarItem('Informationen', DashboardRoute),
            SizedBox(width: 30,),
            TopNavBarItem('Neuigkeiten', DashboardRoute),

            Spacer(), //Space between widgets in the center of the row and end of row
            Text('eingeloggt als: \n' + user.email),

            SizedBox(width: 10,),

            TextButton.icon(
              onPressed: () async => {
                await FirebaseAuth.instance.signOut(),
                print('user ist ausgeloggt'),
                Navigator.of(context).pushNamed(AuthenticationPageRoute),
              },
              icon: Icon(
                IconData(0xe3b3, fontFamily: 'MaterialIcons'),
                color: Colors.black,
                size: 20,
              ),
              label: Text("Logout",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14
                  )
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.all(10)),
              ),
            ),
          ],
        ),
      );
    }
    if (currentRouteIsScientist == true) {
      final user = FirebaseAuth.instance.currentUser;
      return Container(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            SizedBox(width: 30,),
            TopNavBarLogo(),
            SizedBox(width: 30,),
            Visibility(child: Text( "Wissenschaftler", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal,))),

            Spacer(),      //Space between logo+text and widgets in the center of the row
            TopNavBarItem('Userverwaltung', UsersAdministrationRoute),
            SizedBox(width: 30,),
            TopNavBarItem('Dashboard', DashboardRoute),
            SizedBox(width: 30,),

            Spacer(), //Space between widgets in the center of the row and end of row
            SizedBox(width: 30,),
            Text('eingeloggt als: \n' + user.email),

            SizedBox(width: 10,),

            TextButton.icon(
              onPressed: () async => {
                await FirebaseAuth.instance.signOut(),
                print('user ist ausgeloggt'),
                Navigator.of(context).pushNamed(AuthenticationPageRoute),
              },
              icon: Icon(
                IconData(0xe3b3, fontFamily: 'MaterialIcons'),
                color: Colors.black,
                size: 20,
              ),
              label: Text("Logout",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14
                  )
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.all(10)),
              ),
            ),
          ],
        ),
      );
    }
  }
}