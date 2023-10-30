// import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/authentication/models/user/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

// Store user in FireStore
  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your account has been created",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong. Please try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  // Fetch All Users OR User details

  Future<UserModel> getUserDetails(String email) async {
    if (email == null) {
      // Handle the case when email is null
      throw Exception("Email cannot be null");
    }

    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();

    if (snapshot.docs.isNotEmpty) {
      final userData = UserModel.fromSnapshot(snapshot.docs.first);
      return userData;
    } else {
      // Handle the case when no user is found for the given email
      throw Exception("No user found for email: $email");
    }
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  // Future<void> updateUserRecord(UserModel user) async {
  //   try {
  //     var docRef = _db.collection("Users").doc(user.id);
  //     await docRef
  //         .update(user.toJson()); // Update specific fields in the document
  //     print("Document updated successfully!");
  //   } catch (e) {
  //     // Handle any errors that occurred during the update process
  //     print("Error updating document: $e");
  //   }
  // }

  Future<void> updateUserRecord(UserModel user) async {
    try {
      var docRef = _db.collection("Users").doc(user.id);
      var docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        // Document exists, update it
        await docRef.update(user.toJson());
        print("Document updated successfully!");
      } else {
        // Document does not exist, create it
        await docRef.set(user.toJson());
        print("Document created successfully!");
      }
    } catch (e) {
      // Handle any errors that occurred during the update process
      print("Error updating document: $e");
    }
  }

  // Future<void> updateUserRecord(UserModel user) async {
  //   try {
  //     var docRef = _db.collection("Users").doc(user.id);
  //     await docRef
  //         .update(user.toJson()); // This will update an existing document
  //     print("Document updated successfully!");
  //   } catch (e) {
  //     print("Error updating document: $e");
  //   }
  // }
}


 // Future<void> updateUserRecord(UserModel user) async {
  //   await _db.collection("Users").doc(user.id).update(user.toJson());
  // }