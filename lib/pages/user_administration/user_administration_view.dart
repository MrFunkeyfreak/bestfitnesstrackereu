import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAdministrationView extends StatefulWidget {
  const UserAdministrationView ({Key key}) : super(key: key);

  @override
  State<UserAdministrationView> createState() => _UserAdministrationViewState();
}

class _UserAdministrationViewState extends State<UserAdministrationView> {
  final user = FirebaseAuth.instance.currentUser;

  //überprüfen ob user eingeloggt ist oder nicht
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            Text('Dashboard View - signed in as '),
            SizedBox(height: 8,),
            Text(user.email),
            InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  print('user ist ausgeloggt');
                  //Navigator.of(context).pushNamed(AuthenticationPageRoute);
                },
                child: Container(
                    decoration: BoxDecoration(color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'sign out',
                      style: TextStyle(
                        color: Colors.white,
                      ),)
                )
            ),


          ],
        ),
      ),
    );
  }
}