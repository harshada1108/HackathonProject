import 'package:flutter/material.dart';
import 'package:hackathonproject/Screens/HomeScreen.dart';
import 'package:hackathonproject/Screens/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 300.0, end: 400.0).animate(_animationController);

    // Add a listener to the animation to trigger navigation when the animation completes
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to the next screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>DropdownButtonApp(),
          ),
        );
      }
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Container(
              width: _animation.value,
              height: _animation.value,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  image:DecorationImage(
                    image: AssetImage("images/EventEase (1).png"),
                  ),



              ),

            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
