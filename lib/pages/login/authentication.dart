import 'package:bestfitnesstrackereu/routing/route_names.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth.dart';
import '../../widgets/loading_circle/loading_circle.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  var userData;

  @override
  void dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Center(
        child: authProvider.status == Status.Authenticating? Loading() : Container(
          constraints: BoxConstraints(maxWidth: 440),
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Image.asset("assets/logo.png"),
                  ),
                  Expanded(child: Container()),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              Row(
                children: [
                  Text("Login",
                    style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold
                  )),
                ],
              ),

              SizedBox(height: 10,),

              Row(
                children: [
                  Text(
                    "Wilkommen zurück zum Login",
                    style: TextStyle(
                    color: Colors.grey,))
                ],
              ),

              SizedBox(height: 15,),

              TextField(
                controller: authProvider.emailController,
                decoration: InputDecoration(
                  labelText: "E-Mail",
                  hintText: "abc@domain.com",
                    suffixIcon: Icon(Icons.mail_outline,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),

              SizedBox(height: 15,),

              TextField(
                controller: authProvider.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Passwort",
                    hintText: "******",
                    suffixIcon: Icon(Icons.lock_outline, color: Colors.grey,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        authProvider.clearController();
                        Navigator.of(context).pushNamed(ForgotPasswordRoute);
                        },
                      child: Text(
                        'Passwort vergessen',
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 15,),

              InkWell(
                onTap: () async {
                  Map<String, dynamic> mapUserinformations = {};
                  mapUserinformations = await authProvider.getUserByEmail();

                  print("uid: "+ mapUserinformations['uid']);
                  print("status: "+ mapUserinformations['status']);
                  print("rolle: "+ mapUserinformations['role']);

                  //status from user = locked
                  if(mapUserinformations['status'] == 'gesperrt'){
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Error: Dein Account ist gesperrt"),
                        actions: [
                          TextButton(
                            child: Text("Ok"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
                  }

                  //status from user = deleted
                  if(mapUserinformations['status'] == 'gelöscht'){
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Error: Dein Account wurde gelöscht. Er existiert nicht mehr."),
                        actions: [
                          TextButton(
                            child: Text("Ok"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
                  }

                  //status from user = active
                  if(mapUserinformations['status'] == 'aktiv') {
                    //role from user = admin
                    if (mapUserinformations['role'] == 'Admin') {
                      print('admin - am einloggen');
                      if(!await authProvider.signIn()){      //signIn failed, then return "Login failed"
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login fehlgeschlagen!"))
                        );
                        return;
                      }
                      else {
                        authProvider.clearController(); //if signIn is success, then clear controller
                        Navigator.of(context).pushNamed(UsersAdministrationRoute);
                      }
                    }

                    //role from user = scientist
                    if (mapUserinformations['role'] == 'Wissenschaftler') {
                      print('scientist - am einloggen');
                      if(!await authProvider.signIn()){      //signIn failed, then return "Login failed"
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login fehlgeschlagen!"))
                        );
                        return;
                      }
                      else {
                        authProvider.clearController(); //if signIn is success, then clear controller
                        Navigator.of(context).pushNamed(UsersAdministrationRoute);
                      }
                    }

                    //role from user = user
                    if (mapUserinformations['role'] == 'User') {
                      print('user - kein zugriff');
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Error: Du hast keine Zugriffsberichtigung auf diesen Login."),
                          actions: [
                            TextButton(
                              child: Text("Ok"),
                              onPressed: () {
                                authProvider.clearController();
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      });
                    }
                  }
                },

                child: Container(
                  decoration: BoxDecoration(color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Login",
                    style: TextStyle(
                    color: Colors.white,
                  ),)
              )
              ),

              SizedBox(height: 15,),

              Row(
                children: [
                  Expanded(
                      child: Divider(
                        height: 50,
                         color: Colors.grey[500],
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Du bist noch nicht registriert?'),
                  ),
                  Expanded(
                      child: Divider(
                        height: 50,
                        color: Colors.grey[500],
                      )
                  ),
                ],
              ),

              SizedBox(height: 15,),

              InkWell(
                  onTap: (){
                    authProvider.clearController();
                    Navigator.of(context).pushNamed(RegristrationUserRoute);
                  },
                  child: Container(
                      decoration: BoxDecoration(color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Teilnehmer werden",
                        style: TextStyle(
                          color: Colors.white,
                        ),)
                  )
              ),
            ],
          ),
        )
      ),
    );
  }
}