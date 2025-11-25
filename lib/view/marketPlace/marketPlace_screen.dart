import 'package:chilli/utils/custom_text.dart';
import 'package:chilli/view/marketPlace/product_details.dart';
import 'package:flutter/material.dart';

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {

  dynamic size;
  final customText = CustomText();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: customText.kText("Market Place", 25, FontWeight.w600, Colors.black, TextAlign.start),
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
                  padding: const EdgeInsets.only(bottom: 80),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7
                  ),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        // height: 100,
                        // width: 100,
                        padding: EdgeInsets.all(size.width * 0.01),
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                      
                            Container(
                              height: 130,
                              width: size.width,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset("assets/image/product.png"),
                              ),
                            ),
                      
                            customText.kText("Laptop", 20, FontWeight.w500, Colors.black, TextAlign.start),
                      
                            const Spacer(),
                      
                            customText.kText("\$ 234", 16, FontWeight.w400, Colors.black, TextAlign.start),
                      
                            const Spacer(),
                      
                            customText.kText("New York, NY", 16, FontWeight.w400, Colors.black, TextAlign.start),
                      
                            const Spacer(),
                      
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetails() ));
                      },
                    );
                  })
              ),

            ],
          ),
        ),
      )


    );
  }
}
