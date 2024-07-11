import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/custom_route.dart';
import '../../utils/custom_widget/custom_elev_btn.dart';
import '../../utils/custom_widget/custom_text.dart';
import '../../utils/custom_widget/custom_text_button.dart';
import '../../utils/custom_widget/custom_textfrom_filed.dart';
import 'cubit/siginup_cubit.dart';

class ScreenSiginup extends StatelessWidget {
  const ScreenSiginup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SiginupCubit(context),
          child: BlocBuilder<SiginupCubit, SiginupState>(
            builder: (context, state) {
              var cubit = context.read<SiginupCubit>();
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Siginup',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(text: 'Please Siginup here..........'),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextfiled(
                          controller: cubit.nameCtr, hintText: 'enter name'),
                      SizedBox(
                        height: 10,
                      ),
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
                      CustomTextfiled(
                          controller: cubit.mobilenoCtr,
                          hintText: 'enter mobileno'),
                      SizedBox(
                        height: 10,
                      ),
                      CustomElvBtn(
                        onPressed: () {
                          cubit.registerUser();
                        },
                        child: CustomText(
                          text: 'Siginup',
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
                          CustomText(text: "All ready  have an account ? "),
                          ScreenCustomTextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(MdqAppRouteConstants().login);
                            },
                            child: CustomText(text: 'Login'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
