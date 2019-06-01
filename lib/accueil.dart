
import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';


class SplahsUi extends StatefulWidget {
  @override
  _SplahsUiState createState() => _SplahsUiState();


}

class _SplahsUiState extends State<SplahsUi> {




  SpeechRecognition _speechRecognition;
  bool _isdisponibility = false;
  bool _isListerning = false;

  String resultText = "";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
          (bool result) => setState(() => _isdisponibility = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
          () => setState(() => _isListerning = true),
    );

    _speechRecognition.setRecognitionResultHandler(
          (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
          () => setState(() => _isListerning = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isdisponibility = result),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ClipOval(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/microphone.png')
                    )
                  ),
                  child: FlatButton(
                     padding: EdgeInsets.all(0.0),
                      onPressed: (){
                        if (_isdisponibility && !_isListerning)
                          _speechRecognition
                              .listen(locale: "fr_FR")
                              .then((result) => print('$result'));
                      },
                      child: null
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.0,),
            Text('Parlez au micro', style: TextStyle(color: Colors.white,fontSize: 25.0),),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.cyanAccent[100],
                borderRadius: BorderRadius.circular(6.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: Text(
                resultText,
                style: TextStyle(fontSize: 24.0),
              ),
            )
          ],
        ),
      )
    );
  }
}