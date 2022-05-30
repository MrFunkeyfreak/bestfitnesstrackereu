import 'package:flutter/material.dart';
import '../../routing/route_names.dart';
import '../top_navbar_item/top_navbar_item.dart';
import 'sidemenu_drawer_header.dart';

class SideMenuDrawer extends StatelessWidget {

//drawer für hamburgericon (menu) in mobile screen
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 16),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            SideMenuDrawerHeader(),
            TopNavBarItem(
              'Information',
              InformationRoute,
              icon: IconData(0xe318, fontFamily: 'MaterialIcons'),
            ),
            TopNavBarItem(
              'Neuigkeiten',
              NeuigkeitenRoute,
              icon: Icons.videocam,
            ),
            Spacer(),
            TopNavBarItem(
                'Login',
                AuthenticationPageRoute,
                icon: IconData(0xe3b2, fontFamily: 'MaterialIcons')
            ),
            TopNavBarItem(
                'Teilnehmer \n werden',
                RegristrationRoute,
                icon: IconData(0xe08c, fontFamily: 'MaterialIcons'),
            ),
          ],
        ),
      ),
    );
  }
}