
import 'package:flutter/material.dart';

import '../style.dart';
Widget reusableCard({String? title, double? value, String? extension}){
  return Padding(
    padding: const EdgeInsets.only(top: 0.0,left: 8,right: 8,bottom: 0),
    child: Card(
      color: const Color.fromRGBO(29, 34, 40, 85),
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Colors.lightGreenAccent,width: 1
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: EdgeInsets.all(6),
        child: Column(
          children: [
            Text(
                title!,
                style: subTitleShadowTextStyle  ),

            RichText(
              text: TextSpan(
                  text: "${value}",style: smallSubTitleShadowTextStyle,children: [TextSpan(text: extension,style: smallSubTitleShadowTextStyle)]
              ),

            )
          ],
        ),
      ),
    ),
  );
}