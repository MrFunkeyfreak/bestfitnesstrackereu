import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../datamodels/user_model.dart';
import '../services/user_services.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {

  AuthProvider({Key key});

  User _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  //  getter
  UserModel get userModel => _userModel;
  Status get status => _status;
  User get user => _user;

  // public variables
  final formkey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmedController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();


  AuthProvider.initialize() {
    _fireSetUp();
  }

  _fireSetUp() async {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCaos63TeR_y3YVXxD5x180IYz3ssQeWHE",
        appId: "1:414667114455:web:e0d8cdd30559bc41576d92",
        messagingSenderId: "414667114455",
        projectId: "thebasics-fb4e8",
      ),).then((value) {
      FirebaseAuth.instance.authStateChanges().listen(_onStateChanged);
    });
  }

  Future<bool> signIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      _status = Status.Authenticating;
      notifyListeners(); //changing status
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim())
          .then((value) async {
        await prefs.setString("id", value.user.uid);  //checking user
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

   Future <void> updateUserEdit(String id,String birthday, String gender, String role)async{
    print("username: " + usernameController.text.trim() + "email: " + emailController.text.trim());
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({'username': usernameController.text.trim(), 'email': emailController.text.trim(),
         'first name': firstNameController.text.trim(), 'last name': lastNameController.text.trim(),
         'birthday': birthday, 'gender': gender, 'role': role,})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future <void> updateUserSignup(String id,String birthday, String gender, String role)async{
    print("username: " + usernameController.text.trim() + "email: " + emailController.text.trim());
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({'username': usernameController.text.trim(), 'email': emailController.text.trim(),
      'first name': firstNameController.text.trim(), 'last name': lastNameController.text.trim(),
      'birthday': birthday, 'gender': gender, 'status': 'aktiv','role': role,})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future <void> updateUser(String id,String birthday, String gender, String role)async{
    print("username: " + usernameController.text.trim() + "email: " + emailController.text.trim());
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({'username': usernameController.text.trim(), 'email': emailController.text.trim(),
      'first name': firstNameController.text.trim(), 'last name': lastNameController.text.trim(),
      'birthday': birthday, 'gender': gender, 'role': role,})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future <void> updateUserStatus(String id, String status )async{
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({'status': status})
        .then((value) => print("User status Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<Map<String, dynamic>> getUserByEmail() async {
    var userData;
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: emailController.text.trim())
        .get()
        .then((QuerySnapshot docs) {

            if (docs.docs.isNotEmpty){
              print('test not empty + emailcontroller: '+emailController.text.trim() );
            userData = docs.docs[0].data();
          }
    });
    return userData;
  }


  Future <bool> getAdminExistence()async{  //bearbeiten
    print('hier wird abgefragt: '+emailController.text.trim());
    var i = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: emailController.text.trim(),)
        .get();
    if(i.size > 0){
      print('mit der email gibt admins: '+i.size.toString());
      return true;
    }
    else{
      return false;
    }
  }

  Future <bool> getScientistExistence()async{ //bearbeiten
    var i = await FirebaseFirestore.instance
        .collection('scientists')
        .where('email', isEqualTo: emailController.text.trim())
        .get();
    if(i.size > 0){
      return true;
    }
    else{
      return false;
    }
  }

  static Future deleteUser(String uid) async {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .delete();

      //await FirebaseAuth.instance.  user(uid).onDelete(uid);

  }

  Future<bool> signUpUser(String birthday, String gender) async {
    try {
      _status = Status.Authenticating;
      notifyListeners(); //changing status
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim())
          .then((result) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("id", result.user.uid);  //userid setzen
        _userServices.createUser(
          uid: result.user.uid,
          username: usernameController.text.trim(),
          email: emailController.text.trim(),
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          birthday: birthday,
          gender: gender,
          status: 'aktiv',
          role: 'User',
        );});
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    FirebaseAuth.instance.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero); //need to return a future
  }

  void clearController() {
    usernameController.text = '';
    emailController.text = '';
    passwordController.text = '';
    passwordConfirmedController.text = '';
    firstNameController.text = '';
    lastNameController.text = '';
  }

  Future<void> reloadUserModel() async {  //reloading user data
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }

  updateUserData(Map<String, dynamic> data) async {  //update user data
    _userServices.updateUserData(data);
  }

  _onStateChanged(User firebaseUser) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else { //when firebase user exist
      _user = firebaseUser;
      await prefs.setString("id", firebaseUser.uid);

      _userModel = await _userServices.getUserById(user.uid).then((value) {  //checking if user is admin
        _status = Status.Authenticated;
        return value;  //userModel
      });
    }
    notifyListeners();
  }

  String validateEmail(String value) { //validate the email textfield
    value = value.trim();

    if (emailController.text != null) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Enter a correct email address';
      }
    }

    return null;
  }
}