import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(begin: 0.0, end: 0.70).animate(_controller!);
  }

  @override
  void dispose() {
    // Dispose the animation controller
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    body: Center(
      child: MyHomePage(),

    ),
    );
      /*body: Center(
        child: ElevatedButton(
          child: Text('Show Alert Dialog'),
          onPressed: () {
            ReusableAlertDialog(
                context: context,
                title: "Charging Details  ",
                stationName: "1234",
                content: SizedBox(
                  height: 400,
                  width: 400,
                  child: ListView(
                    children: [
                      Stack(
                        children: [
                          Card(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              color: const Color.fromRGBO(116, 134, 134, 100),
                              child: SizedBox(
                                height: 220,
                                width: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: "75",
                                        style: largeTitleShadowTextStyle,
                                        children: [
                                          TextSpan(
                                              text: ' %',
                                              style: subTitleShadowTextStyle),
                                        ],
                                      ),
                                    ),
                                    AnimatedBuilder(
                                      animation: _animation!,
                                      builder: (context, child) {
                                        return LinearPercentIndicator(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.6,
                                          lineHeight: 15.0,
                                          percent: _animation!.value,
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
                                              color: Colors.lightGreenAccent,
                                              fontSize: 15),
                                          children: [
                                            TextSpan(
                                                text: ' 0',
                                                style: subTitleShadowTextStyle),
                                            TextSpan(
                                                text: ' h',
                                                style:
                                                    smallSubTitleShadowTextStyle),
                                            TextSpan(
                                                text: ' 2',
                                                style: subTitleShadowTextStyle),
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
                                              color: Colors.lightGreenAccent,
                                              fontSize: 15),
                                          children: [
                                            TextSpan(
                                                text: ' 1.46',
                                                style: subTitleShadowTextStyle),
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
                                        style: smallSubTitleShadowTextStyle),
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
                          title: "Voltage", value: 444.9, extension: " V"),
                      reusableCard(
                          title: "Current", value: 118.22, extension: " A"),
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
            _controller!.forward();
          },
        ),
      ),*/

  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer _timer;
  late String _timeString;

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _timeString = _formatDateTime(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _timeString,
          style: TextStyle(fontSize: 24,color:Colors.black),
        ),
      ),
    );
  }
}
