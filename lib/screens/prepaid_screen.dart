import 'package:audi_pmil/resource/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resource/color.dart';

class PrepaidScreen extends StatefulWidget {
  PrepaidScreen({Key? key}) : super(key: key);

  @override
  State<PrepaidScreen> createState() => _PrepaidScreenState();
}

class _PrepaidScreenState extends State<PrepaidScreen> {
  final TextEditingController _moneyController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordRepeatController = TextEditingController();



  void _pay(BuildContext  context){
    FocusManager.instance.primaryFocus?.unfocus();
    if (double.parse(_moneyController.text) > 0) {
      const SnackBar(
        content: Text(
            "Successfully added money to your account"),
      );
    } else {
      SnackBar(
        content: Text(
            "You can't added nagative some of money"),
      );
    }
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        toolbarHeight: 80,
        title: Text("Prepaid"),
        titleTextStyle: titleTextStyle,
        backgroundColor: AppColors.whiteColor,
      ),
      body: ListView(
        children: [
          const Heading(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Card(
              elevation: 12.0,
              color: AppColors.primaryColor2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 60.0, bottom: 50.0),
                    child: Text(
                      "Enter The Amount: ",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontFamily: fontName,
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0, right: 50.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: TextField(
                            textAlign: TextAlign.end,
                            controller: _moneyController,
                            style: prepaidTextStyle,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: AppColors.whiteColor,
                                    width: 5.0,
                                  ),
                                ),
                                suffixIcon: const Icon(
                                  Icons.attach_money_outlined,
                                  color: AppColors.whiteColor,
                                ),
                                focusColor: AppColors.whiteColor),
                            cursorColor: AppColors.whiteColor,
                            maxLength: 6,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: (() {
                           _pay(context);
                          }),
                          child: Text("Pay"),
                          style: formButton,
                        ),
                        const SizedBox(
                          height: 40.0,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 40.0),
      child: Text(
        textAlign: TextAlign.center,
        "Pay in Advance and get great discount 💸",
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
