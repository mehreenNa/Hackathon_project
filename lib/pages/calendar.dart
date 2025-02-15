import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hackathon_buhbyebyte/pages/daily_salah.dart';

class CalendarPage extends StatefulWidget{ // stateful instead of stateless as flutter needs to rebuild UI per date change
  const CalendarPage({super.key}); 
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> { // manage calendar
DateTime _viewedDay = DateTime.now(); // current month tracking
DateTime? _selectedDay; // Day that user selects

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calendar Page')),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _viewedDay,
            firstDay: DateTime(2025, 1, 1), // first day
            lastDay: DateTime(2200, 12, 31), // final day
            calendarFormat: CalendarFormat.month, // entire month display
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day), // if day selected = true then highlight selected
            onDaySelected: (selectedDay, focusedDay) { // when user selects a day
              setState(() { // update IU bc changed date
                _selectedDay = selectedDay; // store selected date
                _viewedDay = focusedDay; // update calendar per selection
              });

              Navigator.push( // push new page onto stack
                context, // current UI state i.e. push when date has been selected
              MaterialPageRoute(builder: (context) => DailySalahPage(selectedDate: selectedDay),), 
              );
            },
          )
        ],
      ),
    );
  }
}

