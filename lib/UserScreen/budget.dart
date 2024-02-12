

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'Stats.dart';

class BudgetScreen extends StatefulWidget {
  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  TextEditingController _expenseController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  List<String> expenses = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(

      backgroundColor: Colors.black,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.001),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.05),
                child: TextField(
                  controller: _expenseController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: "Enter expense",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 3, color: Color(0xff009697)),
                    ),
                    hintText: "Enter expense",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.05),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  controller: _amountController,
                  decoration: const InputDecoration(
                    labelText: "Enter amount",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 3, color: Color(0xff009697)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: ElevatedButton(
                  onPressed: () {
                    addExpense();
                  },
                  child: Text(
                    "Add Expense",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff009697),
                  ),
                ),
              ),
              const Text(
                "Expense List:",
                style: TextStyle(fontSize: 30, color: Color(0xff009697)),
              ),
              SingleChildScrollView(
                child: Container(
                  height: height * 0.2,
                  width: width * 0.9,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xff009697)),
                      left: BorderSide(color: Color(0xff009697)),
                      right: BorderSide(color: Color(0xff009697)),
                      bottom: BorderSide(color: Color(0xff009697)),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: expenses.length,
                    itemBuilder: (context, index) {
                      String expenseInfo = expenses[index];
                      List<String> parts = expenseInfo.split(":");

                      String expense = parts.length > 0 ? parts[0] : "";
                      String amount = parts.length > 1 ? parts[1] : "";
                      return Dismissible(
                        key: Key(expenses[index]),
                        onDismissed: (direction) {
                          deleteExpense(index);
                        },
                        background: Container(
                          color: Colors.red,
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Expense: $expense',
                                style: TextStyle(
                                    color: Colors.white, fontSize: height * 0.02),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                'Amount: $amount',
                                style: TextStyle(
                                    color: Colors.white, fontSize: height * 0.02),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Statistics(expenses: expenses),
                      ),
                    );
                  },
                  child: Text(
                    "Statistics",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff009697),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addExpense() {
    String expense = _expenseController.text;
    String amount = _amountController.text;

    if (expense.isNotEmpty && amount.isNotEmpty) {
      String expenseInfo = "$expense: $amount";
      setState(() {
        expenses.add(expenseInfo);
      });

      _expenseController.clear();
      _amountController.clear();
    }
  }

  void deleteExpense(int index) {
    setState(() {
      expenses.removeAt(index);
    });
  }
}
