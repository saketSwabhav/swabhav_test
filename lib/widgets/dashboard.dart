import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:swabhav_test/widgets/Leaderboard.dart';
import 'package:swabhav_test/widgets/PerformanceCard.dart';
import 'package:swabhav_test/widgets/tabSection.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Dashboard"),
                      Card(
                        elevation: 3,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              trailing: CircularPercentIndicator(
                                radius: 56.0,
                                lineWidth: 6.0,
                                percent: 0.70,
                                center: const Text(
                                  "70%",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                progressColor: Colors.blueAccent,
                              ),
                              leading:
                                  Image.asset('assets/images/welcomeback.png'),
                              title: const Text('Welcome Back, user',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Color.fromRGBO(246, 67, 15, 100),
                                      fontWeight: FontWeight.bold)),
                              subtitle: const Text(
                                'Congratulations,\nhere’s your progress',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                    elevation: 3,
                    shadowColor: Colors.orange,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 15,
                        ),
                        ListTile(
                          title: const Text(
                            "Course Details",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          leading: Image.asset(
                            'assets/images/coursedetails.png',
                          ),
                          subtitle: const Text(
                            "Mon - Fri | 9 am - 1 pm",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: dummy(),

                              icon: const ImageIcon(
                                AssetImage('assets/images/google-meet.png'),
                                color: Colors.white,
                              ),

                              // ?.asset('assets/images/google-meet.png'),
                              label: const Text("Join the Session Now ",
                                  style: TextStyle(color: Colors.white)),

                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromRGBO(246, 67, 15, 100)),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ))),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: dummy(),

                              icon: const ImageIcon(
                                AssetImage('assets/images/telegramicon.png'),
                                color: Colors.white,
                              ),

                              // ?.asset('assets/images/google-meet.png'),
                              label: const Text("Message Your mentor ",
                                  style: TextStyle(color: Colors.white)),

                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromRGBO(32, 164, 226, 100)),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: Card(
                            elevation: 3,
                            shadowColor: Colors.orange,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                      "assets/images/attendance.png"),
                                  title: const Text(
                                    "Attendance",
                                    style: TextStyle(
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: const Text(
                                    "5/6",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: Card(
                            elevation: 3,
                            shadowColor: Colors.orange,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                          "assets/images/sessions.png")),
                                  title: const Text(
                                    "Sessions Completed",
                                    style: TextStyle(
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: const Text(
                                    "40",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: Card(
                            elevation: 3,
                            shadowColor: Colors.orange,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                      "assets/images/assignments.png"),
                                  title: const Text(
                                    "Projects Completed",
                                    style: TextStyle(
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: const Text(
                                    "2/4",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: Card(
                            elevation: 3,
                            shadowColor: Colors.orange,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                          "assets/images/hourscompleted.png")),
                                  title: const Text(
                                    "Hours Completed",
                                    style: TextStyle(
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: const Text(
                                    "160",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //performance

                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 210,
                    child: Card(
                      color: const Color.fromRGBO(246, 67, 15, 100),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 15,
                          ),
                          const ListTile(
                            title: Center(
                              child: Text(
                                "Your Weekly Performance Score",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            // leading: Image.asset(
                            //   'assets/images/weeklyrating.png',
                            // ),
                            // subtitle: const Text(
                            //   "Mon - Fri | 9 am - 1 pm",
                            //   style: TextStyle(color: Colors.grey),
                            // ),
                          ),
                          SizedBox(
                            height: 120,
                            width: double.infinity / 1.5,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/weeklyrating.png'),
                                  Column(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(40, 0, 0, 0),
                                        child: Text(
                                          "7.2",
                                          style: TextStyle(
                                              fontSize: 50,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                                width: 20,
                                                child: Image.asset(
                                                    'assets/images/scorecardincrease.png'),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "0.2%",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          133, 247, 156, 100),
                                                      fontSize: 20),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 20, 0, 10),
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset(
                                        'assets/images/tasklist.png')),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("Your Task List",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22)),
                                ),
                              ],
                            ),
                          ),
                          const TabSection(),
                        ],
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  const PerformanceCard(),
                  const SizedBox(
                    height: 15,
                  ),
                  const LeaderBoard(),
                ],
              ),
            ),
          ),
        ));
  }

  dummy() {}
}
