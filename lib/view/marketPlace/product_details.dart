import 'package:chilli/utils/custom_text.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  dynamic size;
  final customText = CustomText();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: Container(
          height: size.height,
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            children: [
              
              Container(
                height: size.height * 0.2,
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(size.width * 0.02)
                ),
              )
              
            ],
          ),
        ),
      )
    );
  }
}
