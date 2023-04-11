import 'package:e_commerc/cubits/profile_cubit/profile_cubit.dart';
import 'package:e_commerc/cubits/profile_cubit/profile_states.dart';
import 'package:e_commerc/models/user_model.dart';
import 'package:e_commerc/shared/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> ProfileCubit()..getUserData(),
    child: BlocConsumer<ProfileCubit,ProfileStates>(
      listener: (context,state){},
      builder: (context,state) {
        final cubit = BlocProvider.of<ProfileCubit>(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: myWhiteColor,
            leadingWidth: 0,
            title: const Text('Profile',style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),),
          ),
          body:// cubit.userModel != null ?
          Center
            (child:
            Padding(
              padding: const EdgeInsets.all(33.0),
              child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person,color: myBlueColor,size: 70,),
                ),
               const SizedBox(height: 20,),
                Text('${cubit.userModel?.name}',style:const TextStyle(
                   fontSize: 25
                 ),),
                const SizedBox(height: 20,),
                Text('${cubit.userModel?.email}',style: const TextStyle(
                    fontSize: 25
                ),),
                const SizedBox(height: 20,),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: myYellowColor,
                 //   shape: BoxShape.rectangle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: GestureDetector(
                      onTap: (){},
                      child: Row(
                        children: [
                          Icon(Icons.person,size: 31,color: Colors.grey.shade700,),
                          const SizedBox(width: 8,),
                          const Text('Update Data',
                          style: TextStyle(
                            color: myBlueColor,
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                  )
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: myYellowColor,
                 //   shape: BoxShape.rectangle
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: GestureDetector(
                      onTap: (){},
                      child: Row(
                        children: [
                          Icon(Icons.shopping_cart,size: 31,color: Colors.grey.shade700,),
                          const SizedBox(width: 8,),
                          const Text('Orders',
                            style: TextStyle(
                                color: myBlueColor,
                                fontSize: 23,
                                fontWeight: FontWeight.bold
                            ),)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: myYellowColor,
                 //   shape: BoxShape.rectangle
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: GestureDetector(
                      onTap: (){},
                      child: Row(
                        children: [
                          Icon(Icons.favorite,size: 31,color: Colors.grey.shade700,),
                          const SizedBox(width: 8,),
                          const Text('Favorite',
                            style: TextStyle(
                                color: myBlueColor,
                                fontSize: 23,
                                fontWeight: FontWeight.bold
                            ),)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: myYellowColor,
                 //   shape: BoxShape.rectangle
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: GestureDetector(
                      onTap: (){},
                      child: Row(
                        children: [
                          Icon(Icons.output_outlined,size: 31,color: Colors.grey.shade700,),
                          const SizedBox(width: 8,),
                          const Text('Log Out',
                            style: TextStyle(
                                color: myBlueColor,
                                fontSize: 23,
                                fontWeight: FontWeight.bold
                            ),)
                        ],
                      ),
                    ),
                  ),
                ),


              ],
          ),
            ),)




                //: const Center(child: CircularProgressIndicator(),)




        );
      }

    ));
  }
}


