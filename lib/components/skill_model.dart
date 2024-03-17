import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SkillModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late List<String> _skills;

  List<String> get skills => _skills;

  SkillModel() {
    _skills = [];
    _loadSkills();
  }

  Future<void> _loadSkills() async {
    try {
      final snapshot = await _firestore.collection('skills').get();
      _skills = snapshot.docs.map((doc) => doc['name'] as String).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading skills: $e');
    }
  }

  Future<void> addSkill(String skill) async {
    try {
      await _firestore.collection('skills').add({'name': skill});
      _loadSkills();
    } catch (e) {
      print('Error adding skill: $e');
    }
  }

  Future<void> deleteSkill(String skill) async {
    try {
      final snapshot = await _firestore
          .collection('skills')
          .where('name', isEqualTo: skill)
          .get();
      final docId = snapshot.docs.first.id;
      await _firestore.collection('skills').doc(docId).delete();
      _loadSkills();
    } catch (e) {
      print('Error deleting skill: $e');
    }
  }
}
