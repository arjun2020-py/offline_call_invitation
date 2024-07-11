import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/user_auth.dart';
import '../../utils/custom_route.dart';
import '../../utils/custom_widget/custom_elev_btn.dart';
import '../../utils/custom_widget/custom_text.dart';
import '../../utils/custom_widget/custom_text_button.dart';
import '../../utils/custom_widget/custom_textfrom_filed.dart';
import 'cubit/login_cubit.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginCubit(context),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              var cubit = context.read<LoginCubit>();
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'LOGIN',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(text: 'Please login here..........'),
                    CustomTextfiled(
                      controller: cubit.emailCtr,
                      hintText: 'enter email id',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextfiled(
                        controller: cubit.passwordCtr,
                        hintText: 'enter passwrod'),
                    SizedBox(
                      height: 10,
                    ),
                    CustomElvBtn(
                      onPressed: () {
                        cubit.loginUser();
                      },
                      child: CustomText(
                        text: 'Login',
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                          indent: 10,
                          endIndent: 10,
                        )),
                        CustomText(text: 'OR'),
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                          indent: 10,
                          endIndent: 10,
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(text: "Don't have an account ? "),
                        ScreenCustomTextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(MdqAppRouteConstants().siginup);
                          },
                          child: CustomText(text: 'Signup'),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
