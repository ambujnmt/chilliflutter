import 'dart:async';

import 'package:chilli/constant/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';
import '../../utils/custom_text.dart';

class RegOtp extends StatefulWidget {
  const RegOtp({super.key});

  @override
  State<RegOtp> createState() => _RegOtpState();
}

class _RegOtpState extends State<RegOtp> {

  late Timer timer;
  int start = 60;
  dynamic size;
  final customText = CustomText();
  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
    pinController = TextEditingController();
    focusNode = FocusNode();
    startTimer();
  }

  @override
  void dispose() {
    if (kIsWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    smsRetriever.dispose();
    pinController.dispose();
    focusNode.dispose();
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start == 1) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            // margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/image/otp.png',
                    width: 280,
                    height: 280,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                customText.kText('Verification Code', 26, FontWeight.w700,
                    Colors.black, TextAlign.start),
                const SizedBox(height: 8),
                customText.kText(
                  'We have send OTP code Verification to your mobile number.',
                  18,
                  FontWeight.w400,
                  Colors.black,
                  TextAlign.start),
                // const SizedBox(
                //   height: 5,
                // ),
                // Align(
                //   alignment: Alignment.center,
                //   child: Center(
                //     child: Row(
                //       children: [
                //         customText.kbText('Matrimonial@gmail.com', 14,
                //             FontWeight.w400, Colors.black, TextAlign.center),
                //         Image.asset(
                //           'assets/image/pen.png',
                //           width: 20,
                //           height: 20,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Form(
                    key: formKey,
                    child: Pinput(
                      controller: pinController,
                      focusNode: focusNode,
                      length: 4, // OTP length
                      defaultPinTheme: defaultPinTheme,
                      separatorBuilder: (index) => const SizedBox(width: 8),
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        debugPrint('onCompleted: $pin');
                      },
                      onChanged: (value) {
                        debugPrint('onChanged: $value');
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: focusedBorderColor,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: "You can resend code request in ",
                      style: customText.kTextStyle(16, FontWeight.w400, Colors.black, TextAlign.center),
                      children: [
                        TextSpan(
                          text: "$start",
                          style: customText.kTextStyle(18, FontWeight.w400, Colors.blue, TextAlign.center),
                        ),

                        TextSpan(
                          text: " s",
                          style: customText.kTextStyle(16, FontWeight.w400, Colors.black, TextAlign.center),
                        )

                      ]
                    )
                  ),
                ),

                // Align(
                //   alignment: Alignment.center,
                //   child: customText.kText(
                //     'you can resend code request in 55 s',
                //     16,
                //     FontWeight.w400,
                //     Colors.black,
                //     TextAlign.center),
                // ),

                const SizedBox(
                  height: 40,
                ),

                /// Verify Button
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed:
                //     () {
                //       if (pinController.text.isNotEmpty) {
                //         Get.snackbar(
                //             'Success', 'OTP Entered: ${pinController.text}',
                //             backgroundColor: Colors.green,
                //             colorText: Colors.white);
                //       } else {
                //         Get.snackbar('Error', 'Please enter OTP',
                //             backgroundColor: Colors.red,
                //             colorText: Colors.white);
                //       }
                //     },
                //     style: ElevatedButton.styleFrom(
                //       padding: EdgeInsets.zero,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //     ),
                //     child: Ink(
                //       decoration: BoxDecoration(
                //         color: AppColors.primaryColor,
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       child: Container(
                //         height: 50,
                //         alignment: Alignment.center,
                //         child: customText.kText(
                //           'Submit',
                //           18,
                //           FontWeight.w700,
                //           Colors.white,
                //           TextAlign.center,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                GestureDetector(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 50,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(size.width * 0.03)
                      ),
                      child: Center(
                        child: customText.kText(
                          'Submit',
                          25,
                          FontWeight.w500,
                          Colors.white,
                          TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (pinController.text.isNotEmpty) {
                      Get.snackbar(
                          'Success', 'OTP Entered: ${pinController.text}',
                          backgroundColor: Colors.green,
                          colorText: Colors.white);
                    } else {
                      Get.snackbar('Error', 'Please enter OTP',
                          backgroundColor: Colors.red,
                          colorText: Colors.white);
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom SmsRetriever Implementation using SmartAuth.instance
class SmsRetrieverImpl implements SmsRetriever {
  const SmsRetrieverImpl(this.smartAuth);

  final SmartAuth smartAuth;

  @override
  Future<void> dispose() {
    return smartAuth.removeSmsListener();
  }

  @override
  Future<String?> getSmsCode() async {
    final res = await smartAuth.getSmsCode(useUserConsentApi: true);
    if (res.succeed && res.codeFound) {
      return res.code!;
    }
    return null;
  }

  @override
  bool get listenForMultipleSms => false;
}

extension on SmartAuth {
  Future<void> removeSmsListener() async {}

  getSmsCode({required bool useUserConsentApi}) {}
}
