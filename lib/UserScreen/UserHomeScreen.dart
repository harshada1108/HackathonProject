import 'package:flutter/material.dart';
import 'package:hackathonproject/UserScreen/ApprovalScreen.dart';

import 'package:hackathonproject/UserScreen/generateReport.dart';
import 'package:hackathonproject/UserScreen/permissionLetterScreen.dart';
import 'budget.dart';



class UserHomeScreen extends StatefulWidget {
  final String name;
  final String enrollmentno;
  const UserHomeScreen({Key? key, required this.name, required this.enrollmentno}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
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
            ListTile(
              title: Center(
                child: Text(
                  'Vaidehi Kharde',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),

          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Center(
            child: Text(
              'EventEase',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,color: Color(0xff009697),letterSpacing: 5),
            )),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline,size: 30,),
            color: Colors.white,
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.002),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height*0.03,
              ),
              const Text(
                'Letter Templates',
                style: TextStyle(color: Color(0xff009697), fontSize: 20),
              ),
              SizedBox(
                height: height*0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>PermissionLetterScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: height * 0.15,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(height * 0.02),
                            border: Border.all(
                              color: const Color(0xff009697),
                              width: width * 0.006,
                            ),
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(height * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: height * 0.05,
                                    child: IconButton(
                                      icon: Icon(Icons.home_filled, size: height * 0.07),
                                      color: Colors.white,
                                      onPressed: () {},
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: height * 0.025),
                                    child: Text('Auditorium',
                                        style: TextStyle(
                                            fontSize: height * 0.02,
                                            color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>PermissionLetterScreen()));
                      },
                      child: Container(
                        height: height * 0.15,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(height * 0.02),
                          border: Border.all(
                            color: Color(0xff009697),
                            width: width * 0.006,
                          ),
                        ),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(height * 0.02),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: height * 0.05,
                                  child: Icon(Icons.apartment,
                                      color: Colors.white,
                                      size: height * 0.08),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: height * 0.025),
                                  child: Text('MAC',
                                      style: TextStyle(
                                          fontSize: height * 0.02,
                                          color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>PermissionLetterScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: height * 0.15,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(height * 0.02),
                            border: Border.all(
                              color: Color(0xff009697),
                              width: width * 0.006,
                            ),
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(height * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: height * 0.05,
                                    child: Icon(Icons.school,
                                        color: Colors.white,
                                        size: height * 0.08),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: height * 0.025),
                                    child: Text('CRC',
                                        style: TextStyle(
                                            fontSize: height * 0.02,
                                            color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>PermissionLetterScreen()));
                      },
                      child: Container(
                        height: height * 0.15,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(height * 0.02),
                          border: Border.all(
                            color: Color(0xff009697),
                            width: width * 0.006,
                          ),
                        ),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(height * 0.02),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: height * 0.05,
                                  child: Icon(Icons.music_video_outlined,
                                    size: height * 0.08,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: height * 0.025),
                                  child: Text('others',
                                      style: TextStyle(
                                          fontSize: height * 0.02,
                                          color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height*0.03,
              ),

              //second part
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Other Activities',
                  style: TextStyle(color: Color(0xff009697), fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>generateReport()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: height * 0.15,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(height * 0.02),
                            border: Border.all(
                              color: Color(0xff009697),
                              width: width * 0.006,
                            ),
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(height * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: height * 0.05,
                                    child : IconButton(
                                        icon: Icon(Icons.sticky_note_2_outlined, size: height * 0.07),
                                        color: Colors.white,
                                        onPressed: () {}
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: height * 0.025),
                                    child: Text('Generate Report',
                                        style: TextStyle(
                                            fontSize: height * 0.02,
                                            color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: height * 0.15,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(height * 0.02),
                            border: Border.all(
                              color: Color(0xff009697),
                              width: width * 0.006,
                            ),
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(height * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: height * 0.05,
                                    child : IconButton(
                                        icon: Icon(Icons.currency_rupee, size: height * 0.07),
                                        color: Colors.white,
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>BudgetScreen()));
                                        }
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: height * 0.025),
                                    child: Text('Create Budget',
                                        style: TextStyle(
                                            fontSize: height * 0.02,
                                            color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height*0.03,
              ),
              ListTile(
                title: Center(
                  child: Text(
                    "View Approvals",
                  ),
                ),
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){},
              child: Padding(
                padding: EdgeInsets.all(height*0.01),
                child: Container(
                  height: height*0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff009697)
                  ),
                  width: width*0.45,
                  child: Icon(Icons.home_filled,size: height*0.04,color: Colors.white,),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>ApprovalScreen()));
              },
              child: Padding(
                padding: EdgeInsets.all(height*0.0),
                child: Container(
                  height: height*0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff009697),
                  ),
                  width: width*0.45,
                  child: Center(child: Text("View Approvals",style: TextStyle(color: Colors.white,),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}