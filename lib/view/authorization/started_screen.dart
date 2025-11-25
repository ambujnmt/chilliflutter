import 'package:chilli/view/authorization/login_screen.dart';
import 'package:chilli/view/authorization/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/colors.dart';
import 'package:chilli/utils/custom_text.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({super.key});

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {

  dynamic size;
  final customText = CustomText();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Image.asset(
              'assets/image/login.png',
              fit: BoxFit.cover,
            ),

            Expanded(
              child: Container(
                // color: Colors.black26,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      const SizedBox(height: 10),

                      customText.kText(
                        'Sign up to continue',
                        30,
                        FontWeight.w700,
                        Colors.black,
                        TextAlign.start,
                      ),

                      const SizedBox(height: 20,),

                      // SizedBox(
                      //   width: double.infinity,
                      //   child: TextButton(
                      //     onPressed: () {
                      //
                      //       // Get.to(const CreateAccount());
                      //
                      //     },
                      //     style: TextButton.styleFrom(
                      //       padding: EdgeInsets.symmetric(vertical: size.height * 0.013),
                      //       backgroundColor: AppColors.buttonColor,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(12),
                      //       ),
                      //     ),
                      //     child: customText.kText(
                      //       'Create an account',
                      //       25,
                      //       FontWeight.w500,
                      //       Colors.white,
                      //       TextAlign.center,
                      //     ),
                      //   ),
                      // ),

                      GestureDetector(
                        child: Container(
                          height: 50,
                          width: size.width * 0.85,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(size.width * 0.03)
                          ),
                          child: Center(
                            child: customText.kText(
                              'Create an account',
                              25,
                              FontWeight.w500,
                              Colors.white,
                              TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () {
                          Get.to(const RegisterScreen());
                        },
                      ),

                      const SizedBox(height: 20,),

                      GestureDetector(
                        child: Container(
                          height: 50,
                          width: size.width * 0.85,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(size.width * 0.03),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 4,
                                color: Colors.black26,
                              ),
                              BoxShadow(
                                offset: Offset(0, -1),
                                blurRadius: 4,
                                color: Colors.black26,
                              )
                            ]
                          ),
                          child: Center(
                            child: customText.kText(
                              'Login',
                              25,
                              FontWeight.w500,
                              AppColors.primaryColor,
                              TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () {
                          Get.to( () => const LoginScreen());
                        },
                      ),

                      const SizedBox(height: 30,),

                      Row(
                       children: [
                          const Expanded(child: Divider(thickness: 1)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                            child: customText.kText(
                              'or sign up with',
                              size.width * 0.04,
                              FontWeight.w500,
                              Colors.black,
                              TextAlign.center,
                            ),
                          ),
                          const Expanded(child: Divider(thickness: 1)),
                        ],
                      ),

                      const SizedBox(height: 30,),

                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _socialIcon('assets/image/fb.png'),
                            _socialIcon('assets/image/google.png'),
                            _socialIcon('assets/image/apple.png'),
                          ],
                        ),

                      const SizedBox(height: 20,),

                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 4,
                        children: [
                          customText.kText(
                            'By signing up, you agree to our',
                            18,
                            FontWeight.w500,
                            Colors.black,
                            TextAlign.center,
                          ),
                          _underlineText('Terms.'),
                          customText.kText(
                            'See how we use your data in our',
                            18,
                            FontWeight.w500,
                            Colors.black,
                            TextAlign.center,
                          ),
                          _underlineText('Privacy Policy.'),
                        ],
                      ),



                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      )
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //
      //         SizedBox(
      //           width: double.infinity,
      //           child: Image.asset(
      //             'assets/image/login.png',
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //
      //         SizedBox(height: size.height * 0.02),
      //
      //         // Expanded()
      //         // Padding(
      //         //   padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      //         //   child: Align(
      //         //     alignment: Alignment.center,
      //         //     child: customText.kbText(
      //         //       'Sign up to continue',
      //         //       width * 0.07,
      //         //       FontWeight.w700,
      //         //       Colors.black,
      //         //       TextAlign.start,
      //         //     ),
      //         //   ),
      //         // ),
      //         // SizedBox(height: size.height * 0.03),
      //         // Padding(
      //         //   padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      //         //   child: SizedBox(
      //         //     width: double.infinity,
      //         //     child: TextButton(
      //         //       onPressed: () {
      //         //
      //         //         // Get.to(const CreateAccount());
      //         //
      //         //       },
      //         //       style: TextButton.styleFrom(
      //         //         padding: EdgeInsets.symmetric(vertical: height * 0.02),
      //         //         backgroundColor: AppColors.buttonColor,
      //         //         shape: RoundedRectangleBorder(
      //         //           borderRadius: BorderRadius.circular(12),
      //         //         ),
      //         //       ),
      //         //       child: customText.kbText(
      //         //         'Create an account',
      //         //         width * 0.05,
      //         //         FontWeight.w500,
      //         //         Colors.white,
      //         //         TextAlign.center,
      //         //       ),
      //         //     ),
      //         //   ),
      //         // ),
      //         // SizedBox(height: size.height * 0.02),
      //         // Padding(
      //         //   padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      //         //   child: SizedBox(
      //         //     width: double.infinity,
      //         //     child: TextButton(
      //         //       onPressed: () {
      //         //         // Get.to(const LoginScreen());
      //         //       },
      //         //       style: TextButton.styleFrom(
      //         //         padding: EdgeInsets.symmetric(vertical: height * 0.02),
      //         //         backgroundColor: Colors.white,
      //         //         shape: RoundedRectangleBorder(
      //         //           borderRadius: BorderRadius.circular(12),
      //         //           side: const BorderSide(color: AppColors.buttonColor),
      //         //         ),
      //         //       ),
      //         //       child: customText.kbText(
      //         //         'Login',
      //         //         width * 0.05,
      //         //         FontWeight.w500,
      //         //         AppColors.buttonColor,
      //         //         TextAlign.center,
      //         //       ),
      //         //     ),
      //         //   ),
      //         // ),
      //         // SizedBox(height: size.height * 0.03),
      //         // Padding(
      //         //   padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      //         //   child: Row(
      //         //     children: [
      //         //       const Expanded(child: Divider(thickness: 1)),
      //         //       Padding(
      //         //         padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      //         //         child: customText.kmText(
      //         //           'or sign up with',
      //         //           width * 0.04,
      //         //           FontWeight.w500,
      //         //           Colors.black,
      //         //           TextAlign.center,
      //         //         ),
      //         //       ),
      //         //       const Expanded(child: Divider(thickness: 1)),
      //         //     ],
      //         //   ),
      //         // ),
      //         // SizedBox(height: size.height * 0.03),
      //         // Row(
      //         //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         //   children: [
      //         //     _socialIcon('assets/image/fb.png'),
      //         //     _socialIcon('assets/image/google.png'),
      //         //     _socialIcon('assets/image/apple.png'),
      //         //   ],
      //         // ),
      //         // SizedBox(height: size.height * 0.04),
      //         // Padding(
      //         //   padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      //         //   child: Wrap(
      //         //     alignment: WrapAlignment.center,
      //         //     spacing: 4,
      //         //     children: [
      //         //       customText.kmText(
      //         //         'By signing up, you agree to our',
      //         //         width * 0.035,
      //         //         FontWeight.w500,
      //         //         Colors.black,
      //         //         TextAlign.center,
      //         //       ),
      //         //       _underlineText('Terms.'),
      //         //       customText.kmText(
      //         //         'See how we use your data in our',
      //         //         width * 0.035,
      //         //         FontWeight.w500,
      //         //         Colors.black,
      //         //         TextAlign.center,
      //         //       ),
      //         //       _underlineText('Privacy Policy.'),
      //         //     ],
      //         //   ),
      //         // ),
      //         // SizedBox(height: size.height * 0.04),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget _socialIcon(String path) {
    return GestureDetector(
      onTap: () {},
      child: Image.asset(
        path,
        height: 56,
        width: 56,
      ),
    );
  }

  Widget _underlineText(String text) {
    return Text(
      text,
      style: const TextStyle(
        decoration: TextDecoration.underline,
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Avenir LT Pro',
      ),
    );
  }
}
