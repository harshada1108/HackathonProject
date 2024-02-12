
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Statistics extends StatefulWidget {
  final List<String> expenses;

  const Statistics({Key? key, required this.expenses}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  late List<String> expenses;

  @override
  void initState() {
    super.initState();
    expenses = widget.expenses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(30),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/images.jpg'),
                radius: 70,
              ),
            ),
            SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Center(
          child: Text(
            'Budget',
            style: TextStyle(fontSize: 30, color: Color(0xff009697)),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            color: Colors.white,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => informationPage()),
              // );
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PieChart(
          PieChartData(
            sections: generatePieChartSections(),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> generatePieChartSections() {
    // Calculate total amount
    double totalAmount = 0;
    for (String expenseInfo in expenses) {
      List<String> parts = expenseInfo.split(":");
      if (parts.length > 1) {
        double amount = double.parse(parts[1].trim());
        totalAmount += amount;
      }
    }

    // Generate PieChartSectionData based on dynamic values
    List<PieChartSectionData> pieChartSections = [];
    for (String expenseInfo in expenses) {
      List<String> parts = expenseInfo.split(":");
      if (parts.length > 1) {
        String expense = parts[0].trim();
        double amount = double.parse(parts[1].trim());

        double percentage = (amount / totalAmount) * 100;
        pieChartSections.add(
          PieChartSectionData(
            value: percentage,
            color: getRandomColor(),
            title: '$expense\n${percentage.toStringAsFixed(2)}%',
            radius: 50,
          ),
        );
      }
    }

    return pieChartSections;
  }

  Color getRandomColor() {
    return Color((1.0 * 0xFF000000 + 0xFFFFFF * (DateTime.now().microsecond % 1000000 / 1000000)).toInt());
  }
}
