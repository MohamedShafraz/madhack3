import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobbed/components/about_widget.dart';
import 'package:jobbed/components/edit_profile_model.dart';
import 'package:provider/provider.dart';

class EditProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EditProfileModel>(
      builder: (context, model, child) {
        return InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            if (!model.isEditing) {
              model.startEditing();
              Navigator.of(context).pushNamed('editProfile');
            }
          },
          child: child,
        );
      },
      child: AboutWidget(userId: FirebaseAuth.instance.currentUser!.uid),
    );
  }
}
