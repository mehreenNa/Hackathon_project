import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calendar Page')),
      body: Center(
        child: Text('Welcome to the Calendar Page!'),
      ),
    );
  }
}
