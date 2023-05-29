import 'package:flutter/material.dart';

import '../style.dart';

Future ReusableAlertDialog(
    {BuildContext? context,
    String? title,
    String? stationName,
    Widget? content,
    List<Widget>? action}) {
  return showDialog(
    context: context!,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor: Colors.black87/*const Color.fromRGBO(28, 28, 28, 100)*/,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              title!,
              style: titleShadowTextStyle,
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0))),
                      child: Text(
                        'NO.',
                        style: subTitleShadowTextStyle,
                      ),
                    ),
                    Text(
                      stationName!,
                      style: subTitleShadowTextStyle.copyWith(fontSize: 18),
                    )
                  ]),
                  Text(
                    '${DateTime.now().hour}:${DateTime.now().minute}',
                    style: subTitleShadowTextStyle,
                  )
                ],
              ),
            )
          ],
        ),
        content: content,
        actions: action,
      );
    },
  );
}
