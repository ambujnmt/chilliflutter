import 'package:chilli/view/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/colors.dart';
import 'package:chilli/utils/custom_text.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final customText = CustomText();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passportController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.02),
              customText.kbText(
                'Create an account',
                width * 0.07,
                FontWeight.w700,
                Colors.black,
                TextAlign.center,
              ),
              SizedBox(height: height * 0.04),
              _buildTextField(
                controller: _fullNameController,
                hintText: "Full Name",
              ),
              SizedBox(height: height * 0.02),
              _buildTextField(
                controller: _mobileController,
                hintText: "Mobile Number",
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: height * 0.02),

              _buildTextField(
                controller: _emailController,
                hintText: "Email Address",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: height * 0.02),

              _buildTextField(
                controller: _passportController,
                hintText: "Upload Passport",
                suffixIcon: Image.asset(
                  'assets/image/upload_arrow.png',
                  height: 30,
                  width: 30,
                ),
                suffixIconConstraints: const BoxConstraints(
                  minHeight: 30,
                  minWidth: 30,
                ),

              ),

              SizedBox(height: height * 0.02),
              _buildTextField(
                controller: _passwordController,
                hintText: "Password",
                obscure: true,
              ),
              SizedBox(height: height * 0.02),
              _buildTextField(
                controller: _confirmPasswordController,
                hintText: "Confirm Password",
                obscure: true,
              ),
              SizedBox(height: height * 0.02),
              _buildTextField(
                controller: _referralController,
                hintText: "Referral Code (Optional)",
              ),
              SizedBox(height: height * 0.03),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Get.to(const OtpView());
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: height * 0.015),
                    backgroundColor: AppColors.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: customText.kbText(
                    'Signup',
                    width * 0.05,
                    FontWeight.w500,
                    Colors.white,
                    TextAlign.center,
                  ),
                ),
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
    bool obscure = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
    BoxConstraints? suffixIconConstraints,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIcon,
          suffixIconConstraints: suffixIconConstraints,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue, width: 1.5),
          ),
        ),
      ),
    );
  }

}
