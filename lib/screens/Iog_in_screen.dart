import 'package:e_commerc/shared/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/sign_up_cubit/cubit.dart';
import '../cubits/sign_up_cubit/cubit_statues.dart';
import 'register_screen.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
final emailController = TextEditingController();
final nameController = TextEditingController();
final passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image:
              AssetImage("images/auth_background.png"),fit: BoxFit.fill),
            ),
            child:
            Column(
              children: [
                const Expanded(
                  child: Center(
                    child: Text("Login to continue the process",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),),
                  ),
                ),
                // const SizedBox(height: 10,),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffd3d0a8),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(40),)
                    ),
                    child: BlocConsumer<SignUpCubit,SignUpStates>(
                      listener:(context,state){
                        if( state is LoginSuccessStates){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                        }
                        if( state is FailedToLoginStates){
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content:
                              Center(child: Text(
                                  'Something went wrong, try again later..'
                              )),
                              ));
                        }
                      },
                      builder: (context,state)=> SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(45.0),
                              child:
                              Column(
                                children: [
                             const  Text("Login",style: TextStyle(
                                      color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold
                                  ),),
                                  // Name
                                  TextFormField(
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      hintText: 'UserName',
                                      prefixIcon: Icon(Icons.person,color: Color(0xff2d4569),),

                                    ),
                                    validator:(input){
                                      if (nameController.text.isEmpty){
                                        return 'You must enter your Name';
                                      }
                                      else{
                                        return null ;
                                      }
                                    },
                                  ),
                                  // Email
                                  TextFormField(
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                     hintText: 'Email',
                                     prefixIcon: Icon(Icons.password,color: Color(0xff2d4569),),

                                    ),
                                    validator:(input){
                                      if (emailController.text.isEmpty){
                                        return 'You must enter your email';
                                      }
                                      else{
                                        return null ;
                                      }
                                    },
                                  ),
                                  // Password
                                  TextFormField(
                                    controller: passwordController,
                                    obscureText: BlocProvider.of<SignUpCubit>(context).isShown ? true : false ,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      prefixIcon:const Icon(Icons.email,color:  Color(0xff2d4569),),
                                      suffixIcon: GestureDetector(
                                        onTap: ()
                                        {
                                          BlocProvider.of<SignUpCubit>(context).changePasswordView();
                                        },
                                        child:
                                        Icon(BlocProvider.of<SignUpCubit>(context).isShown ? Icons.visibility_off
                                            : Icons.visibility,color: myBlueColor ,),
                                      )

                                    ),
                                    validator:(input){
                                      if (passwordController.text.isEmpty){
                                        return 'You must enter your password';
                                      }
                                      else{
                                        return null ;
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                              child: MaterialButton(
                                onPressed: (){
                                  if (formKey.currentState!.validate() == true)
                                  {
                                    BlocProvider.of<SignUpCubit>(context).login(email: emailController.text, password: passwordController.text);
                                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUPScreen()));
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                height: 50,
                                // shape:  const Border.symmetric(horizontal: BorderSide.,vertical:BorderSide.none),
                                minWidth: double.infinity,
                                color: const Color(0xff2d4569),
                                elevation: 0,
                                child: const FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text( "Login"
                            //      state is LoginLoadingStates ? "Loading..." : "Login",
                                 ,style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                    ), ),
                                ),
                              ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                const Text("Don't have an Account ?  ",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17
                                ),),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const RegisterScreen()));
                                  },
                                  child: const Text("Click here",
                                  style: TextStyle(
                                    color: myBlueColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
