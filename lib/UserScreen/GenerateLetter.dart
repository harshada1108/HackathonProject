import 'package:flutter/material.dart';
import 'package:hackathonproject/ProffesorCorner/MainScreen.dart';
import 'package:hackathonproject/UserScreen/GeneratedLetter.dart';


const List<String> list = <String>[
  'MAG',
  'ECELL',
  'IEEE',
  'Prayaas',
  'Aslesha',
  'IVLabs',
  'Tesla',
  'Grooves',
  'Iridescence',
  'TeamVelocity',
  'Hallabol',
  'SHELL',
  'ACM',
  'Samwaad',
  'Octaves',
  'ThinkIndia'
];

Map<String, String> ProffIncharge =
{
  'MAG' : 'Professor',
  'ECELL': 'Professor' ,
  'IEEE': 'Professor',
  'Prayaas':'Professor',
  'Aslesha':'Professor',
  'IVLabs':'Professor',
  'Tesla':'Professor',
  'Grooves':'Professor',
  'Iridescence':'Professor',
  'TeamVelocity':'Professor',
  'Hallabol':'Professor',
  'SHELL':'Professor',
  'ACM':'Professor',
  'Samwaad':'Professor',
  'Octaves':'Professor',
  'ThinkIndia':'Professor'
};
class generateLetter extends StatefulWidget {
  const generateLetter({Key? key}) : super(key: key);

  @override
  State<generateLetter> createState() => _generateReport();
}

class _generateReport extends State<generateLetter> {
  final TextEditingController IntenderName = TextEditingController();
  final TextEditingController Designation = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController purpose = TextEditingController();
  final TextEditingController nameofScheme = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController Club = TextEditingController();
  String dropdownValue = list.first;



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
              'Generate letter',
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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.002),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height*0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height*0.02),
                      child: TextField(
                        controller: IntenderName,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Name of the Intender',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height*0.02),
                      child: TextField(
                        controller: Designation,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Designation',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height*0.02),
                      child: TextField(
                        controller: department,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Department',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height*0.02),
                      child: TextField(
                        controller: purpose,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Purpose and Justification',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height*0.02),
                      child: TextField(
                        controller: amount,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Amount in Rs',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height*0.02),
                      child: TextField(
                        controller: nameofScheme,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Name of the Scheme',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,  // Set the background color here
                          border: Border.all(
                            color: Colors.white,
                            width: width * 0.006,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.004),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            style: TextStyle(color: Colors.white),
                            icon: Icon(Icons.arrow_drop_down, size: height * 0.07),
                            isExpanded: true,
                            elevation: 16,
                            dropdownColor: Colors.black,  // Set the dropdown background color here
                            onChanged: (String? value) {
                              setState(() {
                                dropdownValue = value!;
                                print(ProffIncharge[dropdownValue]);
                              });
                            },
                            items: list.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: height*0.02),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GeneratedLetterScreen(intenderName: IntenderName.text, designation: Designation.text, Department: department.text, Purpose: purpose.text, NameofScheme: nameofScheme.text, Amount: amount.text)),
                          );
                        },
                        child: const Text("Generate letter", style: TextStyle(fontSize: 20, color: Colors.cyan),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
