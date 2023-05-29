import 'package:flutter/material.dart';
Widget occupiedWidget({String? no, String? name, String? status}){
  return Padding(
    padding: const EdgeInsets.only(right: 5.0),
    child: Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)),
      color: Colors.white,
      child: Container(
        height: 50.0,
        width: 140,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(
                    8.0, 6.0, 8.0, 6.0),
                margin: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(
                        128, 131, 120, 100),
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0))),
                child:   Text(
                  no!,
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                mainAxisAlignment:
                MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                    Text(
                    name!,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600),
                  ),
                    Text(status!,
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w500))
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
