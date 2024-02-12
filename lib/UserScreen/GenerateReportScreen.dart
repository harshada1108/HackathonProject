import 'dart:typed_data';

import 'package:flutter/material.dart';

class GenerateReportScreen extends StatelessWidget {
  final List<String> eventReportData;
  final Uint8List? image;

  const GenerateReportScreen({
    Key? key,
    required this.eventReportData,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generated Report'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image != null)
              Image.memory(
                image!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 20),
            Text(
              'Event Name: ${eventReportData[0]}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Event Date: ${eventReportData[1]}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Total Amount Granted: ${eventReportData[2]}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Venue: ${eventReportData[3]}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Number of Attendees: ${eventReportData[4]}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
