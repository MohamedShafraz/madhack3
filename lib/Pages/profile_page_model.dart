import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobbed/components/education_model.dart';
import 'package:jobbed/components/skill_model.dart';
import 'package:provider/provider.dart';

import '../auth/firebase_auth/auth_util.dart';
import '../components/about_widget.dart';
import '../components/about_model.dart';
import '../components/education_widget.dart';
import '../components/profile_detail_widget.dart';
import '../components/skill_widget.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;

class ProfilePageModel extends ChangeNotifier {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  late AboutModel aboutModel;
  late ProfileDetailModel profileDetailModel;
  late EducationModel educationModel;
  late SkillModel skillModel;

  void initState(BuildContext context) {
    aboutModel = AboutModel(userId: uid);
    profileDetailModel = ProfileDetailModel();
    educationModel = EducationModel();
    skillModel = SkillModel();
  }

  void dispose() {
    aboutModel.dispose();
    profileDetailModel.dispose();
    educationModel.dispose();
    skillModel.dispose();
  }
}
