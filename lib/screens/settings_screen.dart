import 'package:flutter/material.dart';
import '../resource/color.dart';
import '../resource/style.dart';
import '../resource/widgets/action_button.dart';
import '../resource/widgets/padding_card.dart';
import '../utils/routes/route_name.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void multiply() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          PaddingCard(
            SettingsCard(
              "Personal",
              [
                CardItem(Icons.person_outline_outlined, "Current Account",
                    function: () {
                  Navigator.pushNamed(context, RouteName.currentAccount);
                }),
                CardItem(Icons.edit_outlined, "Surveys", function: () {}),
                CardItem(Icons.place_outlined, "Suggest a charger",
                    function: () {}),
                CardItem(Icons.electric_car_outlined, "Set Up Car",
                    function: () {
                  Navigator.pushNamed(context, RouteName.carPickingScreen);
                }),
              ],
            ),
          ),
          PaddingCard(
            SettingsCard(
              "Payment",
              [
                CardItem(
                  Icons.payment_outlined,
                  "Prepaid",
                  function: () {
                    Navigator.pushNamed(context, RouteName.prepaidScreen);
                  },
                ),
                CardItem(
                  Icons.bolt_outlined,
                  "My Pricing",
                  function: () {},
                ),
                CardItem(
                  Icons.ev_station_outlined,
                  "My Charging",
                  function: () {},
                ),
                CardItem(
                  Icons.confirmation_num_outlined,
                  "Promotion",
                  function: () {},
                ),
              ],
            ),
          ),
          PaddingCard(
            SettingsCard(
              "Information",
              [
                CardItem(Icons.call_outlined, "Live Support"),
                CardItem(Icons.alternate_email, "Contact"),
                CardItem(Icons.question_answer_outlined, "FAQ"),
                CardItem(Icons.key_outlined, "App Permission"),
                CardItem(Icons.help_outlined, "App Information"),
              ],
            ),
          ),
          ActionButton(
            "Log Out",
            (() => {Navigator.pushNamed(context, RouteName.loginScreen)}),
          ),
        ],
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final String title;
  final List<CardItem> items;

  const SettingsCard(this.title, this.items, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: bodyTextStyle,
          ),
        ),
        ...items
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? function;

  CardItem(this.icon, this.title, {Key? key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.primaryIconColor,
        ),
        title: Text(
          title,
          style: buttonTextStyle,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.primaryIconColor,
        ),
      ),
    );
  }
}
