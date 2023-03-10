import 'dart:convert';
import 'package:e_commerc/register_screen/sign_up_cubit/cubit_statues.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialStates());

  void register(
  {
    required String email,
    required String name,
    required String phone,
    required String password,
  })
  async {
    emit(SignUpLoadingStates());
 try{
   Response response = await http.post(
       Uri.parse('https://student.valuxapps.com/api/register'),
       body: {
         'name' : name,
         'email': email,
         'phone': phone,
         'password' : password,
         'image' : ""
       }
   );
   if(response.statusCode == 200 )
   {
     var data = jsonDecode(response.body);
     if(data[state] == true)
    {
      print('Response is $data');
      emit(SignUpSuccessStates());}
     else{
       print('Response is ${data}');
       emit(FailedToSignUpStates(massage: data['message']));
   }
   }
 }catch(e){
   emit(FailedToSignUpStates(massage: e.toString()));
 }
  }

  Future<void> login(
  {
  required String email,
  required String password,
}) async {
    emit(LoginLoadingStates());
    try{ Response response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/login'),
      body: {
        'email' : email,
        'password' : password
      },
    );
      if(response.statusCode == 20){
        var data = jsonDecode(response.body);
        if (data[state] == true){
          emit(LoginSuccessStates());
          debugPrint(data['message']);
        }
        else{
          emit(FailedToLoginStates(message: data['message']));
          debugPrint(data['message']);
        }
      }
    }catch(e){
      emit(FailedToLoginStates(message: e.toString()));
    }
  }
}