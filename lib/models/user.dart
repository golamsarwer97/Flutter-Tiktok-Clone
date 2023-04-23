import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String profileImage;
  final String email;

  UserModel({
    required this.uid,
    required this.name,
    required this.profileImage,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "profileImage": profileImage,
        "email": email,
      };

  static UserModel fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      uid: snapshot['uid'],
      name: snapshot['name'],
      profileImage: snapshot['profileImage'],
      email: snapshot['email'],
    );
  }
}
