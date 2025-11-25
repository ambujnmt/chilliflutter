import 'package:chilli/constant/colors.dart';
import 'package:chilli/utils/custom_text.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  dynamic size;
  final customText = CustomText();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child:  Column(
          children: [

            const SizedBox(height: 10,),

            Image.asset('assets/image/password.png',
              width: 280,
              height: 250,
            ),
            customText.kText('Create New Password', 30, FontWeight.w700, AppColors.primaryColor, TextAlign.start),

            const SizedBox(height: 10,),

            customText.kText('Your new password must be different from previous password.', 18, FontWeight.w500, Colors.black, TextAlign.center),

            const SizedBox(height: 10,),

            Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
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
                    horizontal: 20, vertical: 10),
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

            const SizedBox(height: 40,),

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
                // Get.to(const NewPassword());
              },
            ),
          ],
        ),
      )
    );
  }
}
