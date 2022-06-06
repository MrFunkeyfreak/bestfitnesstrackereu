import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserData extends StatelessWidget {
  final String documentId;

  GetUserData({@required this.documentId});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data() as Map<String,dynamic>;
            return Text('First Name: ${data['first name']} \n '
                'Gender: ${data['gender']}'
            );
      }
      return Text('loading...');
    });
  }
}

class GetUserDataFromAdmin {
  final String documentId;

  GetUserDataFromAdmin({@required this.documentId});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data() as Map<String,dynamic>;
            return Text('Username: ${data['username']} \n E-Mail: ${data['email']} \n '
                'first name: ${data['first name']} \n last name: ${data['last name']} \n '
                'birthday: ${data['birthday']} \n Gender: ${data['gender']} \n Status: ${data['status']}' );

              //  'First Name: ${data['first name']} \n Gender: ${data['gender']}' );
          }
          return Text('loading...');
        });
  }
}
