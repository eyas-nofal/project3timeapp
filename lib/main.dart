
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  String weekDay = "";
  String dateToday = "";
  String timeNow = "";

void  _changeDateEverySecond() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        weekDay=DateFormat.EEEE().format(DateTime.now());
        dateToday = DateFormat('MMMM d, y').format(DateTime.now()); 
        timeNow  = DateFormat('hh:mm:ss a').format(DateTime.now()); 
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _changeDateEverySecond();
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
              "Today is $weekDay  ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "$dateToday",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Text(
              "$timeNow",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
