import 'package:flutter/material.dart';
import 'package:jobbed/Pages/Home.dart';
import 'package:jobbed/Pages/home_page_main_model.dart';
import 'package:jobbed/Pages/signup.dart';

import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // @override
  // void initState() {
  //   super.initState();
  //   _model = createModel(context, () => LoginModel());
  //
  //   _model.emailAddressController ??= TextEditingController();
  //   _model.emailAddressFocusNode ??= FocusNode();
  //
  //   _model.passwordController ??= TextEditingController();
  //   _model.passwordFocusNode ??= FocusNode();
  //
  //   WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {}));
  // }
  late LoginModel _model;

  @override
  void initState() {
    super.initState();
    _model = LoginModel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF4B39EF),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(
          // color: Colors.black,
          // Change this to your desired background color
          // Add your image asset here for the background imag
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              './assets/images/background.jpg',
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 550,
              decoration: BoxDecoration(
                color: Colors.white, // Change this to your desired color
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    color: Color(0x4D090F13),
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            width: 120,
                            height: 120,
                            fit: BoxFit.fitWidth,
                            image: AssetImage('./assets/images/2.png'),
                          ),
                        ],
                      ),
                      Text(
                        'Welcome Back,',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email address',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(width: 8),
                              TextFormField(
                                onChanged: _model.setEmail,
                                decoration: InputDecoration(
                                  hintText: 'Johndoe@gmail.com',
                                  // hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                                  // enabledBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(
                                  //     color: Colors.grey,
                                  //     width: 2,
                                  //   ),
                                  //   borderRadius: BorderRadius.circular(8),
                                  // ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Password',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 8),
                              TextFormField(
                                obscureText: true,
                                onChanged: _model.setPassword,
                                decoration: InputDecoration(
                                  hintText: '********',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                ),
                                child: Text('Forget Password',
                                    style: TextStyle(fontSize: 18)),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () async {
                                  await _model.login(context);
                                  if (_model.isLoggedIn) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomePageMAINWidget()),
                                    );
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xFFFF0054)),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupWidget()),
                              );
                            },
                            child: Text('Create new Account',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF39d2c0))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
