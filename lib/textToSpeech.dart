import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:tts/tts.dart';



void main() => runApp(TextToSpeech());

class TextToSpeech extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: true;
    return MaterialApp(
      title: 'PREMIER CODE',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'TEXT TO SPEECH'),
    routes:<String, WidgetBuilder>{
      '/main':(BuildContext context)=>new MyApp(),
    },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application.
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController yourText = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    speak() async{
      Tts.speak(yourText.text);
    }


    // This method is rerun every time setState is called
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget.
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            TextFormField(
              controller: yourText,
              decoration: const InputDecoration(
                icon: Icon(Icons.text_format),
                hintText: 'What do you want me to say?',
                labelText: 'Your text *',
              ),
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String value) {
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            ),


    RaisedButton(
        child: Text("Close"),
        onPressed:(){
          Navigator.pushReplacementNamed(context, '/main');
        }
    ),
        ],


      ),
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: 'Pick Image',
        child: new Icon(Icons.speaker),
        onPressed: (){
          speak();
        },

      ),

    );


  }


}


