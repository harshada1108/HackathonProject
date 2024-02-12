import 'package:flutter/material.dart';
import '../globals/Globals.dart';

class generateReportScreen extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String totalAmount;
  final String venue;
  final String attendees;

  generateReportScreen({
    Key? key,
    required this.eventName,
    required this.eventDate,
    required this.totalAmount,
    required this.venue,
    required this.attendees,
  }) : super(key: key);

  void addToReportList(String eventName, String eventDate, String totalAmount, String venue, String attendees) {
    report.add({
      'Event Name': eventName,
      'Event Date': eventDate,
      'Total Amount Granted': totalAmount,
      'Venue': venue,
      'Number of Attendees': attendees,
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Generated Report'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Event Name: ',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                width: width * 0.8,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  eventName.toString(),
                  style: TextStyle(color: Color(0xff009697)),
                  maxLines: 2,
                ),
              ),
              Text(
                'Event Date:',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                width: width * 0.8,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  eventDate.toString(),
                  style: TextStyle(color: Color(0xff009697)),
                  maxLines: 2,
                ),
              ),
              Text(
                'Total Amount Granted:',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                width: width * 0.8,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  totalAmount.toString(),
                  style: TextStyle(color: Color(0xff009697)),
                  maxLines: 2,
                ),
              ),
              Text(
                'Venue:',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                width: width * 0.8,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  venue.toString(),
                  style: TextStyle(color:Color(0xff009697)),
                  maxLines: 2,
                ),
              ),
              Text(
                'Number of Attendees:',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                width: width * 0.8,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  attendees.toString(),
                  style: TextStyle(color: Color(0xff009697)),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff009697)), // Set your desired background color here
                  ),
                  onPressed: () {
                    addToReportList(eventName, eventDate, totalAmount, venue, attendees);
                    print(report);
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
