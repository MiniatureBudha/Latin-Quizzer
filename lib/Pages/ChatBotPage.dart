import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import '../Constants/color_constants.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  ChatBotPageState createState() => ChatBotPageState();
}

class ChatBotPageState extends State<ChatBotPage> {

  final openAI = OpenAI.instance.build(token: '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',baseOption: HttpSetup(receiveTimeout: 5000));

  @override
  Widget build(BuildContext context) {
    final request = CompleteText(prompt:'Why?', model: kTranslateModelV3, maxTokens: 200);
    openAI.onCompleteStream(request:request).listen((response) => print(response))
        .onError((err) {
    print("$err");
    });

    return Scaffold(
      backgroundColor: ColorConstants.whiteBackround,
      appBar: AppBar(
        title: const Text(
          'Latin Chatbot',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Neohellenic',
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              child: Text(
''
              ),
            ),
          ],
      ),
    );
  }
}
