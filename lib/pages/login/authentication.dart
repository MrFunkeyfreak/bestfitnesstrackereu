import 'package:bestfitnesstrackereu/routing/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool checkBoxValue = false;
  //textfield controllers:
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  Future signIn() async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      );
    } on FirebaseAuthException catch (e){
      print(e);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
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
                controller: _emailController,
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
                controller: _passwordController,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: checkBoxValue,
                          onChanged: (value){
                            setState(() {
                              checkBoxValue = value;
                            });
                      }),
                      Text("Admin/Wissenschaftler",)
                    ],
                  ),
                ],
              ),

              SizedBox(height: 15,),

              InkWell(
                onTap: () async {
                  await signIn();
                  Navigator.of(context).pushNamed(DashboardRoute);
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
                    Navigator.of(context).pushNamed(RegristrationRoute);
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