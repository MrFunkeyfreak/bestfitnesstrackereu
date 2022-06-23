import 'package:cloud_firestore/cloud_firestore.dart';
import '../datamodels/user_model.dart';

class UserServices {
  String adminsCollection = "admins";
  String usersCollection = "users";

  void createUser({
    String uid,
    String username,
    String email,
    String firstName,
    String lastName,
    String birthday,
    String gender,
    String status,
    String role,

  }) {
    FirebaseFirestore.instance.collection(usersCollection).doc(uid).set({
      'uid': uid,
      'username': username,
      'email': email,
      'first name': firstName,
      'last name': lastName,
      'birthday': birthday,
      'gender': gender,
      'status': status,
      'role': role,
    });
  }

  void updateUserData(Map<String, dynamic> values) {  //update the values from the person, who has the specific id
    FirebaseFirestore.instance
        .collection(usersCollection)
        .doc(values['id'])
        .update(values);
  }

  Future<UserModel> getUserById(String id) =>  //get the current user logged in
      FirebaseFirestore.instance.collection(usersCollection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  Future<List<UserModel>> getAllUsers() async =>
      FirebaseFirestore.instance.collection(usersCollection).get().then((result) {
        List<UserModel> users = [];
        for (DocumentSnapshot user in result.docs) {
          users.add(UserModel.fromSnapshot(user));
        }
        return users;
      });
}