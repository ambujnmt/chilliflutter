import 'package:chilli/view/forget_screen.dart';
import 'package:chilli/view/menu_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/colors.dart';
import 'package:chilli/utils/custom_text.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final customText = CustomText();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/image/login.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: height * 0.02),
              customText.kbText(
                'Welcome Back!',
                width * 0.07,
                FontWeight.w700,
                Colors.black,
                TextAlign.center,
              ),
              SizedBox(height: height * 0.04),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: _buildTextField(
                  controller: _usernameController,
                  hintText: "Username",
                  obscure: false,
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: _buildTextField(
                  controller: _passwordController,
                  hintText: "Password",
                  obscure: true,
                ),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                      activeColor: AppColors.buttonColor,
                    ),
                    customText.kmText(
                      'Remember Me',
                      12,
                      FontWeight.w500,
                      Colors.black,
                      TextAlign.start,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.to(const ForgetScreen());
                      },
                      child: customText.kmText(
                        'Forgot Password?',
                        12,
                        FontWeight.w500,
                        AppColors.buttonColor,
                        TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Get.to(const MenuHome());
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: height * 0.02),
                      backgroundColor: AppColors.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: customText.kbText(
                      'Login',
                      width * 0.05,
                      FontWeight.w500,
                      Colors.white,
                      TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Row(
                  children: [
                    const Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: customText.kmText(
                        'or login with',
                        width * 0.04,
                        FontWeight.w500,
                        Colors.black,
                        TextAlign.center,
                      ),
                    ),
                    const Expanded(child: Divider(thickness: 1)),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _socialIcon('assets/image/fb.png'),
                  _socialIcon('assets/image/google.png'),
                  _socialIcon('assets/image/apple.png'),
                ],
              ),

              SizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required bool obscure,
  }) {
    return Container(
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
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }

  Widget _socialIcon(String path) {
    return GestureDetector(
      onTap: () {
        // TODO: Handle social login
      },
      child: Image.asset(
        path,
        height: 56,
        width: 56,
      ),
    );
  }
}
