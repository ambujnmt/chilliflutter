import 'dart:ui';

import 'package:chilli/constant/colors.dart';
import 'package:chilli/utils/custom_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  dynamic size;
  final customText = CustomText();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        leading: GestureDetector(
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 13),
            child: ImageIcon(
              AssetImage("assets/image/camera.png"),
              color: Colors.black,
            ),
          ),
          onTap: () {},
        ),
        title: SizedBox(
          height: 30,
          child: Image.asset("assets/image/chilliText.png"),
        ),
        centerTitle: true,
        actions: [

          GestureDetector(
            child: const ImageIcon(
              AssetImage("assets/image/notification.png"),
              size: 28,
            ),
            onTap: () {},
          ),

          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: ImageIcon(
                AssetImage("assets/image/chats.png"),
                size: 28,
              ),
            ),
            onTap: () {},
          ),

        ],
      ),

      body: SafeArea(
        bottom: false,
        child: Container(
          height: size.height,
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            children: [

              SizedBox(
                height: 100,
                child: Row(
                  children: [

                    SizedBox(
                      width: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            height: 75,
                            width: 75,
                            padding: const EdgeInsets.all(2),
                            margin:  const EdgeInsets.only(right: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.primaryColor, width: 2)
                            ),
                            child: Image.asset("assets/image/boy.png"),
                          ),

                          customText.kText("Your story", 16, FontWeight.w400, Colors.black, TextAlign.center, TextOverflow.visible, 1)
                        ],
                      ),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [

                            for(int i = 0; i < 5; i++)
                            SizedBox(
                              width: 80,
                              child: Column(
                                children: [

                                  Container(
                                    height: 75,
                                    width: 75,
                                    padding: const EdgeInsets.all(2),
                                    margin:  const EdgeInsets.only(right: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: AppColors.primaryColor, width: 2)
                                    ),
                                    child: Center(
                                      child: Image.asset("assets/image/boy.png"),
                                    ),
                                  ),

                                  customText.kText("Zackjohn", 16, FontWeight.w400, Colors.black, TextAlign.center, TextOverflow.visible, 1)
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    )


                  ],
                ),
              ),

              const SizedBox(height: 10,),

              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  // color: Colors.yellow.shade200,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        for(int i = 0; i < 2; i++)
                        Container(
                          height: size.height * 0.53,
                          width: size.width,
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: const BoxDecoration(
                            // color: Colors.blue,
                          ),
                          child: Column(
                            children: [

                              Container(
                                height: size.height * 0.465,
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(size.width * 0.08),
                                ),
                                child: Stack(
                                  children: [

                                    Image.asset("assets/image/postIMG.png"),

                                    Positioned(
                                      top: 10,
                                      left: 10,
                                      right: 10,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: size.width * 0.14,
                                            width: size.width * 0.55,
                                            // padding: const EdgeInsets.symmetric(horizontal: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(size.width * 0.08),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(size.width * 0.08),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                                  child: Row(
                                                    children: [

                                                      Container(
                                                        height: size.width * 0.11,
                                                        width: size.width * 0.11,
                                                        margin: const EdgeInsets.only(right: 5),
                                                        decoration: BoxDecoration(
                                                          color: Colors.black.withOpacity(0.1),
                                                          shape: BoxShape.circle,
                                                        ),
                                                      ),

                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          customText.kText("Joshua_I", 18, FontWeight.w500, Colors.white, TextAlign.center),
                                                          customText.kText("Tokyo, Japan", 18, FontWeight.w300, Colors.white, TextAlign.center)
                                                        ],
                                                      )

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          Container(
                                            height: size.width * 0.14,
                                            width: size.width * 0.14,
                                            decoration: BoxDecoration(
                                                color: Colors.black.withOpacity(0.3),
                                                borderRadius: BorderRadius.circular(size.width * 0.08)
                                            ),
                                            child: const Icon(Icons.more_vert_rounded, size: 30, color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),

                                    Positioned(
                                      bottom: 10,
                                      left: 10,
                                      right: 10,
                                      child: Container(
                                        height: 105,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(size.width * 0.04),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(size.width * 0.04),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  RichText(
                                                    text: TextSpan(
                                                      text: "Liked by",
                                                      style: customText.kTextStyle(16, FontWeight.w400, Colors.white, TextAlign.center),
                                                      children: [
                                                        TextSpan(
                                                          text: " craig_love ",
                                                          style: customText.kTextStyle(18, FontWeight.w800, Colors.white, TextAlign.center),
                                                        ),
                                                        TextSpan(
                                                          text: "and 12,345 others",
                                                          style: customText.kTextStyle(16, FontWeight.w400, Colors.white, TextAlign.center),
                                                        ),
                                                      ]
                                                    ),
                                                  ),

                                                  const SizedBox(height: 5,),

                                                  RichText(
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    text: TextSpan(
                                                      text: "Joshuas_I",
                                                      style: customText.kTextStyle(18, FontWeight.w800, Colors.white, TextAlign.center),
                                                      children: [
                                                        TextSpan(
                                                          text: "  The game in japan was amazing and I want to share some photos lkasejlssldis assdlkhj;sdlsd slsadksdf dpsjd,sdksd ",
                                                          style: customText.kTextStyle(16, FontWeight.w400, Colors.white, TextAlign.center),
                                                        ),
                                                      ]
                                                    ),
                                                  ),

                                                  const SizedBox(height: 5,),

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [

                                                      Container(
                                                        height: 10,
                                                        width: 10,
                                                        margin: const EdgeInsets.only(right: 5),
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(5)
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 10,
                                                        width: 10,
                                                        margin: const EdgeInsets.only(right: 5),
                                                        decoration: BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius: BorderRadius.circular(5)
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 10,
                                                        width: 10,
                                                        margin: const EdgeInsets.only(right: 5),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(5)
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 10,
                                                        width: 10,
                                                        margin: const EdgeInsets.only(right: 5),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(5)
                                                        ),
                                                      ),

                                                    ],
                                                  )

                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )



                                  ],
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  customText.kText("18 November", 16, FontWeight.w400, Colors.grey, TextAlign.center),
                                  Row(
                                    children: [

                                      GestureDetector(
                                        // child: const Icon(Icons.favorite_border_rounded, size: 35,),
                                        child: const ImageIcon(
                                          AssetImage("assets/image/like.png"),
                                          size: 28,
                                        ),
                                        onTap: () {},
                                      ),

                                      const SizedBox(width: 10,),

                                      GestureDetector(
                                        // child: const Icon(Icons.insert_comment_rounded, size: 35,),
                                        child: const ImageIcon(
                                          AssetImage("assets/image/comment.png"),
                                          size: 28,
                                        ),
                                        onTap: () {},
                                      ),

                                      const SizedBox(width: 10,),

                                      GestureDetector(
                                        // child: const Icon(Icons.share, size: 35,),
                                        child: const ImageIcon(
                                          AssetImage("assets/image/share.png"),
                                          size: 28,
                                        ),
                                        onTap: () {},
                                      ),

                                      const Spacer(),

                                      GestureDetector(
                                        // child: const Icon(Icons.save_alt, size: 35,),
                                        child: const ImageIcon(
                                          AssetImage("assets/image/save.png"),
                                          size: 28,
                                        ),
                                        onTap: () {},
                                      ),

                                    ],
                                  )

                                ],
                              )

                            ],
                          ),
                        ),

                        const SizedBox(height: 60),
                        
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
