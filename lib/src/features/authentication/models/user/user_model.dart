import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName, email, password, phoneNo;

  const UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNo,
  });

  Map<String, dynamic> toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Password": password,
      "Phone": phoneNo,
    };
  }

// Map user fetched from firebase to UserModel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return UserModel(
      id: document.id,
      fullName: data["FullName"],
      email: data["Email"],
      password: data["Password"],
      phoneNo: data["Phone"],
    );
  }

  // factory UserModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   final data = document.data();

  //   if (data == null) {
  //     throw Exception('Document data is null');
  //   }

  //   return UserModel(
  //     id: document.id,
  //     fullName: data["FullName"] as String,
  //     email: data["Email"] as String,
  //     password: data["Password"] as String,
  //     phoneNo: data["Phone"] as String,
  //   );
  // }
}
