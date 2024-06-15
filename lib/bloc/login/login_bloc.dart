import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../firebase_service/firebase_service.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseServices firebaseServices;

  LoginBloc(this.firebaseServices) : super(LoginInitial());

  Future<void> _onSignInButtonPressed(BuildContext contex,
      SignInWithEmailPassword event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      await firebaseServices.signInWithEmailandPassword(
          contex, event.email, event.password);
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }
}
