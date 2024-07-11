import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/custom_widget/custom_text.dart';
import '../../widgets/custom_incoming_call_widget.dart';
import 'cubit/home_cubit.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(context),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => Navigator.of(context).pop,
                  icon: Icon(Icons.arrow_back_ios_new)),
              centerTitle: true,
              title: CustomText(text: 'Calls'),
              actions: [
                IconButton(
                    onPressed: () {
                      cubit.userLogout();
                    },
                    icon: Icon(Icons.logout))
              ],
            ),
            body: SafeArea(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('user_collection')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data!.docs[index];
                            return Card(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomText(text: data['name']),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        CustomCallInvation(userName: data['name'],);
                                      },
                                      icon: Icon(Icons.video_call))
                                ],
                              ),
                            );
                          },
                        );
                      }
                    })),
          );
        },
      ),
    );
  }
}
