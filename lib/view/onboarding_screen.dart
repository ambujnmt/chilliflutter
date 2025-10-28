import 'dart:io';
import 'package:flutter/material.dart';
import '../../utils/route_name.dart';
import '../../utils/storage.dart';
import '../constant/colors.dart';
import '../constant/onboard_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  AnimatedContainer _buildDots({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 6),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? const Color(0xFFE0583F)
            : const Color(0xFFE3D6CC),
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    final titleAnimation =
    Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    final textAnimation =
    Tween<Offset>(begin: const Offset(0.5, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    final imageAnimation =
    Tween<Offset>(begin: const Offset(-0.5, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                controller: _controller,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                  _animationController.forward(from: 0);
                },
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [

                        Expanded(
                          child: SlideTransition(
                            position: imageAnimation,
                            child: Image.asset(contents[i].image),
                          ),
                        ),
                        SlideTransition(
                          position: titleAnimation,
                          child: Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style:  TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: 'ArimoBold',
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SlideTransition(
                          position: textAnimation,
                          child: Text(
                            contents[i].desc,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: Platform.isAndroid
                                    ? ''
                                    : '',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.black
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(height: (height >= 840) ? 60 : 30),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                          (index) => _buildDots(index: index),
                    ),
                  ),
                  _currentPage + 1 == contents.length
                      ? Padding(
                      padding: const EdgeInsets.all(30),
                      child: TextButton(
                        onPressed: () async {
                          final prefs = await myStroage();
                          prefs.setBool("showOnBoard", true);
                          Navigator.pushNamed(
                              context, RoutesName.startedScreen);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.2,
                            vertical: 12,
                          ),
                        ),
                        child: SlideTransition(
                          position: textAnimation,
                          child: Text(
                            'Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'ArimoBold',
                            ),
                          ),
                        ),
                      ))
                      : Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              _controller.nextPage(
                                duration:
                                const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            child:SlideTransition(
                              position: textAnimation,
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: Platform.isAndroid
                                      ? 'ArimoRegular'
                                      : 'ArimoRegular',
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenW;
  static double? screenH;
  static double? blockH;
  static double? blockV;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenW = _mediaQueryData!.size.width;
    screenH = _mediaQueryData!.size.height;
    blockH = screenW! / 100;
    blockV = screenH! / 100;
  }
}
