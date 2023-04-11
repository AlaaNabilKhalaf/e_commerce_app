import 'package:bloc/bloc.dart';
import 'package:e_commerc/Splash_screen/my_splash_screen.dart';
import 'package:e_commerc/cubits/home_cubit/home_cubit.dart';
import 'package:e_commerc/cubits/sign_up_cubit/cubit.dart';
import 'package:e_commerc/screens/layout_screen.dart';
import 'package:e_commerc/screens/profile_screen.dart';
import 'package:e_commerc/screens/register_screen.dart';
import 'package:e_commerc/shared/constants/constants.dart';
import 'package:e_commerc/shared/network/local_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/bloc_observer/bloc_observer.dart';
import 'screens/Iog_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.cacheInitialization();
  CacheNetwork.getCacheData(key: 'token');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:
        [
          BlocProvider(create: (context) => SignUpCubit(),),
          BlocProvider(create: (context)=> HomeScreenCubit())
        ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          //SplashScreen(),
          // token != null && token != ' '? const ProfileScreen() : LogInScreen(),
        )
    );
  }
}


