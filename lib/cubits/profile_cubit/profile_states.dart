abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}
class GetUserDataSuccessState extends ProfileStates {}
class GetUserDataLoadingState extends ProfileStates {}
class FailToGetUserDataState extends ProfileStates {
  String error;
  FailToGetUserDataState({required this.error});

}