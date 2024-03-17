import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../repository/user_repository.dart';

class AboutModel extends ChangeNotifier {
  late UserRepository _userRepository;
  late Users _user;
  bool _isEditing = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  AboutModel({required String userId}) {
    _userRepository = UserRepository();
    _loadUser(userId);
  }

  void _loadUser(String userId) async {
    Users? user = await _userRepository.getUser(userId);
    if (user != null) {
      _user = user;
      _nameController.text = user.name;
      _emailController.text = user.email;
      notifyListeners();
    }
  }

  void toggleEdit() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  T createModel<T>(BuildContext context, T Function() modelBuilder) {
    return Provider.of<T>(context, listen: false) ?? modelBuilder();
  }

  void saveChanges() async {
    _user.name = _nameController.text;
    _user.email = _emailController.text;
    await _userRepository.updateUser(_user);
    toggleEdit();
  }

  Users get user => _user;

  bool get isEditing => _isEditing;

  TextEditingController get nameController => _nameController;

  TextEditingController get emailController => _emailController;
}
