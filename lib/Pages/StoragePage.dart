/*
@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Login Page',
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Column(
        children: [
          if(toHome)...[
            HomePage()
          ],
          const Center(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: LoginInput('Username'),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: LoginInput('Password'),
            ),
          ),
        ],
      ),
    ),
  );
}
}
//body: const LoginInput(),
class LoginInput extends StatefulWidget {
  final String textLabel;
  const LoginInput(this.textLabel, {super.key});

  @override
  LoginInputState createState() => LoginInputState();
}

class LoginInputState extends State<LoginInput> {
  final _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final String nLabel = widget.textLabel;
    return Form(
      key: _loginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: nLabel,
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter $nLabel';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: ElevatedButton(
              onPressed: () {
                if (_loginKey.currentState!.validate()) {
                  if(nLabel == 'James'){
                    toHome = true;
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
*/
