import 'package:e_commerc/screens/Iog_in_screen.dart';
import 'package:e_commerc/screens/register_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Future.delayed(const Duration(seconds:3),(){
      Navigator.pushReplacement(context, MaterialPageRoute
        (builder: (context)=> LogInScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Expanded(child: Center(
                child:
                Image.asset('assets/images/logo.png',
                  fit: BoxFit.cover,),
              )),
              const Text('E-Commerce',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
