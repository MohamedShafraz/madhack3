import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobbed/Pages/profile_page_widget.dart';
import 'package:jobbed/Pages/saved_jobs.dart';
import 'package:jobbed/components/about_widget.dart';
import 'package:provider/provider.dart';

import '../components/job_card1_widget.dart';
import '../components/job_card2_widget.dart';
import '../main.dart';
import 'home_page_main_model.dart';
import 'utils.dart';

class HomePageMAINWidget extends StatefulWidget {
  const HomePageMAINWidget({Key? key}) : super(key: key);

  @override
  State<HomePageMAINWidget> createState() => _HomePageMAINWidgetState();
}

class _HomePageMAINWidgetState extends State<HomePageMAINWidget> {
  late HomePageMAINModel _model;
  int _selectedIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    HomePageMAINModel createModel(BuildContext context) {
      return HomePageMAINModel();
    }

    _model = createModel(context);

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

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
            MaterialPageRoute(
                builder: (context) =>
                    MyHomePage(title: 'Flutter Demo Home Page')),
          );
          // SystemNavigator.pop();
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xF0F0F0F0F0),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 247,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x39000000),
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(24, 40, 0, 0),
                    child: Image.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? 'assets/images/1.png'
                          : 'assets/images/2.png',
                      width: 160,
                      height: 98,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Find your Dream Space To Getaway',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xF6F6F6F6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Address, city, state...',
                                  labelStyle: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search_sharp,
                                    color: Colors.grey,
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: ElevatedButton(
                              onPressed: () async {
                                Navigator.of(context).pushNamed(
                                  'searchProperties',
                                  arguments: {
                                    'searchTerm': serializeParam(
                                      _model.textController.text,
                                      ParamType.String,
                                    ),
                                  },
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.disabled)) {
                                      return Colors
                                          .grey; // Use the default disabled color
                                    }
                                    return Color(
                                        0xFFFF0054); // Use your custom color FF0054
                                  },
                                ),
                              ),
                              child: Text(
                                'Search',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(-1, 0),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Most Popular',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.grey,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.jobCard1Model1,
                    updateCallback: () => setState(() {}),
                    child: JobCard1Widget(),
                  ),
                  wrapWithModel(
                    model: _model.jobCard1Model2,
                    updateCallback: () => setState(() {}),
                    child: JobCard1Widget(),
                  ),
                  wrapWithModel(
                    model: _model.jobCard1Model3,
                    updateCallback: () => setState(() {}),
                    child: JobCard1Widget(),
                  ),
                  wrapWithModel(
                    model: _model.jobCard1Model4,
                    updateCallback: () => setState(() {}),
                    child: JobCard1Widget(),
                  ),
                  wrapWithModel(
                    model: _model.jobCard1Model5,
                    updateCallback: () => setState(() {}),
                    child: JobCard1Widget(),
                  ),
                ],
              ),
            ),
            ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Recommended For You',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.jobCard2Model1,
                  updateCallback: () => setState(() {}),
                  child: JobCard2Widget(),
                ),
                wrapWithModel(
                  model: _model.jobCard2Model2,
                  updateCallback: () => setState(() {}),
                  child: JobCard2Widget(),
                ),
                wrapWithModel(
                  model: _model.jobCard2Model3,
                  updateCallback: () => setState(() {}),
                  child: JobCard2Widget(),
                ),
                wrapWithModel(
                  model: _model.jobCard2Model4,
                  updateCallback: () => setState(() {}),
                  child: JobCard2Widget(),
                ),
                wrapWithModel(
                  model: _model.jobCard2Model5,
                  updateCallback: () => setState(() {}),
                  child: JobCard2Widget(),
                ),
              ],
            ),
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

// Wrap the child widget with the model for state management
Widget wrapWithModel<T extends ChangeNotifier>({
  required T model,
  required VoidCallback updateCallback,
  required Widget child,
}) {
  return ChangeNotifierProvider.value(
    value: model,
    builder: (context, _) => child,
  );
}
