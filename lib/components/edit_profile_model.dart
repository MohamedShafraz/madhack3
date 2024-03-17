import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends ChangeNotifier {
  bool _isEditing = false;

  bool get isEditing => _isEditing;
  T createModel<T>(BuildContext context, T Function() modelBuilder) {
    return Provider.of<T>(context, listen: false) ?? modelBuilder();
  }

  void startEditing() {
    _isEditing = true;
    notifyListeners();
  }

  void stopEditing() {
    _isEditing = false;
    notifyListeners();
  }
}
