import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobbed/Pages/Home.dart';
import 'package:jobbed/Pages/saved_jobs.dart';
import '../models/user_model.dart';
import '../repository/user_repository.dart';

class AboutWidget extends StatefulWidget {
  final String userId;

  const AboutWidget({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  _AboutUserPageState createState() => _AboutUserPageState();
}

class _AboutUserPageState extends State<AboutWidget> {
  late UserRepository _userRepository;
  late Users _user;
  bool _isEditing = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
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
    }
  }

  @override
  void initState() {
    super.initState();
    _userRepository = UserRepository();
    _loadUser();
  }

  void _loadUser() async {
    Users? user = await _userRepository.getUser(widget.userId);
    if (user != null) {
      setState(() {
        _user = user;
        _nameController.text = user.name;
        _emailController.text = user.email;
      });
    }
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() async {
    _user.name = _nameController.text;
    _user.email = _emailController.text;
    await _userRepository.updateUser(_user);
    _toggleEdit();
  }

  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About User'),
        actions: [
          if (_isEditing)
            IconButton(
              icon: Icon(Icons.save),
              onPressed: _saveChanges,
            )
          else
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: _toggleEdit,
            ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            if (_isEditing)
              TextFormField(
                controller: _nameController,
              )
            else
              Text(_user.name),
            SizedBox(height: 20.0),
            Text(
              'Email:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            if (_isEditing)
              TextFormField(
                controller: _emailController,
              )
            else
              Text(_user.email),
          ],
        ),
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
}
