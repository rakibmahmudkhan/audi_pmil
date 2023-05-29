import 'package:audi_pmil/controller/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resource/color.dart';

import '../resource/widgets/input_text_field.dart';
import '../resource/widgets/round_button.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  final emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor.withOpacity(0.1),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //SizedBox(height: height*0.01,),
                  /*Text("Forgot Password",
                  style: Theme.of(context).textTheme.headline3,),*/
                 // SizedBox(height: height*0.01,),
                  Text(
                    "Enter Your Email Address \n to recover your password",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                 // SizedBox(height: height*0.01,),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.06, bottom: height * 0.01),
                      child: Column(
                        children: [
                          InputTextField(
                            myController: emailController,
                            focusNode: emailFocusNode,
                            onFieldSubmittedValue: (value) {},
                            hint: "Email",
                            obscureText: false,
                            keyBoardType: TextInputType.emailAddress,
                            onValidator: (value) {
                              return value.isEmpty ? "enter email" : null;
                            },
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Consumer<ForgotPasswordController>(builder: (context,provider, child){
                    return   RoundButton(
                      title: "Recover",
                      onpress: () {
                        if (_formKey.currentState!.validate()) {

                        }
                      },
                      loading: false
                    );
                  }),
                  SizedBox(
                    height: height * 0.09,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
