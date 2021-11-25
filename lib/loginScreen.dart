import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:swabhav_test/enquiryForm.dart';
import 'package:swabhav_test/widgets/customPrimaryButton.dart';
import 'package:swabhav_test/widgets/custom_checkbox.dart';
import 'signup.dart';
import 'theme.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool passwordVisible = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _email = "";

  bool _isLoading = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                        'Login to your\naccount',
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
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: textWhiteGrey,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: heading6.copyWith(color: textGrey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onSaved: (String? val) {
                              _email = val.toString();
                            },
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
                            obscureText: !passwordVisible,
                            controller: _passwordController,
                            textInputAction: TextInputAction.done,
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
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 32,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     CustomCheckbox(),
                  //     SizedBox(
                  //       width: 12,
                  //     ),
                  //     Text('Remember me', style: regular16pt),
                  //   ],
                  // ),
                  SizedBox(
                    height: 32,
                  ),
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
                          "Login",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 20.0),
                        )),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: regular16pt.copyWith(color: textGrey),
                      ),
                      GestureDetector(
                        onTap: () {
                          // if (validated == true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                          // }
                        },
                        child: Text(
                          'Register',
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
    if (validated() == true) {
      signIn(_emailController.text, _passwordController.text);
    }
  }

  bool validated() {
    final snackBar = SnackBar(
      content: Text('Enter a Valid Email'),
      duration: Duration(seconds: 5),
    );

    print(_emailController.text);
    print(_passwordController.text);
    // return true;
    String value = _emailController.text;
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    if (regex.hasMatch(value.toString())) {
      // print(_emailController.text);
      // print(_passwordController.text);

      return true;
    } else {
      print(false);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
  }

  signIn(String email, pass) async {
    var Msg = "Login Failed";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Map data = {'email': email, 'password': pass};

    var jsonResponse = null;
    var jsonData = json.encode(data);
    // https://swabhav-tsam.herokuapp.com/api/v1/tsam/tenant/7ca2664b-f379-43db-bdf9-7fdd40707219/login"

    var response = await http.post(
        Uri.parse(
            "https://swabhav-tsam.herokuapp.com/api/v1/tsam/tenant/7ca2664b-f379-43db-bdf9-7fdd40707219/android-login"),
        body: jsonData);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        Msg = "Login Success";
        sharedPreferences.setString("token", "User Logged in");
        print(sharedPreferences.getString("token"));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => EnquiryForm()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });

      Msg = json.decode(response.body)['error'];
      print("The error message is: ${response.body} ,${response.statusCode}");
    }
    final snackBar = SnackBar(
      content: Text(Msg),
      duration: Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
