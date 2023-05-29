import 'package:flutter/material.dart';

import '../color.dart';
import '../style.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidator;
  final TextInputType keyBoardType;
  final String hint;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final bool? obscureText;
  final bool enable;
  final bool autoFocus;

  const InputTextField({
    Key? key,
    this.suffixIcon,
    this.suffixIconColor,
    required this.myController,
    required this.focusNode,
    required this.onFieldSubmittedValue,
    required this.keyBoardType,
      this.obscureText,
    required this.hint,
    this.enable = true,
    this.autoFocus = false,
    required this.onValidator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: myController,
        obscureText: obscureText!,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmittedValue,
        validator: onValidator,

        keyboardType: keyBoardType,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(height: 0, fontSize: 19),
        decoration: InputDecoration(
          suffixIconColor: suffixIconColor,
          suffix: suffixIcon,
          hintText: hint,
          contentPadding: const EdgeInsets.all(15),
          hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              height: 0,
              color: AppColors.primaryTextTextColor.withOpacity(0.8)),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldDefaultFocus),
            borderRadius: BorderRadius.all(
              (Radius.circular(8)),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color:AppColors.primaryColor2 ),
            borderRadius: BorderRadius.all(
              (Radius.circular(8)),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.alertColor),
            borderRadius: BorderRadius.all(
              (Radius.circular(8)),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.textFieldDefaultBorderColor),
            borderRadius: BorderRadius.all(
              (Radius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }
}
