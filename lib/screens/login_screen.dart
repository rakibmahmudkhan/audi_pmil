import 'package:audi_pmil/controller/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resource/color.dart';

import '../resource/style.dart';
import '../resource/widgets/input_text_field.dart';
import '../resource/widgets/round_button.dart';
import '../utils/routes/route_name.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 00.0, left: 20.0, right: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                   /* height: 60,
                    width: 130,*/
                    child: Image(
                        image: AssetImage(
                          "assets/icons/icon2.png",
                        ),
                        /*opacity: AlwaysStoppedAnimation(0.9)*/),
                  ),
                 /* Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "EV Charger",

                        style: Theme.of(context).textTheme.subtitle1,
                      ),

                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image(
                            image: AssetImage(
                              "assets/icons/icon2.png",
                            ),
                            opacity: AlwaysStoppedAnimation(0.9)),
                      )
                    ],
                  ),*/
                  /*Text(
                    "Log in ⚡",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),*/
                  //SizedBox(height: height * 0.05),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.08, bottom: height * 0.01),
                      child: Column(
                        children: [
                          InputTextField(

                            myController: emailController,
                            focusNode: emailFocusNode,
                            onFieldSubmittedValue: (value) {},
                            hint: "Email",
                            obscureText: false,
                            suffixIcon: Icon(Icons.mail_outline),
                            suffixIconColor: Colors.black12,
                            keyBoardType: TextInputType.emailAddress,
                            onValidator: (value) {
                              return value.isEmpty ? "enter email" : null;
                            },
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Consumer<LoginController>(
                            builder: (context, provider, child) {
                              return InputTextField(
                                myController: passwordController,
                                focusNode: passwordFocusNode,
                                onFieldSubmittedValue: (value) {},
                                hint: "Password",
                                obscureText: provider.getobscureText(),
                                suffixIcon: provider.suffix(),
                                suffixIconColor: AppColors.secondaryTextColor,
                                keyBoardType: TextInputType.emailAddress,
                                onValidator: (value) {
                                  return value.isEmpty ? "enter pass" : null;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.forgotScreen);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 15, decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Consumer<LoginController>(
                      builder: (context, provider, child) {
                    return RoundButton(
                        title: "Login",
                        onpress: () {
                          //Navigator.pushNamed(context, RouteName.homeScreen);
                          //  setState(() {});
                          if (_formKey.currentState!.validate()) {
                            provider.login(emailController.text,
                                passwordController.text, context);
                          }
                        },
                        loading: false);
                  }),
                  Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: SizedBox(
                            height: height * 0.07,
                            width: size.width * 0.5,
                            child: Image(
                                image: AssetImage(
                                  "assets/images/sentinel.png",
                                ),
                                opacity: AlwaysStoppedAnimation(0.9)),
                          ),
                        ),
                        Text(
                          "www.setinel.com ",
                          style: navBarTextStyle,
                        ),
                        Text(
                          "Powerd By Sentinel Technologies ",
                          style: navBarTextStyle,
                        ),
                      ],
                    ),
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
