// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobbed/models/education_model.dart';

class EducationModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Education> _educations = [];

  List<Education> get educations => _educations;

  Future<void> fetchEducations(String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('educations')
          .get();

      _educations = querySnapshot.docs
          .map((doc) => Education.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      notifyListeners();
    } catch (e) {
      print('Error fetching educations: $e');
    }
  }

  Future<void> addEducation(String userId, Education education) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('educations')
          .add(education.toJson());

      await fetchEducations(userId); // Refresh the list
    } catch (e) {
      print('Error adding education: $e');
    }
  }

  Future<void> updateEducation(String userId, Education education) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('educations')
          .doc(education.id)
          .update(education.toJson());

      await fetchEducations(userId); // Refresh the list
    } catch (e) {
      print('Error updating education: $e');
    }
  }

  Future<void> deleteEducation(String userId, String educationId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('educations')
          .doc(educationId)
          .delete();

      await fetchEducations(userId); // Refresh the list
    } catch (e) {
      print('Error deleting education: $e');
    }
  }

  void onUpdate() {
    notifyListeners(); // Notify listeners of the update
  }
}
