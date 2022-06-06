

import 'package:flutter/material.dart';

import '../../registration/widgets/radiobuttons.dart';

class EditButtonScientist extends StatefulWidget {
  const EditButtonScientist({Key key}) : super(key: key);

  @override
  State<EditButtonScientist> createState() => _EditButtonScientistState();
}

class _EditButtonScientistState extends State<EditButtonScientist> {
  String genderSelected;

  String _birthDateInString;
  DateTime birthDate;
  bool isDateSelected= false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirmed = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();


  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    passwordConfirmed.dispose();
    firstName.dispose();
    lastName.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () =>
      {
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
                                    Text("User bearbeiten",
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
                                    controller: username,
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
                                    controller: email,
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
                                    controller: firstName,
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
                                    controller: lastName,
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

                                    //SizedBox(width: 11,),

                                    Text(
                                      "Geburtsdatum:",
                                      style: TextStyle(
                                          fontSize: 18),
                                    ),

                                    //SizedBox(width: 90,),

                                    GestureDetector(
                                      child: new Icon(
                                        Icons.calendar_today,
                                        size: 30,),
                                      onTap: () async {
                                        final DateTime datePick = await showDatePicker(
                                          context: context,
                                          initialDate: new DateTime
                                              .now(),
                                          firstDate: new DateTime(
                                              1900),
                                          lastDate: new DateTime(
                                              2100),
                                          initialEntryMode: DatePickerEntryMode
                                              .input,
                                          errorFormatText: 'Enter valid date',
                                          errorInvalidText: 'Enter date in valid range',
                                          fieldLabelText: 'Birthdate',
                                          fieldHintText: 'TT/MM/YYYY',
                                        );
                                        if (datePick != null &&
                                            datePick != birthDate) {
                                          setState(() {
                                            birthDate = datePick;
                                            isDateSelected = true;

                                            // birthdate in string
                                            _birthDateInString =
                                            "${birthDate
                                                .month}/${birthDate
                                                .day}/${birthDate
                                                .year}";
                                            print('' +
                                                _birthDateInString);
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
                                        0, 'Männlich', genderSelected, (
                                        newValue) {
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

                                Padding(
                                  padding: const EdgeInsets.all(
                                      8.0),
                                  child: ElevatedButton(
                                    child: Text("Bearbeiten"),
                                    onPressed: () {
                                      if (_formKey.currentState
                                          .validate()) {
                                        //alle infos von den controllern holen und alles updaten.
                                        _formKey.currentState
                                            .save();
                                        Navigator.of(context).pop();
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
        IconData(0xf00d, fontFamily: 'MaterialIcons'),
        color: Colors.black,),
      label: Text("Bearbeiten",
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
