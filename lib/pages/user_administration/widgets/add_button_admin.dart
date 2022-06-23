

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth.dart';
import '../../../provider/users_table.dart';
import '../../registration/widgets/radiobuttons.dart';

class AddButtonAdmin extends StatefulWidget {
  const AddButtonAdmin({Key key}) : super(key: key);

  @override
  State<AddButtonAdmin> createState() => _AddButtonAdminState();
}

class _AddButtonAdminState extends State<AddButtonAdmin> {
  List gender = [ "Männlich", "Weiblich" ];
  String genderSelected;

  String roleSelected;

  String _birthDateInString;
  DateTime birthDate;
  bool isDateSelected= false;

  Map<String, dynamic> mapUserinformations = {};

  AuthProvider authproviderInstance = AuthProvider();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final UsersTable userTable = Provider.of<UsersTable>(context);

    return TextButton.icon(
      onPressed: () => {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        content: Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Positioned(
                              right: -40.0,
                              top: -40.0,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: CircleAvatar(
                                  child: Icon(Icons.close),
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center,
                                    children: [
                                      Text("User hinzufügen",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight
                                                  .bold
                                          )),
                                    ],
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: authproviderInstance.usernameController,
                                      decoration: InputDecoration(
                                          labelText: "Benutzername",
                                          hintText: "Max123",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(20)
                                          )
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: authproviderInstance.emailController,
                                      decoration: InputDecoration(
                                          labelText: "E-Mail",
                                          hintText: "abc@domain.com",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(20)
                                          )
                                      ),
                                    ),),

                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: authproviderInstance.passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          labelText: "Passwort",
                                          hintText: "******",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(20)
                                          )
                                      ),
                                    ),),

                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: authproviderInstance.passwordConfirmedController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          labelText: "Passwort wiederholen",
                                          hintText: "******",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(20)
                                          )
                                      ),
                                    ),),

                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: authproviderInstance.firstNameController,
                                      decoration: InputDecoration(
                                          labelText: "Vorname",
                                          hintText: "Max",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(20)
                                          )
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: authproviderInstance.lastNameController,
                                      decoration: InputDecoration(
                                          labelText: "Nachname",
                                          hintText: "Mustermann",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(20)
                                          )
                                      ),
                                    ),
                                  ),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: [

                                      Text(
                                        "Geburtsdatum:",
                                        style: TextStyle(
                                            fontSize: 18),
                                      ),

                                      GestureDetector(
                                        child: new Icon(
                                          Icons.calendar_today,
                                          size: 30,),
                                        onTap: () async {
                                          final DateTime datePick = await showDatePicker(
                                            locale: const Locale('de'),
                                            context: context,
                                            initialDate: new DateTime.now(),
                                            firstDate: new DateTime(1900),
                                            lastDate: new DateTime(2100),
                                            initialEntryMode: DatePickerEntryMode.input,
                                            errorFormatText: 'Enter valid date',
                                            errorInvalidText: 'Enter date in valid range',
                                            fieldLabelText: 'Birthdate',
                                            fieldHintText: 'TT/MM/YYYY',
                                          );
                                          if (datePick != null &&datePick != birthDate) {
                                            setState(() {
                                              birthDate = datePick;
                                              isDateSelected = true;

                                              // birthdate in string
                                              _birthDateInString ="${birthDate.day}/${birthDate.month}/${birthDate.year}";
                                              print('' +_birthDateInString);
                                            });
                                          }
                                        },
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: <Widget>[

                                      Text(
                                        "Geschlecht:",
                                        style: TextStyle(
                                            fontSize: 18),
                                        textAlign: TextAlign.start,
                                      ),

                                      SizedBox(width: 10,),

                                      RadioButtonGender(
                                          0, 'Männlich', genderSelected, (newValue) {
                                        print(newValue);
                                        setState(() =>
                                        genderSelected = newValue);
                                      }),
                                      RadioButtonGender(
                                          1, 'Weiblich', genderSelected, (newValue) {
                                        print(newValue);
                                        setState(() =>
                                        genderSelected = newValue);
                                      }),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        "Rolle:",
                                        style: TextStyle(
                                            fontSize: 18),
                                        textAlign: TextAlign.start,
                                      ),

                                      SizedBox(width: 10,),


                                      RadioButtonRole(
                                          0, 'User', roleSelected, (newValue) {
                                        print(newValue);
                                        setState(() =>
                                        roleSelected = newValue);
                                      }),
                                      RadioButtonRole(
                                          1, 'Wissenschaftler', roleSelected, (newValue) {
                                        print(newValue);
                                        setState(() =>
                                        roleSelected = newValue);
                                      }),
                                      RadioButtonRole(
                                          2, 'Admin', roleSelected, (newValue) {
                                        print(newValue);
                                        setState(() =>
                                        roleSelected = newValue);
                                      }),

                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(
                                        8.0),
                                    child: ElevatedButton(
                                      child: Text("Hinzufügen"),
                                      onPressed: () async {

                                        if (_formKey.currentState.validate()) {

                                          //alle infos von den controllern holen und user erstellen
                                          print('pw confirmed:' + authproviderInstance.passwordConfirmedController.text.trim());
                                          print('pw:' + authproviderInstance.passwordController.text.trim());


                                          //password and passworconfirm check
                                          if(authproviderInstance.passwordConfirmedController.text.trim() == authproviderInstance.passwordController.text.trim()) {

                                            //checking that all textfields are not empty
                                            if (authproviderInstance.usernameController.text.trim() != null && authproviderInstance.emailController.text.trim() != null
                                                && authproviderInstance.passwordController.text.trim() != null && authproviderInstance.passwordConfirmedController.text.trim() != null
                                                && authproviderInstance.firstNameController.text.trim() != null && authproviderInstance.lastNameController.text.trim() != null
                                                && _birthDateInString != null && genderSelected != null ) {


                                              print('test');
                                              mapUserinformations = await authproviderInstance.getUserByEmail();

                                              //wenn email exist, then check status
                                              if (mapUserinformations != null){
                                                print('email is already existing');
                                                if(mapUserinformations['status'] == 'gelöscht'){
                                                  print('email is deleted');
                                                  //recreate the deleted user
                                                  try{
                                                    //passwort abändern von auth
                                                    await authproviderInstance.updateUserSignup(mapUserinformations['uid'], _birthDateInString, genderSelected, 'user');
                                                    authproviderInstance.clearController();

                                                    //alert einbauen nach seiten wechseln ohne dass error passiert
                                                    showDialog(context: context, builder: (BuildContext context){
                                                      return AlertDialog(
                                                        title: Text("Registration abgeschlossen. Du kannst dich nun in unserer App einloggen."),
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
                                                    _formKey.currentState.save();
                                                    Navigator.of(context).pop();
                                                    authproviderInstance.clearController();
                                                    userTable.initializeData();
                                                  }
                                                  catch(e) {
                                                    print(e);
                                                  }
                                                }
                                                else{
                                                  showDialog(context: context, builder: (BuildContext context){
                                                    return AlertDialog(
                                                      title: Text("Error: Es existiert schon ein Account mit dieser E-Mail Adresse."),
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
                                              }
                                              else{
                                                try{
                                                  print('email existiert noch nicht');
                                                  await authproviderInstance.signUpUser(_birthDateInString, genderSelected);
                                                  authproviderInstance.clearController();

                                                  showDialog(context: context, builder: (BuildContext context){
                                                    return AlertDialog(
                                                      title: Text("Registration abgeschlossen. Du kannst dich nun in unserer App einloggen."),
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
                                                  _formKey.currentState.save();
                                                  Navigator.of(context).pop();
                                                  authproviderInstance.clearController();
                                                  userTable.initializeData();
                                                }
                                                catch(e) {
                                                  print(e);
                                                }
                                              }


                                              //if signIn is success, then signUp + clear controller

                                              /*if(authProvider.validateEmail(authProvider.email.text.trim()) == null){
                                                print('validate email okok');
                                                  }
                                                   else{
                                                    print('validate email notgoodatall');
                                                     }             -> email checken, dass es bestimmtes format einhält */


                                            }
                                            else {      //signIn failed, then return Login failed
                                              showDialog(context: context, builder: (BuildContext context){
                                                return AlertDialog(
                                                  title: Text("Error: Registration gescheitert! Bitte alle Felder ausfüllen."),
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
                                              return;
                                            }

                                          } else {
                                            showDialog(context: context, builder: (BuildContext context){
                                              return AlertDialog(
                                                title: Text("Error: Passwort und Passwort wiederholen müssen gleich sein!"),
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
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              })
      },
        icon: Icon(
          Icons.add,
          color: Colors.black,
        ),
      label: Text("Hinzufügen",
          style: TextStyle(
              color: Colors.black
          )
      ),
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all<Color>(Colors.grey),
        padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.all(10)),
      ),
    );
  }
}
