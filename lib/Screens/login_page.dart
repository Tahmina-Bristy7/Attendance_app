import 'package:attendance/Screens/homepage.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _companyIdController = TextEditingController();
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double screenHeight = 0;
  double screenWidth = 0;
  Color initialColor = Colors.white;
  var companyId = 12345;
  var userId = '123@gmail.com';
  var password = '1234';

  @override
  void dispose() {
    _companyIdController.dispose();
    _userIdController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    // bool _obscureText = true;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight / 4,
                width: screenWidth,
                child: Center(
                  child: Text('Sign In',
                      style: TextStyle(
                          color: Colors.white, fontSize: screenWidth / 14)),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: screenHeight - screenHeight / 3.2,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: initialColor,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(60),
                          topLeft: Radius.circular(60))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth / 60),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight / 28,
                        ),
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: screenWidth / 9,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Glad to see you!',
                          style: TextStyle(
                              color: Colors.grey, fontSize: screenWidth / 16),
                        ),

                        // Login form
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenWidth / 10,
                                horizontal: screenWidth / 28),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Company Id',
                                      labelStyle: TextStyle(
                                        color: Colors.teal,
                                      ),
                                      prefixIcon: Icon(Icons.person,
                                          color: Colors.teal)),
                                  controller: _companyIdController,
                                  validator: (value) {
                                    if (value != companyId.toString()) {
                                      return 'Please Provide Your valid CompanyId';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: screenHeight / 50,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'User Id',
                                      labelStyle: TextStyle(color: Colors.teal),
                                      prefixIcon: Icon(Icons.person,
                                          color: Colors.teal)),
                                  controller: _userIdController,
                                  validator: (value) {
                                    if (value != userId) {
                                      return 'Please Provide Your Valid User Id';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: screenHeight / 50,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  controller: _passwordController,
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: TextStyle(color: Colors.teal),
                                    prefixIcon:
                                        Icon(Icons.vpn_key, color: Colors.teal),
                                  ),
                                  validator: (value) {
                                    if (value != password) {
                                      return 'Please Your Valid Password';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: screenHeight / 60),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            width: screenWidth / 4,
                            height: screenWidth / 10,
                            child: ElevatedButton(
                              onPressed: () {
                                // _login();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomePage()));
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      print('login');
    }
  }
}
