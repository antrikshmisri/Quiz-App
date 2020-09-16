import 'package:flutter/material.dart';
import 'package:quizzler/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  int i = 0;
  QuizBrain quizBrainobj = QuizBrain();
  List<Widget> icons = [];
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrainobj.questionObjects[i].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green[400]),
                  borderRadius: BorderRadius.circular(20)),
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer =
                    quizBrainobj.questionObjects[i].questionAnswer;
                if(i < quizBrainobj.questionObjects.length - 1)
                {
                  if (correctAnswer == true) {
                    icons.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    icons.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  }
                }
                setState(() {
                  if (i < quizBrainobj.questionObjects.length - 1) {
                    i++;
                  }
                  else {
                    Alert(
                      context: context,
                      title: "No Questions Left",
                      desc: "You have Answered All the Questions",
                    ).show();
                  }
                }); //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer =
                    quizBrainobj.questionObjects[i].questionAnswer;
                if(i<quizBrainobj.questionObjects.length - 1)
                {
                  if (correctAnswer == false) {
                  icons.add(Icon(
                    Icons.check,
                    color: Colors.green,
                  ));
                }
                  else {
                  icons.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                }
                setState(() {
                  if (i < quizBrainobj.questionObjects.length - 1) {
                    i++;
                  }
                  else {
                    Alert(
                      context: context,
                      title: "No Questions Left",
                      desc: "You have Answered All the Questions",
                    ).show();
                  }
                }); //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: icons,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
