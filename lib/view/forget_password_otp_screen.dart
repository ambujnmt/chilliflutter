import 'package:chilli/constant/colors.dart';
import 'package:chilli/view/new_password_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';
import '../utils/custom_text.dart';

class ForgetPasswordOtpScreen extends StatefulWidget {
  const ForgetPasswordOtpScreen({super.key});

  @override
  State<ForgetPasswordOtpScreen> createState() =>
      _ForgetPasswordOtpScreenState();
}

class _ForgetPasswordOtpScreenState extends State<ForgetPasswordOtpScreen> {
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
  }

  @override
  void dispose() {
    if (kIsWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    smsRetriever.dispose();
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 40),
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
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    customText.kbText('You’ve Got Mail', 26, FontWeight.w700,
                        AppColors.primaryColor, TextAlign.start),
                    const SizedBox(width: 10,),
                    Image.asset(
                      'assets/image/email.png',
                      width: 30,
                      height: 30,
                    )
                  ],
                ),
                const SizedBox(height: 8),
                customText.kmText(
                    'We have sent the otp verification code to\nyour email address. Check your mail and\nenter the code below.',
                    14,
                    FontWeight.w400,
                    Colors.black,
                    TextAlign.start),
                const SizedBox(
                  height: 5,
                ),
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
                  child: customText.kmText('Didn’t receive email?', 14,
                      FontWeight.w400, Colors.black, TextAlign.start),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: customText.krTextStyle(
                      'you can resend code request in 55 s',
                      14,
                      FontWeight.w400,
                      Colors.black,
                      TextAlign.center),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                    Get.to(const NewPasswordScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: customText.kbText(
                          'Confirm',
                          18,
                          FontWeight.w700,
                          Colors.white,
                          TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
