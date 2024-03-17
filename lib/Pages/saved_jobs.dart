import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../components/about_widget.dart';
import 'Home.dart';

class SavedJobsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    void initState() {}
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePageMAINWidget()),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AboutWidget(
                      userId: FirebaseAuth.instance.currentUser!.uid,
                    )),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SavedJobsPage()),
          );
          break;
        case 3:
          FirebaseAuth.instance.signOut().then((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePageMAINWidget()),
            );
            SystemNavigator.pop();
          });
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Saved Jobs'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('jobs').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final jobs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              final job = jobs[index];
              return ListTile(
                title: Text(job['jobTitle']),
                subtitle: Text(job['jobDescription']),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout), // Add logout icon
            label: 'Logout', // Label for logout button
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Color(0xFFFF0054),
        onTap: _onItemTapped,
      ),
    );
  }

  void setState(Null Function() param0) {}
}
