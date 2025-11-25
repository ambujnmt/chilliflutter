import 'package:chilli/utils/custom_text.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  dynamic size;
  final customText = CustomText();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: customText.kText("Explore", 25, FontWeight.w600, Colors.black, TextAlign.start),
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

              Container(
                height: size.width * 0.13,
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(size.width * 0.03),
                ),
                child: TextField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  style: customText.kTextStyle(20, FontWeight.w400, Colors.black, TextAlign.start),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 15),
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: customText.kTextStyle(20, FontWeight.w400, Colors.grey, TextAlign.start),
                    prefixIcon: const Icon(Icons.search_rounded, size: 30,),
                  ),

                )
              ),

              const SizedBox(height: 10,),
              
              Expanded(
                child: GridView.builder(
                  itemCount: 25,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemBuilder: (context, index) {
                    return Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey.shade400,
                    );
                  },
                ),
              )

            ],
          ),
        )
      )

    );
  }
}
