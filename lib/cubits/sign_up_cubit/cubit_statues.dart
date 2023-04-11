abstract class SignUpStates{}

class SignUpInitialStates extends SignUpStates {}
class SignUpLoadingStates extends SignUpStates {}
class SignUpSuccessStates extends SignUpStates {}
class FailedToSignUpStates extends SignUpStates {
  final String massage ;
  FailedToSignUpStates({required this.massage});
}

class LoginLoadingStates extends SignUpStates {}
class LoginSuccessStates extends SignUpStates {}
class ChangePasswordViewState extends SignUpStates {}
class FailedToLoginStates extends SignUpStates {
  final String message;
  FailedToLoginStates({
    required this.message
});
}

