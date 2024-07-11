import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/custom_route.dart';
import '../../../utils/enum.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(SplashInitial()) {
    cureentUser().then((userId) => authStatus =
        userId == null ? AuthStatus.notSiginIn : AuthStatus.siginIn);
    splash();
  }
  AuthStatus authStatus = AuthStatus.notSiginIn;

  Future<String> cureentUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    return user!.uid;
  }

  BuildContext context;
  splash() async {
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      switch (authStatus) {
        case AuthStatus.notSiginIn:
          Navigator.of(context).pushNamed(MdqAppRouteConstants().login);

          break;

        case AuthStatus.siginIn:
          Navigator.of(context).pushNamed(MdqAppRouteConstants().home);

        default:
      }
    });
  }
}
