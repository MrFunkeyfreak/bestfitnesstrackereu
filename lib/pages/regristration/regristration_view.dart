
import 'package:bestfitnesstrackereu/routing/route_names.dart';
import 'package:flutter/material.dart';

class RegristrationView extends StatefulWidget {
  const RegristrationView({Key key}) : super(key: key);

  @override
  State<RegristrationView> createState() => _RegristrationViewState();
}

class _RegristrationViewState extends State<RegristrationView> {
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
                    Text("Registrierung",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold
                        )),
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  children: [
                    Text(
                        "Welcome to the registrations panel",
                        style: TextStyle(
                          color: Colors.grey,))
                  ],
                ),

                SizedBox(height: 15,),

                TextField(
                  decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "Max123",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),

                SizedBox(height: 15,),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password Wiederholung",
                      hintText: "******",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),

                SizedBox(height: 15,),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Vorname",
                      hintText: "Max",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),

                SizedBox(height: 15,),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Nachname",
                      hintText: "Mustermann",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),

                SizedBox(height: 15,),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Geburtsdatum",
                      hintText: "TT/MM/JJJJ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),

                SizedBox(height: 15,),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Geschlecht",
                      hintText: "M/W",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),

                SizedBox(height: 15,),

                InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(InformationRoute);
                    },
                    child: Container(
                        decoration: BoxDecoration(color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Registrieren",
                          style: TextStyle(
                            color: Colors.black,
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