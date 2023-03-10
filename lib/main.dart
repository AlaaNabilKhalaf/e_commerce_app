import 'package:bloc/bloc.dart';
import 'package:e_commerc/register_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'bloc_observer.dart';
import 'log_in_screen/Iog_in_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: SignUPScreen(),
    );
  }
}


