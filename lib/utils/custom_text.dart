import 'package:flutter/material.dart';

class CustomText {

  // kbLogoName() {
  //   return const Text(
  //     "Chilli",
  //     style: TextStyle(
  //       fontSize: 25,
  //       fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //       fontFamily: "ArimoBold",
  //     ),
  //   );
  // }



  // kbText(String hint, double fontSize, FontWeight fontWeight, Color color,
  //     TextAlign textAlign, [TextOverflow? textOverFlow, int? lines]) {
  //   return Text(
  //     hint,
  //     style: TextStyle(
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //       color: color,
  //       fontFamily: "ArimoBold"),
  //     textAlign: textAlign,
  //     overflow: textOverFlow ?? TextOverflow.ellipsis,
  //     maxLines: lines ?? 2,
  //   );
  // }
  //
  // kmText(String hint, double fontSize, FontWeight fontWeight, Color color,
  //     TextAlign textAlign, [TextOverflow? textOverFlow, int? lines]) {
  //   return Text(
  //     hint,
  //     style: TextStyle(
  //         fontSize: fontSize,
  //         fontWeight: fontWeight,
  //         color: color,
  //         fontFamily: "ArimoMedium"),
  //     textAlign: textAlign,
  //     overflow: textOverFlow ?? TextOverflow.ellipsis,
  //     maxLines: lines ?? 2,
  //   );
  // }
  //
  // krTextStyle(String hint, double fontSize, FontWeight fontWeight, Color color,
  //     TextAlign textAlign, [TextOverflow? textOverFlow, int? lines]) {
  //   return Text(
  //     hint,
  //     style: TextStyle(
  //         fontSize: fontSize,
  //         fontWeight: fontWeight,
  //         color: color,
  //         fontFamily: "ArimoRegular"),
  //     textAlign: textAlign,
  //     overflow: textOverFlow ?? TextOverflow.ellipsis,
  //     maxLines: lines ?? 2,
  //   );
  // }

  kText(String hint, double fontSize, FontWeight fontWeight, Color color,
      TextAlign textAlign, [TextOverflow? textOverFlow, int? lines]) {
    return Text(
      hint,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontFamily: "Avenir LT Pro"),
      textAlign: textAlign,
      overflow: textOverFlow ?? TextOverflow.ellipsis,
      maxLines: lines ?? 2,
    );
  }

  kTextStyle(double fontSize, FontWeight fontWeight, Color color,
      TextAlign textAlign) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: "Avenir LT Pro");
  }

}