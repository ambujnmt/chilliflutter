import 'dart:async';
import 'package:chilli/utils/route_name.dart';
import 'package:chilli/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constant/colors.dart';

class Helper {

  void isOnBoarding(BuildContext context) async {
    final prefs = await myStroage();
    final showOnBoarding = prefs.getBool("showOnBoard") ?? false;
    final isLogin = prefs.getBool("isLogin") ?? false;
    if (showOnBoarding && isLogin) {
      Timer(const Duration(seconds: 3), (() {
        Navigator.pushNamed(context, RoutesName.authScreen);
      }));
    } else if (showOnBoarding) {
      Timer(const Duration(seconds: 3), (() {
        Navigator.pushNamed(context, RoutesName.startedScreen);
      }));
    } else {
      Timer(const Duration(seconds: 3), (() {
        Navigator.pushNamed(context, RoutesName.onboarding_screen);
      }));
    }
  }

  void toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: AppColors.textPrimary,
        textColor: AppColors.whiteColor,
        fontSize: 16);
  }

  bool emailValid(String email) {
    final validEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return validEmail;
  }
}
