// ignore: file_names

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swabhav_test/loginScreen.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

// ignore: camel_case_types
class EnquiryForm extends StatefulWidget {
  const EnquiryForm({Key? key}) : super(key: key);

  @override
  _EnquiryFormState createState() => _EnquiryFormState();
}

class _EnquiryFormState extends State<EnquiryForm> {
  bool _isloaded = false;
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();

  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final percenetageController = TextEditingController();
  final yopController = TextEditingController();
  final collegeNameController = TextEditingController();
  final _cityController = TextEditingController();

  List degreeData = [];
  List specializationData = [];
  List academicYear = [];
  List collegeData = [];
  List courses = [];

  String? _mydegree;

  String? _myspecialization;

  String? _mycollege;

  String? _academicYear;

  String? _mycourse; //edited line

  Future<String> getDegreeData() async {
    final String degreeUrl =
        "https://swabhav-tsam.herokuapp.com/api/v1/tsam/tenant/7ca2664b-f379-43db-bdf9-7fdd40707219/degree-list";
    var res = await http
        .get(Uri.parse(degreeUrl), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    print(resBody);
    setState(() {
      degreeData.addAll(resBody);
      // specializationData = resBody;
    });

    print(resBody);

    return "Sucess";
  }

  Future<String> getCourseList() async {
    final String degreeUrl =
        "https://swabhav-tsam.herokuapp.com/api/v1/tsam/tenant/7ca2664b-f379-43db-bdf9-7fdd40707219/course-list";
    var res = await http
        .get(Uri.parse(degreeUrl), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      courses = resBody;
      // s = resBody;
    });

    print(resBody);

    return "Sucess";
  }

  Future<String> getCollegeData() async {
    final String collegeListUrl =
        "https://swabhav-tsam.herokuapp.com/api/v1/tsam/tenant/7ca2664b-f379-43db-bdf9-7fdd40707219//college/branch/list";
    var res = await http.get(Uri.parse(collegeListUrl),
        headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    // void setStateIfMounted(f) {
    // if (mounted)
    setState(() {
      collegeData = resBody;
    });
    // }

    print(resBody);

    return "Sucess";
  }

  Future<String> getSpecializationData() async {
    final String specializationUrl =
        "https://swabhav-tsam.herokuapp.com/api/v1/tsam/tenant/7ca2664b-f379-43db-bdf9-7fdd40707219/specialization/degree/" +
            _mydegree.toString();
    var res = await http.get(Uri.parse(specializationUrl),
        headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      specializationData = resBody;
    });

    print(resBody);

    return "Sucess";
  }

  Future<String> getAcademicYear() async {
    final String specializationUrl =
        "https://swabhav-tsam.herokuapp.com/api/v1/tsam/tenant/7ca2664b-f379-43db-bdf9-7fdd40707219/general-type/type/academic_year";
    var res = await http.get(Uri.parse(specializationUrl),
        headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      academicYear = resBody;
    });

    print(resBody);

    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    getDegreeData();
    getCollegeData();
    getAcademicYear();
    getCourseList();
    // Map data = {
    //   'id': "d7661f43-1e58-4e01-a7ec-4fc42015ec76",
    //   'branchName': "None"

    // specializationData.add(json.encode(data));
  }

  late File _file;

  String selectedValue = "USA".toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Enquiry Form'),
          actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
              child: Form(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      controller: _fnameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'First Name',
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      controller: _lnameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Last Name',
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      controller: _mobileController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone No',
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'City',
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  color: Colors.amber,
                  padding: EdgeInsets.all(10),
                  child: const Text(
                      // controller: nameController,
                      'Academic Details'),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      // controller: nameController,
                      'Degree'),
                ),
                Container(
                  child: new DropdownButton(
                    hint: new Text("Select Your Degree"),
                    items: degreeData.map((item) {
                      return new DropdownMenuItem(
                        child: new Text(item['name']),
                        value: item['id'].toString(),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        print(newVal);
                        _mydegree = newVal.toString();
                        _isloaded = true;
                        getSpecializationData();
                      });
                    },
                    value: _mydegree,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      // controller: nameController,
                      'Specialization'),
                ),
                Container(
                  child: new DropdownButton(
                    hint: new Text("Select Your Specialization"),
                    // if (specialization.length>0) {
                    items: _isloaded
                        ? specializationData.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(item['branchName']),
                              value: item['id'].toString(),
                            );
                          }).toList()
                        : dropDownItems,
                    // }

                    onChanged: (newVal) {
                      setState(() {
                        _myspecialization = newVal.toString();
                      });
                    },
                    value: _myspecialization,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      // controller: nameController,
                      'Select your College'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    direction: Axis.vertical,
                    children: [
                      new DropdownButton(
                        hint: new Text("Select Your College"),
                        // if (specialization.length>0) {
                        items: collegeData.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item['branchName']),
                            value: item['id'].toString(),
                          );
                        }).toList(),

                        // }

                        onChanged: (newVal) {
                          setState(() {
                            _mycollege = newVal.toString();
                          });
                        },
                        value: _mycollege,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: yopController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Year of Passout',
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      // controller: nameController,
                      'Select your Academic Year'),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: new DropdownButton(
                    hint: new Text("Select Your Academic Year"),
                    items: academicYear.map((item) {
                      return new DropdownMenuItem(
                        child: new Text(item['value']),
                        value: item['key'].toString(),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        print(newVal);
                        _academicYear = newVal.toString();
                        // _isloaded = true;
                        // this.getSpecializationData();
                      });
                    },
                    value: _academicYear,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      controller: percenetageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Percentage',
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      // controller: nameController,
                      'Course(s)'),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: new DropdownButton(
                    hint: new Text("Select Your Desired Course"),
                    items: courses.map((item) {
                      return new DropdownMenuItem(
                        child: new Text(item['name']),
                        value: item['id'].toString(),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        print(newVal);
                        _mycourse = newVal.toString();
                        // _isloaded = true;
                        // this.getSpecializationData();
                      });
                    },
                    value: _mycourse,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      // controller: nameController,
                      decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select Resume',
                  )),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: const Text('Submit'),
                      onPressed: () {
                        if (validated()) {
                          submitDetails();
                        }

                        // print(nameController.text);
                        // print(passwordController.text);
                      },
                    ))
              ],
            ),
          )
              // Container(
              //   alignment: Alignment.center,
              //   padding: EdgeInsets.all(10),
              //   child: const Text('Enquiry Form'),
              //   color: Colors.yellow,
              // ),

              ),
        ));
  }

  bool validated() {
    String error = "";

    if (_fnameController.text.length < 3) {
      final snackBar = SnackBar(
        content: Text('First name must be more than 3 charaters'),
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
    print(selectedValue);
    if (_mydegree.toString().isEmpty) {
      final snackBar = SnackBar(
        content: const Text('Select a Valid Degree'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // error = 'Select a Valid Role';
      return false;
    }
    if (_academicYear.toString().isEmpty) {
      final snackBar = SnackBar(
        content: const Text('Select a Valid Academic Year'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // error = 'Select a Valid Role';
      return false;
    }
    if (_myspecialization.toString().isEmpty ||
        _myspecialization.toString() == "None") {
      final snackBar = SnackBar(
        content: const Text('Select a Valid Specialization'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // error = 'Select a Valid Role';
      return false;
    }
    if (_mycollege.toString().isEmpty) {
      final snackBar = SnackBar(
        content: const Text('Select a Valid College'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // error = 'Select a Valid Role';
      return false;
    }
    if (_mycourse.toString().isEmpty) {
      final snackBar = SnackBar(
        content: const Text('Select a Valid Course'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // error = 'Select a Valid Role';
      return false;
    }
    int percent = int.parse(percenetageController.text.toString());
    if (percenetageController.text.toString().isEmpty ||
        (percent < 0 && percent > 100)) {
      final snackBar = SnackBar(
        content: const Text('Enter a Valid percentage'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // error = 'Select a Valid Role';
      return false;
    }

    int dummyDate = int.parse(yopController.text.toString());
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);

    if (yopController.toString().isEmpty ||
        (dummyDate > (dateParse.year + 3) && dummyDate < 1950)) {
      final snackBar = SnackBar(
        content: const Text('Enter a Valid Year of Passing'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // error = 'Select a Valid Role';
      return false;
    }
    if (_cityController.text.length < 2 || _cityController.text.isEmpty) {
      final snackBar = SnackBar(
        content: Text('City Name Should be valid'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // error = 'Mobile mumber must be of 10 characters';
      return false;
    }
    //academkic details

    return true;
  }

  void submitDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      "firstName": _fnameController.text.toString(),
      "lastName": _lnameController.text.toString(),
      "email": _emailController.text.toString(),
      "contact": _mobileController.text.toString(),
      "city": _cityController.text.toString(),
      "academicYear": int.parse(_academicYear.toString()),
      "enquiryType": "Training"
    };
    var jsonData = json.encode(data);
    print(jsonData);
    var jsonResponse = null;
    var response = await http.post(
        Uri.parse(
            "https://swabhav-tsam.herokuapp.com/api/v1/tsam/tenant/7ca2664b-f379-43db-bdf9-7fdd40707219/talent-enquiry-form"),
        body: jsonData);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse != null) {
        setState(() {
          final snackBar = SnackBar(
            content: Text(jsonResponse),
            duration: Duration(seconds: 5),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          _fnameController.clear();
          _lnameController.clear();
          _emailController.clear();
          _cityController.clear();
          _mobileController.clear();

          _academicYear = null;
          _mycollege = null;
          _mycourse = null;
          _mydegree = null;
          _myspecialization = null;
          yopController.clear();
          percenetageController.clear();
          // _isLoading = false;
        });
        // sharedPreferences.setString("token", jsonResponse['token']);
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
        //     (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        // _isLoading = false;
      });
      // ignore: non_constant_identifier_names
      var Msg = json.decode(response.body)['error'];
      print("The error message is: ${response.body}");
      final snackBar = SnackBar(
        content: Text(Msg),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear().whenComplete(() => Navigator.of(context)
        .pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
            (Route<dynamic> route) => false));

    // sharedPreferences.commit();
  }

// "https://swabhav-tsam.herokuapp.com/api/v1/tsam/tenant/7ca2664b-f379-43db-bdf9-7fdd40707219/talent-enquiry-form"
  List<DropdownMenuItem<String>> get dropDownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("None"), value: "None"),
    ];
    return menuItems;
  }
}
