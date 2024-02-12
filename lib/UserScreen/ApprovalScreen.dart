import 'package:flutter/material.dart';
import '../globals/Globals.dart';

class ApprovalScreen extends StatelessWidget {
  const ApprovalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff009697),
        title: Text('Approval Corner', style: TextStyle(color: Colors.white)),
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
            subtitle: Text(userInfo['Status'] ?? '', style: TextStyle(color: Colors.white)),
            trailing: _buildStatusIcon(userInfo['Status'] ?? ''),
            onTap: () {
              // Navigate to the screen to display full user info

            },
          );
        },
      ),
    );
  }

  Widget _buildStatusIcon(String status) {
    switch (status) {
      case 'Approved':
        return Icon(Icons.check_circle, color: Colors.green);
      case 'Disapproved':
        return Icon(Icons.highlight_off, color: Colors.red);
      case 'Pending':
      default:
        return Icon(Icons.pending, color: Colors.yellow);
    }
  }
}

class UserInfoDetailScreen extends StatefulWidget {
  final Map<String, String> userInfo;

  const UserInfoDetailScreen({Key? key, required this.userInfo}) : super(key: key);

  @override
  _UserInfoDetailScreenState createState() => _UserInfoDetailScreenState();
}

class _UserInfoDetailScreenState extends State<UserInfoDetailScreen> {
  late String status;

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('User Info Detail', style: TextStyle(color: Colors.white)),
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
              'Amount: ${widget.userInfo['Amount']}',
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
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff009697)), // Set your desired background color here
                  ),
                  onPressed: () {
                    updateStatus('Approved');
                    print(userInfoList);
                  },
                  child: Text("Approve"),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff009697)), // Set your desired background color here
                  ),
                  onPressed: () {
                    updateStatus('Disapproved');
                  },
                  child: Text("Disprove"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
