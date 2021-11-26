import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swabhav_test/loginScreen.dart';
import 'package:swabhav_test/widgets/custom_checkbox.dart';
import 'theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // String selectedValue = "None".toString();
  final _passwordController = TextEditingController();
  final _conPasswordController = TextEditingController();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();

  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  // final _roleController = TextEditingController();

  bool passwordVisible = false;
  bool passwordConfrimationVisible = false;

  bool _isLoading = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register new\naccount',
                        style: heading2.copyWith(color: textBlack),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/images/accent.png',
                        width: 99,
                        height: 4,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Form(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: textWhiteGrey,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: TextFormField(
                            controller: _fnameController,
                            decoration: InputDecoration(
                              hintText: 'First Name',
                              hintStyle: heading6.copyWith(color: textGrey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: textWhiteGrey,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: TextFormField(
                            controller: _lnameController,
                            decoration: InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: heading6.copyWith(color: textGrey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: textWhiteGrey,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: TextFormField(
                            controller: _mobileController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Mobile Number',
                              hintStyle: heading6.copyWith(color: textGrey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: textWhiteGrey,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: heading6.copyWith(color: textGrey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        // Container(
                        //   width: double.maxFinite,
                        //   // height: max.,
                        //   decoration: BoxDecoration(
                        //     color: textWhiteGrey,
                        //     borderRadius: BorderRadius.circular(14.0),
                        //   ),

                        //   child: DropdownButton(
                        //       focusColor: Colors.white,
                        //       value: selectedValue,
                        //       elevation: 5,
                        //       style: TextStyle(color: Colors.black),
                        //       // MaxColumnWidth:MainAxisAlignment.spaceAround,

                        //       iconEnabledColor: Colors.black,
                        //       onChanged: (newValue) {
                        //         setState(() {
                        //           selectedValue = newValue.toString();
                        //         });
                        //       },
                        //       items: roleDropDown,
                        //       hint: Text(
                        //         "Please choose your role",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w500),
                        //       )),
                        // ),
                        Container(
                          decoration: BoxDecoration(
                            color: textWhiteGrey,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: !passwordVisible,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: heading6.copyWith(color: textGrey),
                              suffixIcon: IconButton(
                                color: textGrey,
                                splashRadius: 1,
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                onPressed: togglePassword,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: textWhiteGrey,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: TextFormField(
                            controller: _conPasswordController,
                            obscureText: !passwordConfrimationVisible,
                            decoration: InputDecoration(
                              hintText: 'Password Confirmation',
                              hintStyle: heading6.copyWith(color: textGrey),
                              suffixIcon: IconButton(
                                color: textGrey,
                                splashRadius: 1,
                                icon: Icon(passwordConfrimationVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                onPressed: () {
                                  setState(() {
                                    passwordConfrimationVisible =
                                        !passwordConfrimationVisible;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomCheckbox(),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'By creating an account, you agree to our',
                            style: regular16pt.copyWith(color: textGrey),
                          ),
                          Text(
                            'Terms & Conditions',
                            style: regular16pt.copyWith(color: primaryBlue),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  // CustomPrimaryButton(
                  //   buttonColor: primaryBlue,
                  //   textValue: 'Register',
                  //   textColor: Colors.white,
                  //   :RegisterPage();
                  // ),
                  Padding(padding: const EdgeInsets.fromLTRB(0, 40, 0, 0)),
                  ButtonTheme(
                    minWidth: double.maxFinite,
                    height: 50.0,
                    buttonColor: primaryBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: RaisedButton(
                        onPressed: openNewIntent,
                        child: new Text(
                          "Register",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 20.0),
                        )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: regular16pt.copyWith(color: textGrey),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: Text(
                          'Login',
                          style: regular16pt.copyWith(color: primaryBlue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void openNewIntent() {
    if (validated()) {
      Register(
          _emailController.text,
          _mobileController.text,
          _passwordController.text,
          _fnameController.text,
          _lnameController.text);
      final snackBar = SnackBar(
        content: Text('registered Sucessfully'),
        duration: Duration(seconds: 5),
      );
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  bool validated() {
    String error = "";

    if (_fnameController.text.length < 3) {
      final snackBar = SnackBar(
        content: const Text('First name must be more than 3 charaters'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // error = 'First name must be more than 3 charaters';
      return false;
    }
    if (_lnameController.text.length < 3) {
      final snackBar = SnackBar(
        content: Text('Last name must be more than 3 charaters'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    if (_mobileController.text.length != 10) {
      final snackBar = SnackBar(
        content: Text('Mobile mumber must be of 10 characters'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // error = 'Mobile mumber must be of 10 characters';
      return false;
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(_emailController.text)) {
      final snackBar = SnackBar(
        content: Text('Enter Valid Email'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      error = 'Enter Valid Email';
      return false;
    }

    if (_passwordController.text.toString().trim().length < 6) {
      final snackBar = SnackBar(
        content: Text('Password must be 6 character length'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }

    // bool validateConPassword(String value) {
    String pass = _passwordController.text;
    String conpass = _conPasswordController.text;

    print(pass);
    print(conpass);

    if (pass != conpass) {
      final snackBar = SnackBar(
        content: Text('Confirm Password must be same as Password'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }

    return true;
  }

  Register(String email, mobile, role, firstname, lastname) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email.toString(),
      'contact': mobile.toString(),
      'password': role.toString(),
      'firstName': firstname.toString(),
      'lastName': lastname.toString()
    };
    var jsonData = json.encode(data);
    print(jsonData);
    var jsonResponse = null;
    var response = await http.post(
        Uri.parse(
            "https://swabhav-tsam.herokuapp.com/api/v1/tsam/tenant/7ca2664b-f379-43db-bdf9-7fdd40707219/androidUser"),
        body: jsonData);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", "User Added");
        clearAll();
        final snackBar = SnackBar(
          content: Text('User registered Suucessfully'),
          duration: Duration(seconds: 5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      var Msg = response.body;
      print("The error message is: ${response.body}");
    }
  }

  void clearAll() {
    _emailController.clear();
    _fnameController.clear();
    _lnameController.clear();
    _mobileController.clear();
    _passwordController.clear();
    _conPasswordController.clear();
  }
}
