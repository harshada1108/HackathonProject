import 'package:flutter/material.dart';
import 'package:hackathonproject/UserScreen/GenerateLetter.dart';

class PermissionLetterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: Colors.black,
      drawer: Drawer(
        width: width*0.7,
        backgroundColor: Colors.black,
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(30),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/EventEase (1).png'),
                backgroundColor: Colors.black,
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
              'Permission',
              style: TextStyle(fontSize: 30, color: Color(0xff009697)),
            )),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            color: Colors.white,
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: height*0.1),
          child: Column(
            children: [
              Container(
                height: height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height * 0.02),
                  border: Border.all(
                    color: const Color(0xff009697),
                    width: width * 0.006,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(width*0.05),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Permission Letter',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Dear [Authority],',
                          style: TextStyle(fontSize: 18, color: Colors.white,),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'We hereby request permission to use the venue for our upcoming event: [event]. The details are as follows:',
                          style: TextStyle(fontSize: 18, color: Colors.white,),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'We assure you that we will adhere to all rules and regulations governing the use of the venue. Our event is organized with the intention of [Event Purpose], and we will ensure that the venue is left in the same condition as we found it.',
                          style: TextStyle(fontSize: 18, color: Colors.white,),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'We kindly seek your approval for the use of the venue and appreciate your cooperation in making our event a success.',
                          style: TextStyle(fontSize: 18, color: Colors.white,),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Thank you for your attention to this matter.',
                          style: TextStyle(fontSize: 18, color: Colors.white,),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Sincerely,',
                          style: TextStyle(fontSize: 18, color: Colors.white,),
                        ),
                        Text(
                          '[Your Organization/Name]',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height*0.05),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff009697)), // Set your desired background color here
                  ),

                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => generateLetter())
                       );
                  },
                  child: const Text('Generate Letter', style: TextStyle(fontSize: 20, color: Colors.white, ),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

