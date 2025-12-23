import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DateApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DateApp extends StatefulWidget {
  const DateApp({super.key});

  @override
  State<DateApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DateApp> {
  List monthsList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  List dayList = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  String yearNow = "";
  String dayweek = "";
  String monthNow = "";
  String dayNum = "";
  late int hour24;
  String minutes = "";
  String seconds = "";
  int hour12 = 12;
  String period = "";

  changeDateEverySecond() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        yearNow = DateTime.now().year.toString();
        dayNum = DateTime.now().day.toString();
        dayweek = dayList[(DateTime.now().weekday) - 1];
        monthNow = monthsList[DateTime.now().month - 1];
        hour24 = DateTime.now().hour;
        if (hour24 == 0) {
          hour12 = 12;
          period = "AM";
        } else if (hour24 == 12) {
          hour12 = 12;
          period = "PM";
        } else if (hour24 > 12) {
          hour12 = hour24 - 12;
          period = "PM";
        } else {
          hour12 = hour24;
          period = "AM";
        }

        minutes = DateTime.now().minute.toString();
        seconds = DateTime.now().second.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    changeDateEverySecond();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date & Time app", style: TextStyle(fontSize: 25)),
        backgroundColor: Colors.grey,
        shadowColor: Colors.black,
        elevation: 20,
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today is $dayweek  ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "$monthNow $dayNum, $yearNow",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Text(
              "${hour12.toString().padLeft(2, "0")} : ${minutes.padLeft(2, "0")} : ${seconds.padLeft(2, "0")} ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
