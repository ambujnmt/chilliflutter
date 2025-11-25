import 'package:chilli/constant/colors.dart';
import 'package:chilli/view/authorization/forget_otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/custom_text.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {

  dynamic size;
  final customText = CustomText();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body:  SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset('assets/image/forget.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 15),
              customText.kText('Forget Password', 30, FontWeight.w700, AppColors.primaryColor, TextAlign.start),

              const SizedBox(height: 15),

              customText.kText('Enter your email to reset password', 18, FontWeight.w400, Colors.black, TextAlign.start),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.grey.shade300
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: InputBorder.none,
                    hintText: "Enter Your Email",
                  ),
                ),
              ),
              // Container(
              //   width: double.infinity,
              //   height: 50,
              //   margin: const EdgeInsets.symmetric(
              //       horizontal: 20, vertical: 10),
              //   decoration: BoxDecoration(
              //       border: Border.all(
              //           color: Colors.grey.shade300, width: 2),
              //
              //       color: Colors.white,
              //       borderRadius: const BorderRadius.all(
              //           Radius.circular(10))),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Expanded(
              //         child: Container(
              //           margin: const EdgeInsets.only(left: 10),
              //           child: TextFormField(
              //             maxLines: 1,
              //             decoration:   const InputDecoration(
              //               hintText:' Enter Your Email',
              //               border: InputBorder.none,
              //               hintStyle: TextStyle(
              //                 color: AppColors.primaryColor
              //               )
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: size.width * 0.75,
                  // margin: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(size.width * 0.03)
                  ),
                  child: Center(
                    child: customText.kText(
                      'Send Code',
                      25,
                      FontWeight.w500,
                      Colors.white,
                      TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  Get.to(const ForgetOtpScreen());
                },
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: ElevatedButton(
              //     onPressed: () {
              //
              //       // Get.to(const ForgetPasswordOtpScreen());
              //
              //     },
              //     style: ElevatedButton.styleFrom(
              //         padding: EdgeInsets.zero,
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10))),
              //     child: Ink(
              //       decoration: BoxDecoration(
              //           color:   AppColors.primaryColor,
              //           borderRadius: BorderRadius.circular(10)),
              //       child: Container(
              //           height: 50,
              //           alignment: Alignment.center,
              //           child: customText.kText('Send Code', 18, FontWeight.w700, Colors.white, TextAlign.start)
              //       ),
              //     ),
              //   ),
              // ),

              const SizedBox(height: 40,),

              customText.kText('Back To Login', 20, FontWeight.w700, Colors.black, TextAlign.start)



            ],
          ),
        )
    );
  }
}
