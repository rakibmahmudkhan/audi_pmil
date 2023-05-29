import 'package:flutter/material.dart';

Widget availableWidget({String? no, String? name, String? status}){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
          const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 6.0),
          margin: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(204, 206, 192, 100),
              borderRadius:
              BorderRadius.all(Radius.circular(5.0))),
          child:   Text(
            no!,
            style: TextStyle(fontSize: 13),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
              Text(
              name!,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
              Text(
              status!,
              style: TextStyle(
                  color: Colors.lightGreenAccent,
                  fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    ),
  );
}