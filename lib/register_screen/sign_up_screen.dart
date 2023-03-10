import 'package:e_commerc/log_in_screen/Iog_in_screen.dart';
import 'package:e_commerc/register_screen/sign_up_cubit/cubit.dart';
import 'package:e_commerc/register_screen/sign_up_cubit/cubit_statues.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUPScreen extends StatefulWidget {
  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  late bool visable ;

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
                            obscureText: visable,
                            decoration: InputDecoration(
                              suffix:const Icon(Icons.remove_red_eye_outlined,color: Color(0xff2d4569),size: 15,)
                              // visable ?
                              // IconButton(icon: const Icon(Icons.remove_red_eye,color: Color(0xff2d4569),
                              // ), onPressed: () {
                              //   visable == false;
                              //   setState(() {
                              //   });
                              // },):
                              //     IconButton(onPressed: (){
                              //       visable == true;
                              //       setState(() {
                              //       });
                              //     }, icon: const Icon(Icons.not_interested_rounded,color:Color(0xff2d4569) ,))
                                ,
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
                          {
                            if (formKey.currentState!.validate() == true){
                              BlocProvider.of<SignUpCubit>(context).register(
                                  email: emailController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text
                              );
                            }
                          },
                            height: 40,
                            minWidth: 80,
                            color: const Color(0xff2d4569),
                            child: const Text('Register',style: TextStyle(
                              color: Colors.white,
                              fontSize: 25
                            ),),
                          ),
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
