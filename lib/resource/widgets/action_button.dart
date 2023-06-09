import 'package:audi_pmil/resource/widgets/padding_card.dart';
import 'package:flutter/material.dart';

import '../style.dart';
class ActionButton extends StatelessWidget {
  final void Function()? action;
  final String title;

  const ActionButton(this.title,this.action,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingCard(
      ElevatedButton(style: myElevatedButtonStyle,onPressed: action,child: Text(title),)
    );
  }
}
