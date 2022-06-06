import 'package:flutter/material.dart';

class RadioButtonGender extends StatelessWidget {
  int btnValue;
  String title;
  Function onChanged;
  String genderSelected;

  RadioButtonGender(this.btnValue, this.title, this.genderSelected, this.onChanged, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List gender = [ "Männlich", "Weiblich"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme
              .of(context)
              .primaryColor,
          value: gender[btnValue],
          groupValue: genderSelected,
          onChanged: onChanged,
        ),
        Text(title)
      ],
    );
  }
}

class RadioButtonRole extends StatelessWidget {
  int btnValue;
  String title;
  Function onChanged;
  String roleSelected;

  RadioButtonRole(this.btnValue, this.title, this.roleSelected, this.onChanged, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List role = [ "User", "Wissenschaftler", "Admin"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme
              .of(context)
              .primaryColor,
          value: role[btnValue],
          groupValue: roleSelected,
          onChanged: onChanged,
        ),
        Text(title)
      ],
    );
  }
}

