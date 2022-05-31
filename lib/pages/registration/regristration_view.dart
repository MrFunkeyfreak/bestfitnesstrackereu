import 'package:bestfitnesstrackereu/routing/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../services/firebase_auth_service.dart';


class RegistrationView extends StatefulWidget {
  const RegistrationView({Key key}) : super(key: key);

  @override
  State<RegistrationView> createState() => _RegristrationViewState();
}

class _RegristrationViewState extends State<RegistrationView> {
  List gender = [ "Männlich", "Weiblch" ];
  String _genderSelected;
  String _birthDateInString;
  DateTime birthDate;
  bool isDateSelected= false;

  //textfield controllers:
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: _genderSelected,
          onChanged: (value){
            setState(() {
              print(value);
              _genderSelected=value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  Future signUp() async{

    //authenticate user
    if(passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      );

      //add user details
      addUserDetails(
        _usernameController.text.trim(),
        _emailController.text.trim(),
        _firstNameController.text.trim(),
        _nameController.text.trim(),
        _birthDateInString,
        _genderSelected
      );
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() == _confirmPasswordController.text.trim()) {
      return true;
    }else{
        return false;
    }
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
                  controller: _usernameController,
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
                  controller: _emailController,
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
                  controller: _passwordController,
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
                  controller: _confirmPasswordController,
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
                  controller: _firstNameController,
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
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: "Nachname",
                      hintText: "Mustermann",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),

                SizedBox(height: 15,),

                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(width: 11,),

                    Text(
                      "Geburtsdatum:",
                      style: TextStyle(fontSize: 18),
                    ),

                    SizedBox(width: 90,),

                    GestureDetector(
                      child: new Icon(Icons.calendar_today, size: 30,),
                      onTap: ()async{
                        final DateTime datePick= await showDatePicker(context: context,
                          initialDate: new DateTime.now(),
                          firstDate: new DateTime(1900),
                          lastDate: new DateTime(2100),
                          initialEntryMode: DatePickerEntryMode.input,
                          errorFormatText: 'Enter valid date',
                          errorInvalidText: 'Enter date in valid range',
                          fieldLabelText: 'Birthdate',
                          fieldHintText: 'TT/MM/YYYY',
                        );
                        if(datePick!=null && datePick!=birthDate){
                          setState(() {
                            birthDate=datePick;
                            isDateSelected=true;

                            // put it here
                            _birthDateInString = "${birthDate.month}/${birthDate.day}/${birthDate.year}"; // 08/14/2019
                            print(''+ _birthDateInString);

                          });
                        }
                      },
                    ),
                  ],
                ),

                SizedBox(height: 15,),

                /*Text(
                  "Geschlecht",
                  style: TextStyle(fontSize: 19),
                  textAlign: TextAlign.start,
                ),*/

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Geschlecht:",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),

                      SizedBox(width: 10,),


                      addRadioButton(0, 'Männlich'),
                      addRadioButton(1, 'Weiblich'),

                    ],
                ),

                SizedBox(height: 15,),

                InkWell(
                    onTap: () async {
                      await signUp();
                      Navigator.of(context).pushNamed(DashboardRoute);
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