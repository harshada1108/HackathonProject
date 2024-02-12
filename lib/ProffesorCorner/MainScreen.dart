import 'package:flutter/material.dart';
import 'package:hackathonproject/Screens/DeanScreen.dart';
import '../globals/Globals.dart';

class ProffScreen extends StatelessWidget {
  const ProffScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff009697),
        title: Text('Professor Corner', style: TextStyle(color: Colors.white)),
      ),
      body: userInfoList.isEmpty
          ? Center(
        child: Text(
          'No user info available.',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: userInfoList.length,
        itemBuilder: (context, index) {
          final userInfo = userInfoList[index];
          return ListTile(
            title: Text(userInfo['IntenderName'] ?? '', style: TextStyle(color: Colors.white)),
            subtitle: Text(userInfo['Designation'] ?? '', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Navigate to the screen to display full user info
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserInfoDetailScreen(userInfo: userInfo),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
class UserInfoDetailScreen extends StatefulWidget {
  final Map<String, String> userInfo;

  const UserInfoDetailScreen({Key? key, required this.userInfo})
      : super(key: key);

  @override
  _UserInfoDetailScreenState createState() => _UserInfoDetailScreenState();
}

class _UserInfoDetailScreenState extends State<UserInfoDetailScreen> {
  late String status;
  List<Map<String, String>> greaterThan25kList = [];

  @override
  void initState() {
    super.initState();
    // Set the status initially
    status = widget.userInfo['Status'] ?? 'Pending';
  }

  void updateStatus(String newStatus) {
    setState(() {
      status = newStatus;
      widget.userInfo['Status'] = newStatus;
      if (newStatus == 'Approved') {
        int amount = int.parse(widget.userInfo['Amount']!);
        if (amount > 25000) {
          greaterThan25kList.add(widget.userInfo);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DeanScreen(userInfoList: greaterThan25kList),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xFF009697),
        title: Text('Student Demand Draft', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name of Intender: ${widget.userInfo['IntenderName']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Designation: ${widget.userInfo['Designation']}',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Department: ${widget.userInfo['Department']}',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Purpose: ${widget.userInfo['Purpose']}',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Name of Scheme: ${widget.userInfo['NameofScheme']}',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Amount: ${widget.userInfo['Amount'].toString().toString()}',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Status: $status',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff009697)),
                  ),
                  onPressed: () {
                    updateStatus('Approved');
                  },
                  child: Text("Approved"),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff009697)),
                  ),
                  onPressed: () {
                    updateStatus('Disapproved');
                  },
                  child: Text("Disprove"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
