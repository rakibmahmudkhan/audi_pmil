import 'package:flutter/material.dart';

import '../resource/color.dart';
import '../resource/style.dart';
import '../resource/widgets/action_button.dart';
import '../resource/widgets/padding_card.dart';
class CurrentAccount extends StatelessWidget {
  const CurrentAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 60,
        title: const Text("Current Account"),
        titleTextStyle: titleTextStyle,
        backgroundColor: AppColors.whiteColor,
      ),
      body: ListView(
        children: [
          PaddingCard(
            Column(
              children: [
                AccountItem("First Name","MR.x"),
                AccountItem("Last Name","y"),
                AccountItem(" Email","xy@gmail.com"),
              ],
            ),
          ),
          ActionButton("Update password",(){
            //Change Password Page
          })
        ],
      ),
    );
  }
}

class AccountItem extends StatelessWidget {
  final String title;
  final String subTitle;
  const AccountItem(this.title,this.subTitle,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: bodyTextStyle,),
      subtitle: Text(subTitle),

    );
  }
}

