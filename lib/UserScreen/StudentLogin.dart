import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hackathonproject/UserScreen/UserHomeScreen.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController loginIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _saveLoginCredentials(String loginId, String password) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('loginId', loginId);
      await prefs.setString('password', password);
    } catch (e) {
      // Handle exceptions, e.g., display an error message
      print('Error saving login credentials: $e');
    }
  }

  Future<Map<String, String>> _getLoginCredentials() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? loginId = prefs.getString('loginId');
      String? password = prefs.getString('password');
      return {'loginId': loginId ?? '', 'password': password ?? ''};
    } catch (e) {
      // Handle exceptions, e.g., display an error message
      print('Error retrieving login credentials: $e');
      return {'loginId': '', 'password': ''};
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: const CircleAvatar(
                  backgroundImage: AssetImage('images/EventEase (1).png'),
                  backgroundColor: Colors.black,
                  radius: 200,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: height * 0.01),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: loginIdController,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    labelText: 'Login ID',
                    hintText: 'Enter your login ID',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Color(0xff009697)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: height * 0.01),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Color(0xff009697)),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  String loginId = loginIdController.text;
                  String password = passwordController.text;

                  Map<String, String> savedCredentials = await _getLoginCredentials();
                  String savedLoginId = savedCredentials['loginId'] ?? '';
                  String savedPassword = savedCredentials['password'] ?? '';



                    // Navigate to home screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserHomeScreen(name: loginId, enrollmentno: loginId)),
                    );


                  print('Login ID: $loginId');
                  print('Password: $password');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff009697),
                ),
                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
