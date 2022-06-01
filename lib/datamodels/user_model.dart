import 'package:flutter/material.dart';

@immutable
class User {
  final String uid;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String birthday;
  final String gender;

  const User({
    @required this.uid,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.birthday,
    this.gender
});



}