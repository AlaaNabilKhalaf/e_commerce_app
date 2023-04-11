import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:e_commerc/cubits/profile_cubit/profile_states.dart';
import 'package:e_commerc/models/user_model.dart';
import 'package:http/http.dart' as http ;
import 'package:http/http.dart';
import '../../shared/constants/constants.dart';


class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit() : super(ProfileInitialState());
UserModel? userModel;
  void getUserData () async {
    emit(GetUserDataLoadingState());
Response response = await http.get(
  Uri.parse('https://student.valuxapps.com/api/profile'),
  headers: {
    'Authorization' : token! ,
    'lang' : 'en',

  }
);
var responseData =  jsonDecode(response.body);
if( responseData['status'] == true){
  userModel = UserModel.fromJson(
      date: responseData['data']);
  emit(GetUserDataSuccessState());
}else{
  emit(FailToGetUserDataState
    (error: responseData['message']));
}
  }


}