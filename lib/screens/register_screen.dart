import 'package:e_commerc/screens/Iog_in_screen.dart';
import 'package:e_commerc/screens/profile_screen.dart';
import 'package:e_commerc/shared/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/sign_up_cubit/cubit.dart';
import '../cubits/sign_up_cubit/cubit_statues.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
 late Widget passwordIcon ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> SignUpCubit(),
        child: BlocConsumer<SignUpCubit,SignUpStates>(
          listener: (context,state)
          {
          if(state is SignUpSuccessStates)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LogInScreen()));
            }else if (
          state is FailedToSignUpStates
          ){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Center(child:  Text(state.massage)),
            ));
          }

          },
          builder: (context,state)=>Scaffold(
            backgroundColor: const Color(0xffd3d0a8),
              appBar: AppBar(
                backgroundColor:const Color(0xffd3d0a8),
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //name
                          TextFormField(
                            controller: nameController,
                            decoration:  InputDecoration(
                              prefixIcon: const Icon(Icons.person,
                                color: Color(0xff2d4569),size: 25,),
                              hintText: "Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const  BorderSide(
                                      color: Color(0xff2d4569),
                                      width: 2
                                  )
                              ),
                            ),
                            validator: (input){
                              if(nameController.text.isNotEmpty){
                                return null;
                              }else{
                                return "You must enter your name";
                              }
                            },
                          ),
                          const SizedBox(height: 10,),
                          //email
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email,
                                color: Color(0xff2d4569),size: 25,),
                              hintText: "Email",
                              border:
                              OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const  BorderSide(
                                  color: Color(0xff2d4569),
                                  width: 2
                                )
                              ),
                            ),
                            validator: (input){
                              if(emailController.text.isNotEmpty){
                                return null;
                              }else{
                                return "You must enter your email";
                              }
                            },
                          ),
                          const SizedBox(height: 10,),
                          //phone
                          TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone_in_talk_sharp,
                                color: Color(0xff2d4569),size: 25,),
                              hintText: "Phone",
                              border:
                              OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const  BorderSide(
                                      color: Color(0xff2d4569),
                                      width: 2
                                  )
                              ),
                            ),
                            validator: (input){
                              if(phoneController.text.isNotEmpty){
                                return null;
                              }else{
                                return "You must enter your phone";
                              }
                            },
                          ),
                          const  SizedBox(height: 10,),
                          //password
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              suffix: GestureDetector(
                                onTap: (){
                                  BlocProvider.of<SignUpCubit>(context).changePasswordView();
                                },
                                child:
                                Icon(BlocProvider.of<SignUpCubit>(context).isShown ? Icons.visibility_off
                                    : Icons.visibility,color: myBlueColor ,)),
                              prefixIcon:const Icon(Icons.password,
                                color: Color(0xff2d4569),size: 25,),
                              hintText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const  BorderSide(
                                      color: Color(0xff2d4569),
                                      width: 2
                                  )
                              ),
                            ),
                            validator: (input){
                              if(passwordController.text.isEmpty){
                                return "You must enter your password";
                              }else if(passwordController.text.length<7){
                                return "Your password should be more than 6 numbers";
                              }
                            },
                          ),
                          const SizedBox(height: 30,),
                          MaterialButton(
                            //height: 50, minWidth: double.infinity,
                              onPressed: ()
                          // {
                          //   if (formKey.currentState!.validate() == true){
                          //     BlocProvider.of<SignUpCubit>(context).register(
                          //         email: emailController.text,
                          //         name: nameController.text,
                          //         phone: phoneController.text,
                          //         password: passwordController.text
                          //     );
                          //   }
                          // },
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfileScreen()));
                              },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            height: 50,
                            minWidth: double.infinity,
                            color: const Color(0xff2d4569),
                            child: const Text('Register',style: TextStyle(
                              color: Colors.white,
                              fontSize: 27
                            ),),
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account ?  ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                              ),),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LogInScreen()));
                                },
                                child: const Text(
                                  'Click Here',style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: myBlueColor
                                ),
                                ),
                              )
                            ],
                          )
                        ],

                      ),
                    ),
                  ),
                ),
              )

          ),
        )

    );
  }
}
