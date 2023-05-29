import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../resource/style.dart';
import '../resource/widgets/available_widget.dart';
import '../resource/widgets/occupied_widget.dart';
import '../resource/widgets/reusableActionButton.dart';
import '../resource/widgets/reusableAlertDialog.dart';
import '../resource/widgets/reusableCard.dart';
import '../resource/widgets/timeDurationWidget.dart';

class ChargingScreen extends StatefulWidget {
  var qrCode;

  ChargingScreen({this.qrCode});

  @override
  State<ChargingScreen> createState() => _ChargingScreenState();
}

class _ChargingScreenState extends State<ChargingScreen>
    with TickerProviderStateMixin {
  // ignore: unused_field
  bool _isScannerReady = false;
  Barcode? result;
  var scannedId;
  AnimationController? _animController;
  Animation<double>? _animAnimation;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    _isScannerReady = false;
    _animController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animAnimation = Tween(begin: 0.0, end: 0.75).animate(_animController!);
    _animController!.forward();
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  _animController!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(29, 34, 40, 85),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.00),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: const Center(
                    child: Text(
                  'Charging',
                  style: titleShadowTextStyle,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0, top: 2.0),
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
                        child: const Text(
                          'NO.',
                          style: smallSubTitleShadowTextStyle,
                        ),
                      ),
                      Text(
                        "1234",
                        style: subTitleShadowTextStyle.copyWith(fontSize: 18),
                      )
                    ]),
                    Text(
                      '${DateTime.now().hour}:${DateTime.now().minute}',
                      style: subTitleShadowTextStyle,
                    )
                  ],
                ),
              ),
              chargingDialogContent(),
            ],
          ),
        ));
  }

  Widget chargingDialogContent() {
    return SizedBox(
      //height: 400,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Stack(
            children: [
              Card(
                elevation: 7.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: const Color.fromRGBO(29, 32, 39, 100),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Image(
                    height: 240.0,
                    width: 390.0,
                    image: AssetImage(
                      "assets/images/charging_2.png",
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                left: 145,
                top: 45,
                child: Text(
                  "75%",
                  style: titleShadowTextStyle.copyWith(fontSize: 45),
                ),
              ),
              Positioned(
                left: 117,
                bottom: 105,
                child: StatefulBuilder(builder: (context, setState) {
                  return AnimatedBuilder(
                    animation: _animAnimation!,
                    builder: (context, child) {
                      return LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width / 3.80,
                        lineHeight: 13.0,
                        percent: _animAnimation!.value,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.lightGreenAccent,
                      );
                    },
                  );
                }),
              ),
            ],
          ),
          Positioned(
            //left: 10,
            bottom: 0,
            //top:100,
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                timeDurationWidget(name: "Charging", hour: 0, minute: 2),
                SizedBox(
                  width: 85,
                ),
                timeDurationWidget(name: "Remainig", hour: 0, minute: 2),
              ],
            ),
          ),
          SizedBox(
            height: 7.0,
          ),
          Positioned(
            //left: 10,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all( 3.0),
                  child: Column(
                    children: [
                      Text(
                        "Energy\nDeliverd",
                        textAlign: TextAlign.center,
                        style: smallSubTitleShadowTextStyle,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "01.46",
                          style: titleShadowTextStyle,
                          children: [
                            //TextSpan(text: '1.46', style: titleShadowTextStyle),
                            TextSpan(
                                text: ' kWh', style: subTitleShadowTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 95,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [
                      Text(
                        "Coast",
                        textAlign: TextAlign.center,
                        style: smallSubTitleShadowTextStyle,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "20",
                          style: titleShadowTextStyle,
                          children: [
                            TextSpan(
                                text: ' \$', style: subTitleShadowTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 7.0,
          ),
          Card(
            elevation: 7.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: const Color.fromRGBO(116, 134, 134, 100),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  availableWidget(no: "A", name: "CSS2", status: "Available"),
                  occupiedWidget(no: "B", name: "CSS2", status: "Occupied"),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  ReusableAlertDialog(
                      context: context,
                      title: "Charging Details  ",
                      stationName: "1234",
                      content: SizedBox(
                        height: 450,
                        width: 420,
                        child: ListView(
                          children: [
                            Stack(
                              children: [
                                Card(
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    color: const Color.fromRGBO(
                                        116, 134, 134, 100),
                                    child: SizedBox(
                                      height: 220,
                                      width: 300,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: "75",
                                              style: largeTitleShadowTextStyle
                                                  .copyWith(fontSize: 35),
                                              children: [
                                                TextSpan(
                                                    text: ' %',
                                                    style:
                                                        subTitleShadowTextStyle),
                                              ],
                                            ),
                                          ),
                                          AnimatedBuilder(
                                            animation: _animAnimation!,
                                            builder: (context, child) {
                                              return LinearPercentIndicator(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.6,
                                                lineHeight: 15.0,
                                                percent: _animAnimation!.value,
                                                backgroundColor: Colors.white,
                                                progressColor:
                                                    Colors.lightGreenAccent,
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: RichText(
                                              text: TextSpan(
                                                text: "Remaining Time : ",
                                                style: TextStyle(
                                                    color:
                                                        Colors.lightGreenAccent,
                                                    fontSize: 15),
                                                children: [
                                                  TextSpan(
                                                      text: ' 0',
                                                      style:
                                                          subTitleShadowTextStyle),
                                                  TextSpan(
                                                      text: ' h',
                                                      style:
                                                          smallSubTitleShadowTextStyle),
                                                  TextSpan(
                                                      text: ' 2',
                                                      style:
                                                          subTitleShadowTextStyle),
                                                  TextSpan(
                                                      text: ' min',
                                                      style:
                                                          smallSubTitleShadowTextStyle),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: RichText(
                                              text: TextSpan(
                                                text: "Energy Delivered: ",
                                                style: TextStyle(
                                                    color:
                                                        Colors.lightGreenAccent,
                                                    fontSize: 15),
                                                children: [
                                                  TextSpan(
                                                      text: ' 1.46',
                                                      style:
                                                          subTitleShadowTextStyle),
                                                  TextSpan(
                                                      text: ' kWh',
                                                      style:
                                                          smallSubTitleShadowTextStyle),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Cost: ",
                                        style: TextStyle(
                                            color: Colors.lightGreenAccent,
                                            fontSize: 15),
                                        children: [
                                          TextSpan(
                                              text: ' 20',
                                              style: subTitleShadowTextStyle),
                                          TextSpan(
                                              text: ' \$',
                                              style:
                                                  smallSubTitleShadowTextStyle),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            reusableCard(
                                title: "Power", value: 52, extension: " kWh"),
                            reusableCard(
                                title: "Voltage",
                                value: 444.9,
                                extension: " V"),
                            reusableCard(
                                title: "Current",
                                value: 118.22,
                                extension: " A"),
                          ],
                        ),
                      ),
                      action: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            reusableActionButton(
                                name: "Back",
                                onPress: () {
                                  Navigator.of(context).pop();
                                }),
                            reusableActionButton(
                                name: "Stop",
                                onPress: () {
                                  //Navigator.of(context).pop();
                                }),
                          ],
                        )
                      ]);
                  _animController!.forward();
                },
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
                      "Details",
                      style: subTitleShadowTextStyle,
                    )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
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
                      "Start",
                      style: subTitleShadowTextStyle,
                    )),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancle"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
