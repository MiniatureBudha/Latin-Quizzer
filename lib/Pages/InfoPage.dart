import 'package:flutter/material.dart';
import 'package:flutter_app/Components/StandardButton.dart';
import 'package:flutter_app/Constants/color_constants.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.facebook.com/thesaugatuckchainferry/');
final Uri _url2 = Uri.parse('https://saugatuckboatcruises.com/');
final Uri _url3 = Uri.parse('https://www.facebook.com/starofsaugatuckboatcruises');
final Uri _url4 = Uri.parse('https://www.saugatuckcity.com/mt-baldhead-park.html');
final Uri _url5 = Uri.parse('https://mysdhistory.org/locations/the-history-museum-at-mt-baldhead-park/');
final Uri _url6 = Uri.parse('https://mtbaldheadchallenge.com/');
final Uri _url7 = Uri.parse('https://www.saugatuckcity.com/oval-beach.html');
final Uri _url8 = Uri.parse('https://saugatuck.com/business-listings/oval-beach/');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

Future<void> _launchUrl2() async {
  if (!await launchUrl(_url2)) {
    throw Exception('Could not launch $_url2');
  }
}

Future<void> _launchUrl3() async {
  if (!await launchUrl(_url3)) {
    throw Exception('Could not launch $_url3');
  }
}

Future<void> _launchUrl4() async {
  if (!await launchUrl(_url4)) {
    throw Exception('Could not launch $_url4');
  }
}

Future<void> _launchUrl5() async {
  if (!await launchUrl(_url5)) {
    throw Exception('Could not launch $_url5');
  }
}

Future<void> _launchUrl6() async {
  if (!await launchUrl(_url6)) {
    throw Exception('Could not launch $_url6');
  }
}

Future<void> _launchUrl7() async {
  if (!await launchUrl(_url7)) {
    throw Exception('Could not launch $_url7');
  }
}

Future<void> _launchUrl8() async {
  if (!await launchUrl(_url8)) {
    throw Exception('Could not launch $_url8');
  }
}


class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  static double musicVolume = 1;

  InfoPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteBackround,
      appBar: AppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        title: const Text(
          'Local Links',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConstants.buttonColor,
                    fontSize: 30,
                    fontFamily: 'Lato',
                  ),
                  'Saugatuck Douglas'
              ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: StandardButton("Chain Ferry Facebook", () {
                _launchUrl();
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: StandardButton("Star of Saugatuck Website", () {
                _launchUrl2();
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: StandardButton("Star of Saugatuck Facebook", () {
                _launchUrl3();
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: StandardButton("Mt. Baldhead City Website", () {
                _launchUrl4();
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: StandardButton("Mt. Baldhead History Museum Website", () {
                _launchUrl5();
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: StandardButton("Mt. Baldhead Challenge ", () {
                _launchUrl6();
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: StandardButton("Oval Beach City of Douglas Website", () {
                _launchUrl7();
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: StandardButton("Oval Beach Saugatuck Douglas Website", () {
                _launchUrl8();
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 52,
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: () =>
                  Navigator.popUntil(context, ModalRoute.withName('/')),
              child: const Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
