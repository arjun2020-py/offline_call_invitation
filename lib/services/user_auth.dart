import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/custom_route.dart';

FirebaseAuth auth = FirebaseAuth.instance;

userLoginAuth(String email, String password,BuildContext context) async {
  return auth
      .signInWithEmailAndPassword(email: email, password: password)
      .then((value) => Navigator.of(context).pushNamed(MdqAppRouteConstants().home),);
}
