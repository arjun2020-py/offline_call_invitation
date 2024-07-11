import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class CustomCallInvation extends StatelessWidget {
  String callId = Random().nextInt(1000).toString();

  CustomCallInvation({super.key, required this.userName,});
  final String userName;


  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID: 1778118918,
        appSign: '224855309e18a0a8c259775a5f43187f2ce262858b53d3324f3c544af85ab32d',
        callID: callId,
        userID: userName,
        userName: userName,
        plugins: [ZegoUIKitSignalingPlugin()],
        config: ZegoUIKitPrebuiltCallConfig());
  }
}
