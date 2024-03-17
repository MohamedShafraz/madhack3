import 'package:flutter/material.dart';

class JobCard2Model extends ChangeNotifier {
  late TextEditingController textController;
  late FocusNode textFieldFocusNode;

  void onUpdate() {
    notifyListeners();
  }

  void maybeDispose() {
    textController.dispose();
    textFieldFocusNode.dispose();
  }

  @override
  void dispose() {
    maybeDispose();
    super.dispose();
  }
}
