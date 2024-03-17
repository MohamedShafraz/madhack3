import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileDetailModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String _userId;
  T createModel<T>(BuildContext context, T Function() modelBuilder) {
    return Provider.of<T>(context, listen: false) ?? modelBuilder();
  }

  ProfileDetailModel(String userId) {
    _userId = userId;
  }

  String get userId => _userId;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserProfile() async {
    try {
      return await _firestore.collection('users').doc(_userId).get();
    } catch (e) {
      print('Error getting user profile: $e');
      rethrow;
    }
  }

  Future<void> updateUserProfile(Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(_userId).update(data);
    } catch (e) {
      print('Error updating user profile: $e');
      rethrow;
    }
  }

  Future<void> deleteUserProfile() async {
    try {
      await _firestore.collection('users').doc(_userId).delete();
    } catch (e) {
      print('Error deleting user profile: $e');
      rethrow;
    }
  }

  void onUpdate() {
    notifyListeners();
  }

  void maybeDispose() {
    // Cleanup resources here if needed
  }
}
