import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/auth.dart';
import '../../../provider/users_table.dart';
import '../../registration/widgets/radiobuttons.dart';

// Button which adds an User to the table and database. Required is to fill out all the fields in the AlertDialog (normal registration as admin)

class AddButtonAdmin extends StatefulWidget {
  const AddButtonAdmin({Key key}) : super(key: key);

  @override
  State<AddButtonAdmin> createState() => _AddButtonAdminState();
}

class _AddButtonAdminState extends State<AddButtonAdmin> {
  String genderSelected;
  String roleSelected;

  String _birthDateInString;
  DateTime birthDate;
  bool isDateSelected = false;

  Map<String, dynamic> mapUserinformations = {};

  AuthProvider authproviderInstance =
      AuthProvider(); // creating Instance of AuthProvider

  static GlobalKey<FormState> _formKeys = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmedController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmedController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  // clear all controllers - used after every click on a button
  void clearController() {
    usernameController.text = '';
    emailController.text = '';
    passwordController.text = '';
    passwordConfirmedController.text = '';
    firstNameController.text = '';
    lastNameController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final UsersTable userTable = Provider.of<UsersTable>(
        context); // initialize the usertable from provider
    _formKeys = GlobalKey<FormState>(debugLabel: '_addbutton admin');

    return TextButton.icon(
      onPressed: () => {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (context, setState) {
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
                        key: _formKeys,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("User hinzufügen",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  validator: (username) {
                                    print(authproviderInstance
                                        .validateUsername(username));
                                    return authproviderInstance
                                        .validateUsername(username);
                                  },
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                      labelText: "Benutzername",
                                      hintText: "Max123",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),

                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  validator: (email) =>
                                      EmailValidator.validate(email)
                                          ? null
                                          : "Bitte gib eine gültige E-Mail an.",
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      labelText: "E-Mail",
                                      hintText: "abc@domain.com",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),

                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  validator: (password) {
                                    print(authproviderInstance
                                        .validatePassword(password));
                                    return authproviderInstance
                                        .validatePassword(password);
                                  },
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      labelText: "Passwort",
                                      hintText: "******",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),

                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  validator: (passwordConfirm) {
                                    print(authproviderInstance
                                        .validatePassword(passwordConfirm));
                                    return authproviderInstance
                                        .validatePassword(passwordConfirm);
                                  },
                                  controller: passwordConfirmedController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      labelText: "Passwort wiederholen",
                                      hintText: "******",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),

                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  validator: (firstName) {
                                    print(authproviderInstance
                                        .validateName(firstName));
                                    return authproviderInstance
                                        .validateName(firstName);
                                  },
                                  controller: firstNameController,
                                  decoration: InputDecoration(
                                      labelText: "Vorname",
                                      hintText: "Max",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),

                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  validator: (lastName) {
                                    print(authproviderInstance
                                        .validateName(lastName));
                                    return authproviderInstance
                                        .validateName(lastName);
                                  },
                                  controller: lastNameController,
                                  decoration: InputDecoration(
                                      labelText: "Nachname",
                                      hintText: "Mustermann",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Geburtsdatum:",
                                  style: TextStyle(fontSize: 18),
                                ),
                                GestureDetector(
                                  child: new Icon(
                                    Icons.calendar_today,
                                    size: 30,
                                  ),
                                  onTap: () async {
                                    final DateTime datePick =
                                        await showDatePicker(
                                      locale: const Locale('de'),
                                      context: context,
                                      initialDate: new DateTime.now(),
                                      firstDate: new DateTime(1900),
                                      lastDate: new DateTime(2100),
                                      initialEntryMode:
                                          DatePickerEntryMode.input,
                                      errorFormatText:
                                          'Gib ein Datum mit dem Format Tag/Monat/Jahr ein',
                                      errorInvalidText:
                                          'Gib ein realistisches Datum ein',
                                      fieldLabelText: 'Geburtstag',
                                      fieldHintText: 'TT/MM/YYYY',
                                    );
                                    if (datePick != null &&
                                        datePick != birthDate) {
                                      setState(() {
                                        birthDate = datePick;
                                        isDateSelected = true;

                                        // birthdate in string
                                        _birthDateInString =
                                            "${birthDate.day}/${birthDate.month}/${birthDate.year}";
                                        print('' + _birthDateInString);
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "Geschlecht:",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),

                                SizedBox(
                                  width: 10,
                                ),

                                // using the radiobuttons in widgets (registration)
                                RadioButtonGender(0, 'Männlich', genderSelected,
                                    (newValue) {
                                  print(newValue);
                                  setState(() => genderSelected = newValue);
                                }),
                                RadioButtonGender(1, 'Weiblich', genderSelected,
                                    (newValue) {
                                  print(newValue);
                                  setState(() => genderSelected = newValue);
                                }),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "Rolle:",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),

                                SizedBox(
                                  width: 10,
                                ),

                                // using the radiobuttons in widgets (registration)
                                RadioButtonRole(0, 'User', roleSelected,
                                    (newValue) {
                                  print(newValue);
                                  setState(() => roleSelected = newValue);
                                }),
                                RadioButtonRole(
                                    1, 'Wissenschaftler', roleSelected,
                                    (newValue) {
                                  print(newValue);
                                  setState(() => roleSelected = newValue);
                                }),
                                RadioButtonRole(2, 'Admin', roleSelected,
                                    (newValue) {
                                  print(newValue);
                                  setState(() => roleSelected = newValue);
                                }),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                child: Text("Hinzufügen"),
                                onPressed: () async {

                                  if (_formKeys.currentState.validate()) {
                                    print('validate okok');

                                  print('pw confirmed:' +
                                      passwordConfirmedController.text.trim());
                                  print('pw:' + passwordController.text.trim());

                                  //password and passworconfirm check
                                  if (passwordConfirmedController.text.trim() ==
                                      passwordController.text.trim()) {
                                    print(usernameController.text.trim() +
                                        emailController.text.trim() +
                                        passwordController.text.trim() +
                                        passwordConfirmedController.text
                                            .trim() +
                                        firstNameController.text.trim() +
                                        lastNameController.text.trim() +
                                        _birthDateInString +
                                        genderSelected +
                                        roleSelected);
                                    print(usernameController.text.trim() !=
                                            null &&
                                        emailController.text.trim() != null &&
                                        passwordController.text.trim() !=
                                            null &&
                                        passwordConfirmedController
                                                .text
                                                .trim() !=
                                            null &&
                                        firstNameController.text.trim() !=
                                            null &&
                                        lastNameController.text.trim() != null);
                                    print(isDateSelected != false &&
                                        genderSelected != null &&
                                        roleSelected != null);
                                    //checking that all textfields are not empty
                                    if (usernameController.text.trim() != null &&
                                        emailController.text.trim() != null &&
                                        passwordController.text.trim() !=
                                            null &&
                                        passwordConfirmedController
                                                .text
                                                .trim() !=
                                            null &&
                                        firstNameController.text.trim() !=
                                            null &&
                                        lastNameController.text.trim() !=
                                            null &&
                                        isDateSelected != false &&
                                        genderSelected != null &&
                                        roleSelected != null) {

                                        // input is the authProvider.emailController, which provides the written email
                                        // output are all the user informations in a Map<String, dynamic>
                                        // used to check the status and role of the user
                                        mapUserinformations =
                                            await authproviderInstance
                                                .getUserByEmail(emailController
                                                    .text
                                                    .trim());

                                        //when email exist, then check status
                                        if (mapUserinformations != null) {
                                          print('email is already existing');

                                          //checking if status is deleted
                                          if (mapUserinformations['status'] ==
                                              'gelöscht') {
                                            print('email is deleted');

                                            //recreate the deleted user
                                            try {
                                              //update user informations
                                              await authproviderInstance
                                                  .updateUserSignup(
                                                      mapUserinformations[
                                                          'uid'],
                                                      usernameController.text
                                                          .trim(),
                                                      emailController.text
                                                          .trim(),
                                                      firstNameController.text
                                                          .trim(),
                                                      lastNameController.text
                                                          .trim(),
                                                      _birthDateInString,
                                                      genderSelected,
                                                      roleSelected);
                                              //input: emailcontroller, output: send password reset link
                                              try {
                                                await FirebaseAuth.instance
                                                    .sendPasswordResetEmail(
                                                        email: emailController
                                                            .text
                                                            .trim());
                                              } on FirebaseAuthException catch (e) {
                                                print(e);
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Text(e.message
                                                            .toString()),
                                                      );
                                                    });
                                              }
                                              clearController();
                                              isDateSelected = false;
                                              genderSelected = null;
                                              roleSelected = null;

                                              // deleted user got recreated - now print a message that the registration process is completed
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          "Registration abgeschlossen.\nDer Account war gelöscht, daher wurde eine E-Mail zum zurücksetzen des persönlichen Passworts zugesendet.\nNachdem das Passwort abgeändert wurde, kann sich der Benutzer mit diesem"
                                                          "in unserer App einloggen.",
                                                          textAlign:
                                                              TextAlign.center),
                                                      actions: [
                                                        TextButton(
                                                          child: Text("Ok"),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        )
                                                      ],
                                                    );
                                                  });

                                              Navigator.of(context).pop();
                                              userTable.initializeData();
                                            } catch (e) {
                                              print(e);
                                            }
                                          }
                                          // email is already existing and the status is not deleted
                                          else {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "Error: Es existiert schon ein Benutzer mit dieser E-Mail Adresse."),
                                                    actions: [
                                                      TextButton(
                                                        child: Text("Ok"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      )
                                                    ],
                                                  );
                                                });
                                          }
                                        }
                                        // email not existing in database -> mapUserinformations = null
                                        else {
                                          try {
                                            print('email existiert noch nicht');
                                            // sign up user in database with the birthday and gender + all controllers from authProvider
                                            await authproviderInstance
                                                .signUpUserAdmin(
                                                    usernameController.text
                                                        .trim(),
                                                    emailController.text.trim(),
                                                    passwordController.text
                                                        .trim(),
                                                    firstNameController.text
                                                        .trim(),
                                                    lastNameController.text
                                                        .trim(),
                                                    _birthDateInString,
                                                    genderSelected,
                                                    roleSelected);
                                            isDateSelected = false;
                                            genderSelected = null;
                                            roleSelected = null;

                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "Benutzer mit der Rolle " + roleSelected + " und dem usernamen " + usernameController.text.trim() + "erfolgreich erstellt."),
                                                    actions: [
                                                      TextButton(
                                                        child: Text("Ok"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      )
                                                    ],
                                                  );
                                                });
                                            clearController();
                                            //Navigator.of(context).pop();
                                            userTable.initializeData();
                                          } catch (e) {
                                            print(e);
                                          }
                                        }
                                      }
                                    // not all Textfields/Buttons are filled
                                    else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  "Error: Registration gescheitert! Bitte alle Felder ausfüllen."),
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
                                    }else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                                "Error: Passwort und Passwort wiederholen müssen gleich sein!"),
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
                                  } else {
                                    print('validate email notgoodatall');
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                                "Error: Bitte überprüfe, ob alle deine Eingaben ein gültiges Format aufweisen."),
                                            actions: [
                                              TextButton(
                                                child: Text("Ok"),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop();
                                                },
                                              )
                                            ],
                                          );
                                        });
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
      label: Text("Hinzufügen", style: TextStyle(color: Colors.black)),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
      ),
    );
  }
}
