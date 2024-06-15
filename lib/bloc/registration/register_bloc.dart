import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../model/user_model.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  RegistrationBloc(this._auth, this._firestore) : super(RegistrationInitial()) {
    on<SignUpWithEmailPassword>(_onSignUpWithEmailPassword);
  }

  Future<void> _onSignUpWithEmailPassword(
    SignUpWithEmailPassword event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(RegistrationLoading());
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: event.email, password: event.password);
      User? user = userCredential.user;
      if (user != null) {
        UserModel userModel = UserModel(
            uid: user.uid,
            email: user.email!,
            password: event.password,
            phoneNo: event.phoneNo);
        await _firestore
            .collection("Users")
            .doc(user.uid)
            .set(userModel.toJson());
        emit(RegistrationSuccess());
      } else {
        emit(RegistrationFailure(error: 'User credentiaal failed'));
      }
    } on FirebaseAuthException catch (e) {
      emit(RegistrationFailure(error: e.message ?? "Unkown erreor ocurred."));
    }
  }
}
