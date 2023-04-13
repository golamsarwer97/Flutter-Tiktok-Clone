import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../constants.dart';

class AuthController extends GetxController {
  // upload data to firebase Storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref =
        storage.ref().child('profilePics').child(auth.currentUser!.uid);

    UploadTask task = ref.putFile(image);
    TaskSnapshot snap = await task;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // registering the user
  void registerUser(
    String username,
    String email,
    String password,
    File? image,
  ) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String downloadUrl = await _uploadToStorage(image);
      }
    } catch (e) {
      Get.snackbar('Error Creating Account', e.toString());
    }
  }
}
