import 'package:chilli/constant/colors.dart';
import 'package:chilli/utils/custom_text.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final customText = CustomText();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:  Column(
          children: [

            Image.asset('assets/image/password.png',
              width: 280,
              height: 280,
            ),


            const SizedBox(height: 10,),
            customText.kmText('Create New Password', 30, FontWeight.w700, AppColors.primaryColor, TextAlign.start),


            const SizedBox(height: 10,),


            customText.krTextStyle('Your new password must be different\nfrom previous password.', 18, FontWeight.w500, Colors.black, TextAlign.center),
            Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.grey.shade300, width: 2),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.lock_open_rounded,color: Colors.grey.shade600,),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        color: Colors.white,
                        child: TextFormField(
                          maxLines: 1,
                          decoration: const InputDecoration(
                            hintText:' New Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.visibility_off,color: Colors.grey.shade600,),
                  ],
                )),
            Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.grey.shade300, width: 2),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.lock_open_rounded,color: Colors.grey.shade600,),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        color: Colors.white,
                        child: TextFormField(
                          maxLines: 1,
                          decoration: const InputDecoration(
                            hintText:' Confirm Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.visibility_off,color: Colors.grey.shade600,),
                  ],
                )),
          ],
        ),
      )
    );
  }
}
