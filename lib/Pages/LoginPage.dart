import 'package:flutter/material.dart';

import 'HomePage.dart';

bool toHome1 = false;
bool toHome2 = false;


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    if(toHome1 && toHome2){
      return HomePage();
    }
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: LoginData(),
    );
  }
}

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
