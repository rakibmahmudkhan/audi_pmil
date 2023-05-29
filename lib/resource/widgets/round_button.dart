import 'package:flutter/material.dart';

import '../color.dart';

class RoundButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onpress;
  final Color? textColor;
  final Color? color;
  final bool loading;

  RoundButton({
    Key? key,
    required this.title,
    required this.onpress,
    this.textColor = AppColors.whiteColor,
    this.color = AppColors.primaryColor,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onpress,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.primaryColor2, borderRadius: BorderRadius.circular(40.0)),
        height: 50,
        width: double.infinity,
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              ))
            : Center(
                child: Text(
                title!,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 16, color: AppColors. primaryTextTextColor),
              )),
      ),
    );
  }
}
