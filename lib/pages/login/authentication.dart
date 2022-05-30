
import 'package:bestfitnesstrackereu/routing/route_names.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool checkBoxValue = false;
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
                    "Welcome back to the login panel",
                    style: TextStyle(
                    color: Colors.grey,))
                ],
              ),

              SizedBox(height: 15,),

              TextField(
                decoration: InputDecoration(
                  labelText: "E-Mail",
                  hintText: "abc@domain.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),

              SizedBox(height: 15,),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "******",
                    counterText: 'Forgot password?',
                    suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
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
                onTap: (){
                  Navigator.of(context).pushNamed(InformationRoute);
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