import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class SideMenuDrawerHeader extends StatelessWidget {
  const SideMenuDrawerHeader({Key key}) : super(key: key);

  //header of hamburgericon (menu)
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: primaryColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'BestFitnesstrackerEU',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          Text(
            'welcome back',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
