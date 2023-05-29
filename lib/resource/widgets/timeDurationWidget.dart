import 'package:flutter/material.dart';

import '../style.dart';

Widget timeDurationWidget({String? name,int? hour,int? minute }){
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Column(
      children: [
        Text(
          "$name\nTime",
          textAlign: TextAlign.center,
          style: smallSubTitleShadowTextStyle,
        ),
        RichText(
          text: TextSpan(
            text: hour.toString(),
            style: titleShadowTextStyle,
            children: [
              TextSpan(
                  text: ' h ', style: subTitleShadowTextStyle),
              TextSpan(
                  text: minute.toString(), style: titleShadowTextStyle),
              TextSpan(
                  text: ' min',
                  style: subTitleShadowTextStyle),
            ],
          ),
        ),
      ],
    ),
  );
}
