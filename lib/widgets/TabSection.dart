// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class TabSection extends StatelessWidget {
  const TabSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: const TabBar(
                  indicator: UnderlineTabIndicator(
                      // color for indicator (underline)
                      borderSide: BorderSide(color: Colors.deepOrangeAccent)),
                  // primaryColor: Colors.pink[800], // outdated and has no effect to Tabbar
                  // accentColor: Colors.cyan[600] // deprecated,

                  labelColor: Colors.orange,
                  labelStyle: TextStyle(color: Colors.deepOrangeAccent),
                  tabs: [
                    Tab(
                      text: "Pending",
                      icon: Text("(5)"),
                    ),
                    Tab(
                      text: "Submitted",
                      icon: Text("(3)"),
                    ),
                    Tab(
                      text: "Completed",
                      icon: Text("(1)"),
                    ),
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(children: [
                SingleChildScrollView(
                  child: SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Card(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              title: Text("Name: Reflection"),
                              subtitle: Text("Due Date: 22nd Nov"),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              title: Text("Name: To Do Persistence App"),
                              subtitle: Text("Due Date: 22nd Nov"),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              title:
                                  Text("Name: Serialization/Deserialization"),
                              subtitle: Text("Due Date: 23nd Nov"),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              title: Text("Name: Code Refactoring Pigment"),
                              subtitle: Text("Due Date: 24th Nov"),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              title: Text("Name: Reading Head First"),
                              subtitle: Text("Due Date: 23rd Nov"),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
                ),
                SingleChildScrollView(
                  child: SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Card(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              title: Text("Name: Type Erasure"),
                              subtitle: Text("Due Date: 20th Nov"),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              title: Text("Name: Reading Chapters"),
                              subtitle: Text("Due Date: 20th Nov"),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              title: Text("Name: Custom Annotation"),
                              subtitle: Text("Due Date: 20th Nov"),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
                SingleChildScrollView(
                  child: SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Card(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              title: Text("Name: Shopping Cart"),
                              subtitle: Text("Due Date: 19th Nov"),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              ]),
            )
          ],
        ));
  }
}
