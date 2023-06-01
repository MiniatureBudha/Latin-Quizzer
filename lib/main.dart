import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Home.dart';
import 'package:flutter_app/Constants/color_constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Login Page';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const LoginInput(),
      ),
    );
  }
}

class LoginInput extends StatefulWidget {
  const LoginInput({super.key});

  @override
  LoginInputState createState() {
    return LoginInputState();
  }
}

class LoginInputState extends State<LoginInput> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Username',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Username';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if(equal(_formKey.currentState, 'Bob')){
                    return Home();
                  }
                }
              },
              child: const Text('Enter'),
            ),
          ),
        ],
      ),
    );
  }
}