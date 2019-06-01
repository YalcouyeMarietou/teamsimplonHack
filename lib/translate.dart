import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translate',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: RaisedButton(onPressed: () {
            main();

          }),
        ),
      ),
    );
  }
  void main() async {
    final translator = GoogleTranslator();
    // for countries that default base URL doesn't work
    var translation = await translator
        .translate("Cette fille.", from: 'fr', to: 'en');
    print("translation: " + translation);
  }
}