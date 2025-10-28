import 'package:chilli/constant/colors.dart';
import 'package:chilli/view/forget_password_otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/custom_text.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final customText = CustomText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Colors.white,
        body:  SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Image.asset('assets/image/forget.png',
              width: 280,
              height: 280,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 22, bottom: 20),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customText.kbText('Forget Password', 26, FontWeight.w700, AppColors.primaryColor, TextAlign.start),
                      customText.krTextStyle('Enter your email to reset you password     ', 14, FontWeight.w400, Colors.black, TextAlign.start),
                    ],
                  )
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey.shade300, width: 2),

                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                          Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            maxLines: 1,
                            decoration:   const InputDecoration(
                              hintText:' Enter Your Email',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: AppColors.primaryColor
                              )
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {

                    Get.to(const ForgetPasswordOtpScreen());


                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Ink(
                    decoration: BoxDecoration(
                        color:   AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: customText.kbText('Send Code', 18, FontWeight.w700, Colors.white, TextAlign.start)
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20,),
              
              customText.kbText('Back To Login', 20, FontWeight.w700, Colors.black, TextAlign.start)
              
              
              
            ],
          ),
        )
    );
  }
}
