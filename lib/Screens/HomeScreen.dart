import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
        backgroundColor: Color(0xFF009697),
      ),
      body:Container(
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(height * 0.04),
                  child: Padding(
                    padding:  EdgeInsets.only(top: height*0.03),
                    child: Column(
                      children: [
                        Icon(Icons.home_rounded,color: Color(0xFF009697),size: height*0.05,),
                        Text("Faculty Welfare",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),

                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(height * 0.04),
                  child: Padding(
                    padding:  EdgeInsets.only(top: height*0.03),
                    child: Column(
                      children: [
                        Icon(Icons.home_rounded,color: Color(0xFF009697),size: height*0.05,),
                        Text("Faculty Welfare",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),

                ),
              ],
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(height * 0.04),
                  child: Padding(
                    padding:  EdgeInsets.only(top: height*0.03),
                    child: Column(
                      children: [
                        Icon(Icons.home_rounded,color: Color(0xFF009697),size: height*0.05,),
                        Text("Faculty Welfare",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),

                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(height * 0.04),
                  child: Padding(
                    padding:  EdgeInsets.only(top: height*0.03),
                    child: Column(
                      children: [
                        Icon(Icons.home_rounded,color: Color(0xFF009697),size: height*0.05,),
                        Text("Faculty Welfare",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),

                ),
              ],
            ),
            Row(
              children: [
                ClipRRect(

                  borderRadius: BorderRadius.circular(height * 0.04 ),
                  
                  child: Padding(
                    padding:  EdgeInsets.only(top: height*0.03),
                    child: Column(
                      children: [
                        Icon(Icons.home_rounded,color: Color(0xFF009697),size: height*0.05,),
                        Text("Faculty Welfare",style: TextStyle(color: Color(0xFF009697),fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),

                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(height * 0.04),
                  child: Padding(
                    padding:  EdgeInsets.only(top: height*0.03),
                    child: Column(
                      children: [
                        Icon(Icons.person,color: Color(0xFF009697),size: height*0.05,),
                        Text("User Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),

                ),
              ],
            )
          ],
        ),
      ) ,
    );
  }
}
