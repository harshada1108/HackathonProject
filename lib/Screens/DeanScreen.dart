import 'package:flutter/material.dart';

class DeanScreen extends StatelessWidget {
  final List<Map<String, String>> userInfoList;

  const DeanScreen({Key? key, required this.userInfoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xFF009697),
        title: Text('Dean Screen', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: userInfoList.length,
        itemBuilder: (context, index) {
          final userInfo = userInfoList[index];
          return ListTile(
            title: Text(
              'Name: ${userInfo['IntenderName']}',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Amount: ${userInfo['Amount']}',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
