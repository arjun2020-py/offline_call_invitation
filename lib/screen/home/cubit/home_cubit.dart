import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.context) : super(HomeInitial());
  BuildContext context;
  userLogout() {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pop();
  }
}
