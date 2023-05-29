import 'package:flutter/material.dart';

import '../style.dart';

Widget reusableActionButton({
  VoidCallback? onPress,String? name
}){
  return GestureDetector(
    onTap: onPress!,
    child: Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      color: const Color.fromRGBO(116, 134, 134, 100),
      child: SizedBox(
        height: 35,
        width: 110,
        child: Center(
            child: Text(
              name!,
              style: subTitleShadowTextStyle,
            )),
      ),
    ),
  );
}