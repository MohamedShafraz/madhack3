import 'package:flutter/material.dart';

class JobCard1Model extends ChangeNotifier {
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
