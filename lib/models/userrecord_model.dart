import 'package:cloud_firestore/cloud_firestore.dart';

class UsersRecord {
  final String displayName;
  final String email;
  final String photoUrl;
  final DocumentReference
      currentUserReference; // Assuming this is a DocumentReference

  UsersRecord({
    required this.displayName,
    required this.email,
    required this.photoUrl,
    required this.currentUserReference,
  });

  factory UsersRecord.fromMap(
      Map<String, dynamic> map, DocumentReference reference) {
    return UsersRecord(
      displayName: map['displayName'] ?? '',
      email: map['email'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      currentUserReference: reference,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
      // You might not need to include currentUserReference in the map if it's a reference to the current user's document
    };
  }

  static UsersRecord empty = UsersRecord(
    displayName: '',
    email: '',
    photoUrl: '',
    currentUserReference: FirebaseFirestore.instance.collection('users').doc(),
  );
}
