import 'package:flutter/material.dart';
import '../globals/Globals.dart';
import 'Globals.dart';
import 'package:shared_preferences/shared_preferences.dart';



class GeneratedLetterScreen extends StatefulWidget {

  final String intenderName;
  final String designation;
  final String  Department;
  final String Purpose;
  final String NameofScheme;
  final  String Amount;

  // Move the list here

  GeneratedLetterScreen({
    Key? key,
    required this.intenderName,
    required this.designation,
    required this.Department,
    required this.Purpose,
    required this.NameofScheme,
    required this.Amount,
  }) : super(key: key);

  @override
  State<GeneratedLetterScreen> createState() => _GeneratedLetterScreenState();
}

class _GeneratedLetterScreenState extends State<GeneratedLetterScreen> {
  @override
  void initState() {
    super.initState();
    addToUserInfoList(
      widget.intenderName,
      widget.designation,
      widget.Department,
      widget.Purpose,
      widget.NameofScheme,
      widget.Amount,
    );
    saveUserInfoListToPrefs();
    fetchUserInfoListFromPrefs();
  }
  void addToUserInfoList(String intenderName, String designation, String department, String purpose, String nameofScheme, String amount) {
    userInfoList.add({
      'IntenderName': intenderName,
      'Designation': designation,
      'Department': department,
      'Purpose': purpose,
      'NameofScheme': nameofScheme,
      'Amount': amount,
    });
  }

  Future<void> saveUserInfoListToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> userInfoListString = userInfoList.map((userInfo) => userInfo.toString()).toList();
    await prefs.setStringList('userInfoList', userInfoListString);
  }
  Future<void> fetchUserInfoListFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? userInfoListString = prefs.getStringList('userInfoList');
    if (userInfoListString != null) {
      setState(() {
        userInfoList = userInfoListString.map((userInfo) {
          Map<String, String> userInfoMap = {};
          userInfo.split(', ').forEach((info) {
            List<String> keyValue = info.split(': ');
            userInfoMap[keyValue[0]] = keyValue[1];
          });
          return userInfoMap;
        }).toList();
      });
    }
    print(userInfoListString);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
        title: const Text('Generated Letter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name of Intender: ',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                width: width*0.8,

                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue), // Border color
                    borderRadius: BorderRadius.circular(5), // Optional: border radius
                  ),
                child: Text(widget.intenderName.toString(),style: TextStyle(color: Colors.white),maxLines: 2,),

              ),
              Text(
                'Designation:',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                width: width*0.8,


                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue), // Border color
                  borderRadius: BorderRadius.circular(5), // Optional: border radius
                ),
                child: Text(widget.designation.toString(),style: TextStyle(color: Colors.white),maxLines: 2,),

              ),
              Text(
                'Department:',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                width: width*0.8,


                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue), // Border color
                  borderRadius: BorderRadius.circular(5), // Optional: border radius
                ),
                child: Text(widget.Department.toString(),style: TextStyle(color: Colors.white),maxLines: 2,),

              ),

              Text(
                'Purpose and Justification:',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                width: width*0.8,


                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue), // Border color
                  borderRadius: BorderRadius.circular(5), // Optional: border radius
                ),
                child: Text(widget.Purpose.toString(),style: TextStyle(color: Colors.white),maxLines: 2,),

              ),
              Text(
                'Name of Scheme:',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                width: width*0.8,


                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue), // Border color
                  borderRadius: BorderRadius.circular(5), // Optional: border radius
                ),
                child: Text(widget.NameofScheme.toString(),style: TextStyle(color: Colors.white),maxLines: 2,),

              ),
              Text(
                'Amount in Rs:',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                width: width*0.8,


                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue), // Border color
                  borderRadius: BorderRadius.circular(5), // Optional: border radius
                ),
                child: Text(widget.Amount.toString(),style: TextStyle(color: Colors.white),maxLines: 2,),

              ),
              Padding(
                padding: EdgeInsets.only(top: height*0.02),
                child: ElevatedButton(
                  onPressed: () {

    addToUserInfoList(widget.intenderName, widget.designation, widget.Department, widget.Purpose, widget.NameofScheme, widget.Amount); // Call the function here
    print(userInfoList);
    saveUserInfoListToPrefs();
                    }

                ,
                  child: const Text("Next", style: TextStyle(fontSize: 20, color: Colors.white),),
                ),
              ),


              // Add more information as needed...
            ],
          ),
        ),
      ),
    );
  }
}
