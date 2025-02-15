import 'package:flutter/material.dart';

class DailySalahPage extends StatefulWidget {
  final DateTime selectedDate;

  const DailySalahPage({super.key, required this.selectedDate}); // receive selected date

  @override
  State<DailySalahPage> createState() => _DailySalahPageState();
}

class _DailySalahPageState extends State<DailySalahPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Salah - ${_formatDate(widget.selectedDate)}"),
        leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context), // back to calendar page
      ),
    ),
    body: Column(
      children: [
        _buildChecklistItem("Fajr"),
        _buildChecklistItem("Dhur"),
        _buildChecklistItem("Asr"),
        _buildChecklistItem("Maghrib"),
        _buildChecklistItem("Isha"),
        const SizedBox(height: 20), 
        ElevatedButton(
          onPressed: () {
            //Rewared of Day
          },
          child: const Text ("Reward of the Day"),
          ),
        ],
      ),
    );
  }
  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}"; // format dd.MM.yyyy
  }

  Widget _buildChecklistItem(String prayer) {
    return ListTile(
      title: Text(prayer),
      subtitle: const Text("Tap to verify"),
      trailing: IconButton(
        icon: const Icon(Icons.check_box_outline_blank, color: Colors.red),
        onPressed: () {
      // camera verif.
    },
  ),
  );
  }
}
