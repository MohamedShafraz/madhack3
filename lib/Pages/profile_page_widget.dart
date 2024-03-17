import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobbed/models/userrecord_model.dart';
import 'package:provider/provider.dart';

import '../auth/firebase_auth/auth_util.dart';
// import 'backend/backend.dart';
import '../components/about_widget.dart';
import '../components/education_widget.dart';
import '../components/profile_detail_widget.dart';
import '../components/skill_widget.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key? key}) : super(key: key);

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget>
    with TickerProviderStateMixin {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;

  @override
  void initState() {
    super.initState();
    _model = ProfilePageModel();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  String currentUserUid = FirebaseAuth.instance.currentUser?.uid ?? '';

  DocumentReference currentUserReference = FirebaseFirestore.instance
      .collection('users')
      .doc('vR2wtBoFUiVuhG3vCRDFpaUVMvE3');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(currentUserUid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  );
                }
                final document = snapshot.data!;
                final documentData = document.data() as Map<String, dynamic>;
                print(currentUserUid);
                final columnUsersRecord =
                    UsersRecord.fromMap(documentData, currentUserReference);
                if (!document.exists) {
                  return Text('Document does not exist');
                }
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 555,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 40, 10, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutWidget(
                                              userId: FirebaseAuth
                                                  .instance.currentUser!.uid,
                                            )),
                                  );
                                },
                                child: Text("About Me")),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutWidget(
                                              userId: FirebaseAuth
                                                  .instance.currentUser!.uid,
                                            )),
                                  );
                                },
                                child: Text("About Me")),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutWidget(
                                              userId: FirebaseAuth
                                                  .instance.currentUser!.uid,
                                            )),
                                  );
                                },
                                child: Text("About Me")),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutWidget(
                                              userId: FirebaseAuth
                                                  .instance.currentUser!.uid,
                                            )),
                                  );
                                },
                                child: Text("About Me")),
                            // Card(
                            //   clipBehavior: Clip.antiAliasWithSaveLayer,
                            //   color: Color(0xFF30B2A3),
                            //   elevation: 0,
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(60),
                            //   ),
                            //   child: Padding(
                            //     padding: EdgeInsets.all(2),
                            //     child: ClipRRect(
                            //       borderRadius: BorderRadius.circular(60),
                            //       child: Image.network(
                            //         "https://commons.wikimedia.org/wiki/File:Userimage.png",
                            //         // columnUsersRecord.photoUrl,
                            //         width: 20,
                            //         height: 80,
                            //         fit: BoxFit.cover,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Expanded(
                            //   child: Padding(
                            //     padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                            //     child: Column(
                            //       mainAxisSize: MainAxisSize.max,
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text(
                            //           columnUsersRecord.displayName ??
                            //               'Mr. Rogers',
                            //           style: GoogleFonts.getFont(
                            //             'Lexend Deca',
                            //             color: Colors.white,
                            //             fontSize: 20,
                            //             fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //         Padding(
                            //           padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            //           child: Text(
                            //             columnUsersRecord.email,
                            //             style: GoogleFonts.getFont(
                            //               'Lexend Deca',
                            //               color: Theme.of(context).primaryColor,
                            //               fontSize: 14,
                            //               fontWeight: FontWeight.normal,
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    // AboutWidget(
                    //   userId: currentUserUid,
                    // ),
                    // SkillWidget(),
                    // Other widgets
                  ],
                );
              },
            ),
            // Other widgets
          ],
        ),
      ),
    );
  }
}
