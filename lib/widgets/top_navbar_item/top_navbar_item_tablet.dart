import 'package:flutter/material.dart';
import '../../datamodels/navbar_item_model.dart';

class TopNavBarItemTablet extends StatelessWidget {
  final NavBarItemModel model;
  TopNavBarItemTablet({this.model});

  @override
  Widget build(
      BuildContext context,
      ) {
    return Text(
      model.title,
      style: TextStyle(fontSize: 16),
    );
  }
}
