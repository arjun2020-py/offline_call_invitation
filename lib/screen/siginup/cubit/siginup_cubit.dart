import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../home/screen_home.dart';

part 'siginup_state.dart';

class SiginupCubit extends Cubit<SiginupState> {
  SiginupCubit(this.context) : super(SiginupInitial());
  BuildContext context;
  TextEditingController nameCtr = TextEditingController(),
      emailCtr = TextEditingController(),
      passwordCtr = TextEditingController(),
      mobilenoCtr = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  registerUser() async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailCtr.text.trim(), password: passwordCtr.text.trim())
          .then((value) {
        userCollection();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ScreenHome(),
        ));
      });
      emailCtr.clear();
      passwordCtr.clear();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  userCollection() async {
    final firestore = await FirebaseFirestore.instance
        .collection('user_collection')
        .add({'name': nameCtr.text});

    firestore.set({
      'name': nameCtr.text,
      'email': emailCtr.text,
      'password': passwordCtr.text,
      'mobileNo': mobilenoCtr.text
    });
  }
}
