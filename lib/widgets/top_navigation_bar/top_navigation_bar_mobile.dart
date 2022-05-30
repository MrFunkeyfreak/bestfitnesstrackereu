import 'package:bestfitnesstrackereu/widgets/top_navigation_bar/top_navigation_bar_logo.dart';
import 'package:flutter/material.dart';

  Widget TopNavigationBarMobile(GlobalKey<ScaffoldState> key) =>
    AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.white,
      leading:
          IconButton(
            icon: Icon(Icons.menu,
            color: Colors.black,
            ),
            onPressed: () {
              key.currentState.openDrawer();
            },),
          title: TopNavBarLogo(),
      );

