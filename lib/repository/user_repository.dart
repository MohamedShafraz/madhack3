import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Users?> getUser(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('users').doc(userId).get();
      if (snapshot.exists) {
        return Users.fromJson(snapshot.data()!);
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting user: $e');
      return null;
    }
  }

  Future<void> createUser(Users users) async {
    try {
      await _firestore.collection('users').doc(users.id).set(users.toJson());
    } catch (e) {
      print('Error creating user: $e');
    }
  }

  Future<void> updateUser(Users users) async {
    try {
      await _firestore.collection('users').doc(users.id).update(users.toJson());
    } catch (e) {
      print('Error updating user: $e');
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
