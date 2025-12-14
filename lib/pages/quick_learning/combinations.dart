import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class CombinationsPage extends StatefulWidget {
  @override
  _CombinationsPageState createState() => _CombinationsPageState();
}

class _CombinationsPageState extends State<CombinationsPage> {
  List<dynamic> questions = [];
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool showResult = false;
  bool isCorrect = false;
  late String correctAnswer;
  late String explanation;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    // Load the JSON file
    String data = await rootBundle.loadString('assets/json/combinations.json');
    setState(() {
      questions = json.decode(data);
    });
  }

  void checkAnswer(String answer) {
    setState(() {
      correctAnswer = questions[currentQuestionIndex]['correct_answer'];
      explanation = questions[currentQuestionIndex]['why'];
      isCorrect = answer == correctAnswer;
      showResult = true;
      selectedAnswer = answer;
    });
  }

  void nextQuestion() {
    setState(() {
      currentQuestionIndex = (currentQuestionIndex + 1) % questions.length;
      showResult = false;
      selectedAnswer = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Combinations Quiz'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    var currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Combinations Quiz'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}/${questions.length}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              currentQuestion['question'],
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            ...currentQuestion['options'].map<Widget>((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: selectedAnswer,
                onChanged: (value) {
                  if (!showResult) {
                    setState(() {
                      selectedAnswer = value!;
                    });
                  }
                },
              );
            }).toList(),
            SizedBox(height: 20.0),
            if (showResult)
              Column(
                children: [
                  Text(
                    isCorrect ? 'Correct!' : 'Incorrect',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Correct Answer: $correctAnswer',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Explanation: $explanation',
                    style:
                        TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: nextQuestion,
                    child: Text('Next Question'),
                  ),
                ],
              )
            else
              ElevatedButton(
                onPressed: selectedAnswer != null
                    ? () => checkAnswer(selectedAnswer!)
                    : null,
                child: Text('Submit Answer'),
              ),
          ],
        ),
      ),
    );
  }
}
