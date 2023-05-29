import 'package:audi_pmil/utils/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginController with ChangeNotifier {
  bool _obscureText = true;
bool getobscureText(){
  notifyListeners();
  return _obscureText;
}


  void login(String email, String password, BuildContext context) async {
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        Navigator.pushNamed(context, RouteName.homeScreen);
        print('Successful');
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Email or Password are invalid')));
        print('Unsuccessful');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Widget suffix(){
    return GestureDetector(
      onTap: () {

          _obscureText = !_obscureText;
          notifyListeners();

      },
      child: Icon(_obscureText == true
          ? Icons.visibility
          : Icons.visibility_off),
    );
  }



}
