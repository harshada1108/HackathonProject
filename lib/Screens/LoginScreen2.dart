import 'package:flutter/material.dart';
import 'package:hackathonproject/ProffesorCorner/MainScreen.dart';
import 'package:hackathonproject/UserScreen/StudentLogin.dart';
import 'package:hackathonproject/UserScreen/UserHomeScreen.dart';
import 'package:hackathonproject/UserScreen/generateReport.dart';


class LoginScreen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: Colors.black,


        body: Padding(
          padding:  EdgeInsets.only(top:height*0.1,left: width*0.1,right: width*0.1),
          child: Container(

            child: ListView(
              children: [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Container(
                    child: Text("Login as" ,style: TextStyle(color: Color(0xFF009697)),),
                  ),
                ),
                InkWell(
                  onTap: ()
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>ProffScreen()),
                    );
                  },
                  child: CustomListTile(
                    name:"Proffesor in Charge",
                    leadingIcon: Icons.person,
                    borderColor: Color(0xFF009697), // Border color for the first tile
                  ),
                ),
                CustomListTile(
                  name: "Dean",
                  leadingIcon: Icons.person,
                  borderColor: Color(0xFF009697), // Border color for the second tile
                ),
                InkWell(
                  onTap: ()
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>LoginPage()),
                    );
                  },
                  child: CustomListTile(
                    name: "Student",
                    leadingIcon: Icons.person,
                    borderColor: Color(0xFF009697), // Border color for the third tile
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData leadingIcon;
  final Color borderColor;
  final String name;

  const CustomListTile({
    Key? key,
    required this.leadingIcon,
    required this.borderColor,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor), // Setting border color
      ),
      child: ListTile(

        leading: Icon(leadingIcon ,color: Colors.white,),
        title: Text(name ,style: TextStyle(color: Colors.white),),


      ),
    );
  }
}
