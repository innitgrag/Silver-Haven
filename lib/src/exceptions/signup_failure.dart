

class SignupFailure{
  final String message;
  const SignupFailure([this.message="An Unknown error occured."]);
  factory SignupFailure.code(String code){
    switch(code){
      case 'weak-password':
        return const SignupFailure('Please enter a strong password.');

      case 'invalid-email':
        return const SignupFailure('Email is not valid or badly formatted.');

      case 'email-already-in-use':
        return const SignupFailure('An account already exists for that email.');

      case 'operation-not-allowed':
        return const SignupFailure('Operation is not allowed. Please contact support.');

      case 'user-disabled':
        return const SignupFailure('This user has been disabled. Please contact support');
      default:
        return const SignupFailure(); // Default case to handle unknown codes
    }
  }
}