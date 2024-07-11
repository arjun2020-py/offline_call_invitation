import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../home/screen_home.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.context) : super(LoginInitial());
  BuildContext context;
  final TextEditingController emailCtr = TextEditingController(),
      passwordCtr = TextEditingController();

  loginUser() async {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailCtr.text.trim(), password: passwordCtr.text.trim())
          .then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => ScreenHome(),
              )));
      emailCtr.clear();
      passwordCtr.clear();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }
}
