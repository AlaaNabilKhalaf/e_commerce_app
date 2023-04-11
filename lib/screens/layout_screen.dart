import 'package:e_commerc/cubits/home_cubit/home_cubit.dart';
import 'package:e_commerc/cubits/home_cubit/home_states.dart';
import 'package:e_commerc/shared/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> HomeScreenCubit(),
    child: BlocConsumer<HomeScreenCubit , HomeScreenStates>(
      listener: (context,state){},
      builder: (context, state)=> Scaffold(
        appBar: AppBar(
          backgroundColor: myWhiteColor,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child:   Image.asset('assets/images/logo.png',width: 60,height: 40,),
          ),
          leadingWidth: 130,
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.list_outlined,
              color: myBlueColor,size: 35,))
          ],),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: myBlueColor,),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.category_outlined,color: myBlueColor,),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border,color: myBlueColor,),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,color: myBlueColor,),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.perm_identity,color: myBlueColor,),label: ''),
          ],
          currentIndex: BlocProvider.of<HomeScreenCubit>(context).CurrentIndexFromButtomNav,
          onTap: (int index){
            BlocProvider.of<HomeScreenCubit>(context).ChangeIndex(index);
          },
        ),
      ),
    ),);

  }
}
