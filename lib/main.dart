import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/HomePage.dart';

import 'Components/StandardButton.dart';
import 'Constants/color_constants.dart';

void main() => runApp(const MyApp());
bool toHome1 = false;
bool toHome2 = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: MyLogin()
    );
  }
}

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    if(toHome1 && toHome2){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const HomePage();
        }));
    }
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: LoginData(),
    );
  }
}
//body: const LoginInput(),
class LoginData extends StatefulWidget {
  const LoginData({super.key});

  @override
  State<LoginData> createState() => _LoginDataState();
}

class _LoginDataState extends State<LoginData> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: myController1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Username';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: myController2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: ElevatedButton(
                  onPressed: () {
                    if(myController1.text == 'James'){
                      toHome1 = true;
                      if(myController2.text == '1111'){
                        toHome2 = true;
                      }
                    }
                    if(toHome1 && toHome2){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }));
                    }
                  },
                  child: const Text('Enter'),
                ),
              ),
            )
          ],
        )
    );
  }
}
