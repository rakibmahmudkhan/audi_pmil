import 'dart:developer';

import 'package:audi_pmil/screens/profile_screen.dart';
import 'package:audi_pmil/screens/reservation_screen.dart';
import 'package:audi_pmil/screens/settings_screen.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../resource/color.dart';
import '../resource/style.dart';
import '../resource/widgets/available_widget.dart';
import '../resource/widgets/occupied_widget.dart';
import '../resource/widgets/reusableActionButton.dart';
import '../resource/widgets/reusableAlertDialog.dart';
import '../resource/widgets/reusableCard.dart';
import '../resource/widgets/timeDurationWidget.dart';
import 'charging_screen.dart';
import 'map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const List<Tab> navigationTabs = <Tab>[
    Tab(
      icon: Icon(Icons.person_outline),
    ),
    Tab(
      icon: Icon(Icons.calendar_today_outlined),
    ),
    Tab(
      icon: Icon(Icons.map_outlined),
    ),
    Tab(
      icon: Icon(Icons.settings_outlined),
    ),
  ];
  List<Widget> pages = const [
    ProfileScreen(),
    ReservationScreen(),
    MapScreen(),
    SettingsScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: navigationTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor: const Color.fromRGBO(29, 34, 40, 85),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text(
                'Scan QR-Code',
                style: titleShadowTextStyle,
              )),
              /*Padding(
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
                        child: const Text(
                          'NO.',
                          style: subTitleShadowTextStyle,
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
              )*/
            ],
          ),
          content: SizedBox(
            height: 300,
            width: 300,
            child: ListView(
              children: [
                Card(
                  elevation: 7.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: const Color.fromRGBO(116, 134, 134, 100),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 25),
                    child: Column(
                      children: [
                        /*Text(
                          'Scan QR-Code',
                          style: titleShadowTextStyle.copyWith(fontSize: 22.0),
                        ),*/
                        /*const SizedBox(
                          height: 15,
                        ),*/
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const MyQRScanner();
                              },
                            );
                          },
                          child: Image.asset(
                            "assets/images/qr_scan.gif",
                            height: 220.0,
                            width: 220.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                /*const SizedBox(
                  height: 25.0,
                ),*/
                /*  Card(
                  elevation: 7.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: const Color.fromRGBO(116, 134, 134, 100),
                  child: Container(
                    height: 60,
                    width: 255,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        availableWidget(
                            no:"A",name:"CSS2",status:"Available"
                        ),
                        occupiedWidget(no:"B",name:"CSS2",status:"Occupied"),
                      ],
                    ),
                  ),
                ),*/
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /* Text(
                  "Software Version:\n 1.1.0.0.6b101",
                  style: navBarTextStyle.copyWith(color: Colors.white),
                ),*/

                //Cancle Button

                TextButton(
                  child: Text(
                    'Close',
                    style: subTitleShadowTextStyle
                        .copyWith(shadows: [const Shadow(blurRadius: 12.0)]),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 60,
        centerTitle: true,
        title: const Text("EV chargers"),
        titleTextStyle: titleTextStyle,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.white, blurStyle: BlurStyle.inner),
          ],
        ),
        child: TabBar(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
          controller: _tabController,
          tabs: navigationTabs,
          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            return states.contains(MaterialState.focused)
                ? null
                : Colors.transparent;
          }),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          /*_showDialog();*/
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MyQRScanner();
            },
          );
        },
        backgroundColor: AppColors.primaryColor2,
        child: const Icon(
          Icons.qr_code,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}

class MyQRScanner extends StatefulWidget {
  const MyQRScanner({Key? key}) : super(key: key);

  @override
  State<MyQRScanner> createState() => _MyQRScannerState();
}

class _MyQRScannerState extends State<MyQRScanner>
    with TickerProviderStateMixin {
  final GlobalKey _qrKey = GlobalKey();
  QRViewController? _controller;

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
      duration: Duration(seconds: 3),
    );
    _animAnimation = Tween(begin: 0.0, end: 0.75).animate(_animController!);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: const Color.fromRGBO(29, 34, 40, 85),
      title: const Text(
        'Scan QR-Code',
        style: subTitleShadowTextStyle,
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
          height: 300,
          width: 250,
          child: FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 500)),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return QRView(
                  key: _qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                      borderColor: Colors.lightBlueAccent,
                      borderRadius: 10.0,
                      borderLength: 25.0,
                      borderWidth: 7.0,
                      cutOutSize: (MediaQuery.of(context).size.width < 400 ||
                              MediaQuery.of(context).size.height < 400)
                          ? 250.0
                          : 300.0),
                );
              }
              return Container();
            },
          )),
      actions: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 85,
            width: 255.0,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await _controller?.toggleFlash();
                        setState(() {});
                      },
                      child: FutureBuilder(
                        future: _controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return const Text(
                            'Flash',
                            style: subTitleShadowTextStyle,
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await _controller?.flipCamera();
                        setState(() {});
                      },
                      child: FutureBuilder(
                        future: _controller?.getCameraInfo(),
                        builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            return const Text(
                              'Camera facing ',
                              style: subTitleShadowTextStyle,
                            );
                          } else {
                            return const Text('loading');
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),

                /*  Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     GestureDetector(
                       onTap: () async {
                         await _controller?.pauseCamera();
                       },
                       child: const Text(
                         'Pause',
                         style: subTitleShadowTextStyle,
                       ),
                     ),
                     GestureDetector(
                       onTap: () async {
                         await _controller?.resumeCamera();
                       },
                       child: Text('Resume',
                           style: subTitleShadowTextStyle.copyWith(
                               color: Colors.white)),
                     ),
                   ],
                 ),
                 */

                const SizedBox(
                  height: 8.0,
                ),
                GestureDetector(
                  onTap: () async {
                    await _controller?.resumeCamera();
                  },
                  child: Card(
                    color: Colors.white,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0)),
                        height: 30,
                        width: 230,
                        child: const Center(
                          child: Text('Scan'),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
              ],
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  Future<void> _onQRViewCreated(QRViewController controller) async {
    setState(() {
      _controller = controller;
      _isScannerReady = true;
      _animController!.forward();
      /* _animController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
      )..forward();*/
    });
    // await Future.delayed(Duration(seconds: 1));
    _controller?.scannedDataStream.listen((scanData) async {
      Navigator.of(context).pop();
      // await showChargingScreen(context, scanData.code);
      await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChargingScreen(qrCode: scanData.code),
      ));
      // _animController!.forward();

      /*setState(() {*/
      /*  result = scanData;*/
      /*  scannedId = result?.code;*/
      /*  print("result" + "$result");*/
      /*  print("ScannedId" + "$scannedId");*/
      /*});*/
      // Navigator.of(context).pop(scanData.code);
    });
  }

// if charging screen in alertDialog than use this
/*  Future<void> showChargingScreen(BuildContext context, var qrCode) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor: const Color.fromRGBO(29, 34, 40, 85),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text(
                'Charging Screen',
                style: titleShadowTextStyle,
              )),
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
              )
            ],
          ),
          content: chargingDialogContent(),

          */ /*   _qrKey != null
               ? const Text('Valid')
               : const Icon(Icons.error_outline_outlined),*/ /*
          actions: [
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
                          height: 400,
                          width: 400,
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
                                                style:
                                                    largeTitleShadowTextStyle,
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
                                                  percent:
                                                      _animAnimation!.value,
                                                  backgroundColor: Colors.white,
                                                  progressColor:
                                                      Colors.lightGreenAccent,

                                                );
                                              },
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: RichText(
                                                text: TextSpan(
                                                  text: "Remaining Time : ",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .lightGreenAccent,
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: RichText(
                                                text: TextSpan(
                                                  text: "Energy Delivered: ",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .lightGreenAccent,
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
                    Navigator.of(context).pop(qrCode);
                  },
                  child: Text("Cancle"),
                )
              ],
            ),
          ],
        );
      },
    );
  }*/

  Widget chargingDialogContent() {
    return SizedBox(
      height: 400,
      width: 400,
      child: ListView(
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
                    height: 190.0,
                    width: 280.0,
                    image: AssetImage(
                      "assets/images/charging_2.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 90,
                top: 35,
                child: Text(
                  "75%",
                  style: titleShadowTextStyle,
                ),
              ),
              Positioned(
                left: 67,
                bottom: 97,
                child: StatefulBuilder(builder: (context, setState) {
                  return AnimatedBuilder(
                    animation: _animAnimation!,
                    builder: (context, child) {
                      return LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width / 4.1,
                        lineHeight: 13.0,
                        percent: _animAnimation!.value,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.lightGreenAccent,
                      );
                    },
                  );
                }),
              ),
              Positioned(
                //left: 10,
                bottom: 10,
                //top:100,
                child: Row(
                  children: [
                    timeDurationWidget(name: "Charging", hour: 0, minute: 2),
                    SizedBox(
                      width: 90,
                    ),
                    timeDurationWidget(name: "Remainig", hour: 0, minute: 2),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            //left: 10,
            bottom: 10,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [
                      Text(
                        "Energy\nDeliverd",
                        textAlign: TextAlign.center,
                        style: smallSubTitleShadowTextStyle,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "0",
                          style: titleShadowTextStyle,
                          children: [
                            TextSpan(text: '1.46', style: titleShadowTextStyle),
                            TextSpan(
                                text: ' kWh', style: subTitleShadowTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 90,
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
            height: 5.0,
          ),
          Card(
            elevation: 7.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: const Color.fromRGBO(116, 134, 134, 100),
            child: Container(
              height: 60,
              width: 255,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  availableWidget(no: "A", name: "CSS2", status: "Available"),
                  occupiedWidget(no: "B", name: "CSS2", status: "Occupied"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

/*  Future<void> showDetailsScreen(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor: const Color.fromRGBO(29, 34, 40, 85),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text(
                'Details Screen',
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
                        child: const Text(
                          'NO.',
                          style: subTitleShadowTextStyle,
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
              )
            ],
          ),
          content: Text('Details for QR Code  '),
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Back"),
                ),
                TextButton(
                  onPressed: () {
                    //Navigator.of(context).pop();
                  },
                  child: Text("Stop"),
                ),
              ],
            )
          ],
        );
      },
    );
  }*/

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
    _animController!.dispose();
  }
}
