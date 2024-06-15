part of 'register_bloc.dart';

@immutable
class RegistrationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpWithEmailPassword extends RegistrationEvent {
  final String email;
  final String password;
  final String phoneNo;

  SignUpWithEmailPassword(
      {required this.email, required this.password, required this.phoneNo});

  @override
  List<Object> get props => [email, password, phoneNo];
}
