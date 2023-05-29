import 'package:audi_pmil/resource/style.dart';
import 'package:audi_pmil/resource/widgets/padding_card.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../resource/color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //MapWindow(),
        BalanceWindow(),
        const LastFiveWindow(),
        const StatisticWindow(),
      ],
    );
  }
}

class MapWindow extends StatelessWidget {
  final LatLng? userPosition;

  const MapWindow({this.userPosition, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingCard(
      backgroundColor: const Color.fromARGB(220, 20, 20, 20),
      SizedBox(
          height: 300.0,
          child: Center(
            child: Text(
              "  Google Map \n [Map window]",
              style: appBarTextStyle,
            ),
          )),
    );
  }
}

class BalanceWindow extends StatelessWidget {
  final double balance = 20.0;

  const BalanceWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingCard(
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "Your balance",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: mediumTextSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: fontName),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                '\$$balance',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: fontName,
                  fontSize: hugeFontSize,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 165.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                      ),
                    ),
                    onPressed: () => {},
                    child: const Text('Transfer Money'),
                  ),
                ),
                SizedBox(
                  width: 165.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('See benefits'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(220, 20, 20, 20),
    );
  }
}

class LastFiveWindow extends StatefulWidget {
  const LastFiveWindow({Key? key}) : super(key: key);

  @override
  State<LastFiveWindow> createState() => _LastFiveWindowState();
}

class _LastFiveWindowState extends State<LastFiveWindow> {
  List<Transaction>? transactions;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transactions = Transaction.totalTrans();
  }

  @override
  Widget build(BuildContext context) {
    return PaddingCard(
      DataTable(
        columns: [
          DataColumn(
            label: Text('Date',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          DataColumn(
              label: Text('Station',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Price',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('kWh',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
        ],
        rows: transactions!
            .map(
              (e) => DataRow(cells: [
                DataCell(
                  Text("11-1-23"),
                ),
                DataCell(
                  Text("Uttara"),
                ),
                DataCell(
                  Text("300"),
                ),
                DataCell(
                  Text("30"),
                ),
              ]),
            )
            .toList(),
      ),
    );
  }
}

class Transaction {
  String? date;
  String? station;
  String? price;
  String? kwh;

  Transaction({this.date, this.station, this.price, this.kwh});

  static List<Transaction> totalTrans() {
    return <Transaction>[
      Transaction(date: "11-1-23", station: "Uttara", price: "300", kwh: "30"),
      Transaction(
          date: "15-1-23", station: "Dhanmondi", price: "400", kwh: "40"),
      Transaction(
          date: "20-1-23", station: "Khilkhet", price: "300", kwh: "30"),
      Transaction(date: "15-2-23", station: "Uttara", price: "700", kwh: "70"),
      Transaction(
          date: "25-2-23", station: "Dhanmondi", price: "400", kwh: "40"),
    ];
  }
}
class StatisticWindow extends StatefulWidget {
  const StatisticWindow({Key? key}) : super(key: key);

  @override
  State<StatisticWindow> createState() => _StatisticWindowState();
}

class _StatisticWindowState extends State<StatisticWindow> {
  double kwhUsed = 0.0;

  getUserTransactions() async {
    kwhUsed = 30.0;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return PaddingCard(
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "kWh Used",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: mediumTextSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: fontName),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                '$kwhUsed',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: fontName,
                  fontSize: hugeFontSize,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.amber,
    );
  }
}

/*PaddingCard(SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "KWh Used",
                style: TextStyle(
                    color: AppColors.primaryTextTextColor,
                    fontSize: mediumTextSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: fontName),
              ),
            )
          ],
        )));*/
