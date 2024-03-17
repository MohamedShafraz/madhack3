import 'package:flutter/material.dart';

class HomePageMAINModel extends ChangeNotifier {
  late TextEditingController textController;
  late FocusNode textFieldFocusNode;
  HomePageMAINModel createModel(BuildContext context) {
    return HomePageMAINModel();
  }

  bool validateTextController(String value) {
    // Perform your validation logic here
    return value.isNotEmpty; // For example, check if the value is not empty
  }

  JobCard1Model jobCard1Model1 = JobCard1Model();
  JobCard1Model jobCard1Model2 = JobCard1Model();
  JobCard1Model jobCard1Model3 = JobCard1Model();
  JobCard1Model jobCard1Model4 = JobCard1Model();
  JobCard1Model jobCard1Model5 = JobCard1Model();

  JobCard2Model jobCard2Model1 = JobCard2Model();
  JobCard2Model jobCard2Model2 = JobCard2Model();
  JobCard2Model jobCard2Model3 = JobCard2Model();
  JobCard2Model jobCard2Model4 = JobCard2Model();
  JobCard2Model jobCard2Model5 = JobCard2Model();

  HomePageMAINModel() {
    textController = TextEditingController();
    textFieldFocusNode = FocusNode();
  }

  void dispose() {
    textController.dispose();
    textFieldFocusNode.dispose();
    super.dispose();
  }

  void onUpdate() {
    notifyListeners();
  }
}

class JobCard1Model extends ChangeNotifier {
  // Add your model properties and methods here
}

class JobCard2Model extends ChangeNotifier {
  // Add your model properties and methods here
}
