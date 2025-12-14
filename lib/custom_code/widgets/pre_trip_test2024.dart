// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Define the Answer model
class Answer {
  String answerText;
  bool isCorrect;

  Answer({required this.answerText, required this.isCorrect});
}

// Update the Question model to include an explanation
class Question {
  String questionText;
  List<Answer> answers;
  String explanation; // New field for explanation

  Question(
      {required this.questionText,
      required this.answers,
      required this.explanation});
}

// Answer Widget
class AnswerWidget extends StatelessWidget {
  final Answer answer;
  final Color color;
  final VoidCallback onSelect;

  AnswerWidget(
      {required this.answer, required this.color, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Text(answer.answerText, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}

// Question Widget
class QuestionWidget extends StatefulWidget {
  final Question question;
  final Function(int) onSelectAnswer;

  QuestionWidget(
      {Key? key, required this.question, required this.onSelectAnswer})
      : super(key: key);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? selectedAnswerIndex;
  bool isAnswerConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.question.questionText,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        ...widget.question.answers.asMap().entries.map((entry) {
          int idx = entry.key;
          Answer answer = entry.value;
          Color color = Colors.white;

          if (selectedAnswerIndex != null) {
            if (idx == selectedAnswerIndex) {
              color = isAnswerConfirmed
                  ? (answer.isCorrect ? Colors.green : Colors.red)
                  : Colors.yellow;
            } else if (isAnswerConfirmed && answer.isCorrect) {
              color = Colors.green;
            }
          }

          return AnswerWidget(
              answer: answer,
              color: color,
              onSelect: () {
                if (!isAnswerConfirmed) {
                  setState(() {
                    selectedAnswerIndex = idx;
                  });
                }
              });
        }).toList(),
        SizedBox(height: 20),
        if (!isAnswerConfirmed)
          ElevatedButton(
            onPressed: () {
              if (selectedAnswerIndex != null) {
                setState(() {
                  isAnswerConfirmed = true;
                });
                widget.onSelectAnswer(selectedAnswerIndex!);
              }
            },
            child: Text('Confirm'),
          ),
        // Display 'Correct', 'Wrong', and the explanation
        if (isAnswerConfirmed)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.question.answers[selectedAnswerIndex!].isCorrect
                    ? 'CORRECT'
                    : 'WRONG',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:
                        widget.question.answers[selectedAnswerIndex!].isCorrect
                            ? Colors.green
                            : Colors.red),
              ),
              SizedBox(height: 10),
              Text('EXPLANATION:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(widget.question.explanation),
            ],
          ),
      ],
    );
  }
}

class PreTripTest2024 extends StatefulWidget {
  const PreTripTest2024({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _PreTripTest2024State createState() => _PreTripTest2024State();
}

class _PreTripTest2024State extends State<PreTripTest2024> {
  int currentQuestionIndex = 0;
  bool showNextButton = false;

  final List<Question> questions = [
    Question(
        questionText:
            'What is the first step in conducting a pre-trip inspection?',
        answers: [
          Answer(answerText: 'Checking the engine oil level', isCorrect: false),
          Answer(
              answerText: 'Reviewing the last vehicle inspection report',
              isCorrect: true),
          Answer(answerText: 'Starting the engine', isCorrect: false),
          Answer(answerText: 'Testing the brakes', isCorrect: false)
        ],
        explanation:
            'The first step in conducting a pre-trip inspection is reviewing the last vehicle inspection report for any unresolved issues.'),
    Question(
        questionText:
            'Why is it important to check for leaks under the vehicle during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'To assess fuel efficiency', isCorrect: false),
          Answer(
              answerText: 'To check the condition of the tires',
              isCorrect: false),
          Answer(
              answerText: 'To identify any potential fluid leaks',
              isCorrect: true),
          Answer(
              answerText: 'To ensure the vehicle is parked properly',
              isCorrect: false)
        ],
        explanation:
            'Checking for leaks under the vehicle helps identify any potential fluid leaks that could indicate a mechanical problem.'),
    Question(
        questionText:
            'What should a driver inspect within the engine compartment during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'Seatbelt functionality', isCorrect: false),
          Answer(answerText: 'Belts, hoses, and fluid levels', isCorrect: true),
          Answer(answerText: 'Cargo securement', isCorrect: false),
          Answer(answerText: 'Rearview mirror adjustment', isCorrect: false)
        ],
        explanation:
            'Within the engine compartment, a driver should inspect belts, hoses, and fluid levels as part of the pre-trip inspection.'),
    Question(
        questionText:
            'What is the purpose of checking the suspension system during a pre-trip inspection?',
        answers: [
          Answer(
              answerText: 'To ensure comfort while driving', isCorrect: false),
          Answer(
              answerText: 'To verify proper load distribution',
              isCorrect: false),
          Answer(
              answerText: 'To assess the vehicle’s stability and safety',
              isCorrect: true),
          Answer(
              answerText: 'To check the vehicle’s speed capability',
              isCorrect: false)
        ],
        explanation:
            'Checking the suspension system is crucial for assessing the vehicle’s stability and safety.'),
    Question(
        questionText:
            'During a pre-trip inspection, what should a driver check regarding the tires?',
        answers: [
          Answer(answerText: 'Brand and size', isCorrect: false),
          Answer(
              answerText: 'Pressure, tread depth, and condition',
              isCorrect: true),
          Answer(answerText: 'Color and cleanliness', isCorrect: false),
          Answer(answerText: 'Age and warranty', isCorrect: false)
        ],
        explanation:
            'Tire pressure, tread depth, and overall condition are critical aspects to check during a pre-trip inspection.'),
    Question(
        questionText:
            'Why is it important to test the vehicle’s lights during a pre-trip inspection?',
        answers: [
          Answer(
              answerText: 'To enhance the vehicle’s appearance',
              isCorrect: false),
          Answer(
              answerText:
                  'To ensure visibility and communication with other drivers',
              isCorrect: true),
          Answer(
              answerText: 'To comply with interior comfort standards',
              isCorrect: false),
          Answer(answerText: 'To reduce energy consumption', isCorrect: false)
        ],
        explanation:
            'Testing the vehicle’s lights ensures visibility and communication with other drivers on the road.'),
    Question(
        questionText:
            'What should a driver check regarding the vehicle’s mirrors during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'Their cleanliness', isCorrect: false),
          Answer(
              answerText: 'Proper adjustment and secure mounting',
              isCorrect: true),
          Answer(answerText: 'Decorative aspects', isCorrect: false),
          Answer(answerText: 'Presence of decals or stickers', isCorrect: false)
        ],
        explanation:
            'Mirrors should be properly adjusted and securely mounted to ensure maximum visibility and safety.'),
    Question(
        questionText:
            'How should a driver inspect the vehicle’s brakes during a pre-trip inspection?',
        answers: [
          Answer(
              answerText: 'By listening for noises while driving',
              isCorrect: false),
          Answer(
              answerText:
                  'By visually inspecting brake components and checking for air pressure or hydraulic leaks',
              isCorrect: true),
          Answer(
              answerText: 'By measuring stopping distance', isCorrect: false),
          Answer(
              answerText: 'By checking the color of the brake fluid',
              isCorrect: false)
        ],
        explanation:
            'Visual inspection of brake components and checking for any leaks in air pressure or hydraulic systems are essential during a pre-trip inspection.'),
    Question(
        questionText:
            'Why is it necessary to check the exhaust system during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'To assess engine performance', isCorrect: false),
          Answer(
              answerText: 'To ensure it is not emitting excessive noise',
              isCorrect: false),
          Answer(
              answerText: 'To prevent carbon monoxide poisoning and leaks',
              isCorrect: true),
          Answer(
              answerText: 'To verify compliance with emission standards',
              isCorrect: false)
        ],
        explanation:
            'The exhaust system should be checked to prevent carbon monoxide poisoning and to ensure there are no leaks.'),
    Question(
        questionText:
            'What is the significance of inspecting the coupling devices in a pre-trip inspection?',
        answers: [
          Answer(
              answerText: 'To check the vehicle’s aesthetic appeal',
              isCorrect: false),
          Answer(
              answerText: 'To ensure they are properly secured and aligned',
              isCorrect: true),
          Answer(answerText: 'To verify the color coding', isCorrect: false),
          Answer(
              answerText: 'To calculate the towing capacity', isCorrect: false)
        ],
        explanation:
            'Inspecting coupling devices is important to ensure they are properly secured and aligned, preventing trailer detachment.'),
    Question(
        questionText:
            'During a pre-trip inspection, what should a driver verify about the vehicle’s steering mechanism?',
        answers: [
          Answer(answerText: 'The steering wheel color', isCorrect: false),
          Answer(
              answerText: 'Ease of turning the steering wheel',
              isCorrect: false),
          Answer(
              answerText: 'Absence of excessive play and secure mounting',
              isCorrect: true),
          Answer(
              answerText: 'The presence of power steering fluid',
              isCorrect: false)
        ],
        explanation:
            'The driver should check for excessive play in the steering mechanism and ensure it is securely mounted.'),
    Question(
        questionText:
            'What should a driver inspect in the cargo area during a pre-trip inspection?',
        answers: [
          Answer(
              answerText: 'Cargo arrangement for aesthetic purposes',
              isCorrect: false),
          Answer(
              answerText: 'Proper cargo securement and absence of hazards',
              isCorrect: true),
          Answer(answerText: 'The color of the cargo', isCorrect: false),
          Answer(answerText: 'The brand of the cargo', isCorrect: false)
        ],
        explanation:
            'In the cargo area, proper securement and the absence of hazards are crucial for safety.'),
    Question(
        questionText:
            'Why is it important to check the horn during a pre-trip inspection?',
        answers: [
          Answer(
              answerText: 'To ensure it plays different tunes',
              isCorrect: false),
          Answer(answerText: 'To test its loudness', isCorrect: false),
          Answer(
              answerText: 'To make sure it is functional for warning purposes',
              isCorrect: true),
          Answer(
              answerText: 'To use it as a communication device with passengers',
              isCorrect: false)
        ],
        explanation:
            'The horn should be checked to ensure it is functional and can be used as a warning device.'),
    Question(
        questionText:
            'During a pre-trip inspection, what is important to check about the vehicle’s windshield wipers?',
        answers: [
          Answer(answerText: 'Speed settings', isCorrect: false),
          Answer(answerText: 'Color and design', isCorrect: false),
          Answer(
              answerText: 'Operational condition and fluid levels',
              isCorrect: true),
          Answer(answerText: 'Brand and model', isCorrect: false)
        ],
        explanation:
            'It’s important to check the operational condition of windshield wipers and fluid levels.'),
    Question(
        questionText:
            'What should a driver check regarding the vehicle’s fuel system during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'Fuel brand preference', isCorrect: false),
          Answer(
              answerText: 'Fuel level and absence of leaks', isCorrect: true),
          Answer(answerText: 'Fuel color and odor', isCorrect: false),
          Answer(answerText: 'Type of fuel used', isCorrect: false)
        ],
        explanation:
            'The fuel system should be inspected for adequate fuel levels and to ensure there are no leaks.'),
    Question(
        questionText:
            'How should a driver inspect the vehicle’s electrical system during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'By checking the sound system', isCorrect: false),
          Answer(
              answerText:
                  'By ensuring all electrical connections are secure and batteries are properly mounted',
              isCorrect: true),
          Answer(
              answerText: 'By testing the vehicle’s GPS system',
              isCorrect: false),
          Answer(
              answerText: 'By checking the interior lighting only',
              isCorrect: false)
        ],
        explanation:
            'All electrical connections should be secure, and batteries should be properly mounted in the electrical system.'),
    Question(
        questionText:
            'Why is it necessary to inspect the air lines and compressor during a pre-trip inspection?',
        answers: [
          Answer(
              answerText: 'To ensure the air conditioner works',
              isCorrect: false),
          Answer(
              answerText: 'To check for air pressure stability and leaks',
              isCorrect: true),
          Answer(
              answerText: 'To verify the color coding of the lines',
              isCorrect: false),
          Answer(
              answerText: 'To assess the noise level of the compressor',
              isCorrect: false)
        ],
        explanation:
            'Inspecting the air lines and compressor is necessary to ensure air pressure stability and check for any leaks.'),
    Question(
        questionText:
            'What should be checked regarding the vehicle’s seatbelts during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'Color and material quality', isCorrect: false),
          Answer(
              answerText: 'Ease of fastening and unfastening',
              isCorrect: false),
          Answer(answerText: 'Functionality and condition', isCorrect: true),
          Answer(
              answerText: 'Availability of seatbelts in all seats',
              isCorrect: false)
        ],
        explanation:
            'Seatbelts should be inspected for their functionality and overall condition.'),
    Question(
        questionText:
            'During a pre-trip inspection, why is it important to check the vehicle’s body for damage?',
        answers: [
          Answer(
              answerText: 'To maintain the vehicle’s aesthetic appeal',
              isCorrect: false),
          Answer(
              answerText:
                  'To identify any damage that could affect the vehicle’s safety',
              isCorrect: true),
          Answer(
              answerText: 'To assess the need for a new paint job',
              isCorrect: false),
          Answer(
              answerText: 'To estimate the resale value of the vehicle',
              isCorrect: false)
        ],
        explanation:
            'Checking the vehicle’s body for damage is important to identify any issues that could affect its safety.'),
    Question(
        questionText:
            'What should be checked regarding the vehicle’s dashboard indicators during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'Brightness and color', isCorrect: false),
          Answer(
              answerText: 'Proper functioning and absence of warning lights',
              isCorrect: true),
          Answer(answerText: 'Size and position', isCorrect: false),
          Answer(answerText: 'Customization options', isCorrect: false)
        ],
        explanation:
            'The dashboard indicators should be checked for proper functioning and to ensure no warning lights are on.'),
    Question(
        questionText:
            'During a pre-trip inspection, how should a driver test the vehicle’s parking brake?',
        answers: [
          Answer(answerText: 'By driving at low speed', isCorrect: false),
          Answer(
              answerText:
                  'By applying the brake and checking for vehicle movement',
              isCorrect: true),
          Answer(
              answerText: 'By measuring the distance the vehicle rolls',
              isCorrect: false),
          Answer(
              answerText: 'By listening for the brake sound', isCorrect: false)
        ],
        explanation:
            'The parking brake should be tested by applying it and then checking to ensure the vehicle does not move.'),
    Question(
        questionText:
            'Why is it important to check the vehicle’s air filters during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'To improve fuel economy', isCorrect: false),
          Answer(
              answerText: 'To ensure proper air flow to the engine',
              isCorrect: true),
          Answer(answerText: 'For aesthetic reasons', isCorrect: false),
          Answer(answerText: 'To reduce the risk of fires', isCorrect: false)
        ],
        explanation:
            'Checking air filters is important to ensure proper air flow to the engine, which affects its performance.'),
    Question(
        questionText:
            'What should be inspected in the vehicle’s undercarriage during a pre-trip check?',
        answers: [
          Answer(answerText: 'Ground clearance', isCorrect: false),
          Answer(
              answerText: 'Absence of leaks, damage, and loose components',
              isCorrect: true),
          Answer(answerText: 'Paint condition', isCorrect: false),
          Answer(answerText: 'Decoration and customization', isCorrect: false)
        ],
        explanation:
            'The undercarriage should be inspected for leaks, damage, and any loose components.'),
    Question(
        questionText:
            'How should a driver inspect the vehicle’s cooling system during a pre-trip inspection?',
        answers: [
          Answer(
              answerText: 'By checking the temperature gauge only',
              isCorrect: false),
          Answer(
              answerText:
                  'By ensuring the coolant level is adequate and there are no leaks',
              isCorrect: true),
          Answer(
              answerText: 'By assessing the color of the coolant',
              isCorrect: false),
          Answer(answerText: 'By tasting the coolant', isCorrect: false)
        ],
        explanation:
            'The cooling system should be checked to ensure the coolant level is adequate and there are no leaks.'),
    Question(
        questionText:
            'Why is it necessary to inspect the vehicle’s drive shaft during a pre-trip inspection?',
        answers: [
          Answer(
              answerText: 'To check its color and cleanliness',
              isCorrect: false),
          Answer(
              answerText: 'To ensure it is not damaged or excessively worn',
              isCorrect: true),
          Answer(
              answerText: 'To determine if it needs lubrication',
              isCorrect: false),
          Answer(
              answerText: 'To verify its length and alignment',
              isCorrect: false)
        ],
        explanation:
            'Inspecting the drive shaft is important to ensure it is not damaged or excessively worn, which could lead to mechanical issues.'),
    Question(
        questionText:
            'During a pre-trip inspection, how should a driver check the vehicle’s shock absorbers?',
        answers: [
          Answer(
              answerText: 'By pressing down on the vehicle’s bumper',
              isCorrect: false),
          Answer(
              answerText: 'By visually inspecting for leaks and damage',
              isCorrect: true),
          Answer(
              answerText: 'By listening for noises while driving',
              isCorrect: false),
          Answer(
              answerText: 'By measuring the height of the vehicle',
              isCorrect: false)
        ],
        explanation:
            'Shock absorbers should be visually inspected for leaks and damage.'),
    Question(
        questionText:
            'What should a driver check regarding the vehicle’s battery during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'Battery age and warranty', isCorrect: false),
          Answer(
              answerText: 'Secure mounting and clean connections',
              isCorrect: true),
          Answer(answerText: 'Battery color and size', isCorrect: false),
          Answer(answerText: 'Brand and type', isCorrect: false)
        ],
        explanation:
            'The battery should be checked for secure mounting and clean connections to ensure proper electrical functionality.'),
    Question(
        questionText:
            'Why is it important to inspect the vehicle’s hoses and clamps?',
        answers: [
          Answer(
              answerText: 'To check if they match in color', isCorrect: false),
          Answer(
              answerText:
                  'To ensure they are securely attached and free of leaks',
              isCorrect: true),
          Answer(
              answerText: 'For compliance with aesthetic standards',
              isCorrect: false),
          Answer(
              answerText: 'To determine the need for replacement based on age',
              isCorrect: false)
        ],
        explanation:
            'Inspecting hoses and clamps ensures they are securely attached and free of leaks, which is vital for the vehicle’s fluid systems.'),
    Question(
        questionText:
            'How should the vehicle’s steering fluid be checked during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'By turning the steering wheel', isCorrect: false),
          Answer(
              answerText: 'By checking the fluid level and looking for leaks',
              isCorrect: true),
          Answer(answerText: 'By listening for noises', isCorrect: false),
          Answer(
              answerText: 'By measuring the fluid’s viscosity',
              isCorrect: false)
        ],
        explanation:
            'Steering fluid should be checked for proper fluid level and any signs of leaks.'),
    Question(
        questionText:
            'During a pre-trip inspection, what should a driver check about the vehicle’s transmission?',
        answers: [
          Answer(answerText: 'Transmission color', isCorrect: false),
          Answer(
              answerText: 'Fluid level and absence of leaks', isCorrect: true),
          Answer(answerText: 'The type of transmission', isCorrect: false),
          Answer(answerText: 'Ease of gear shifting', isCorrect: false)
        ],
        explanation:
            'The transmission should be checked for proper fluid level and to ensure there are no leaks.'),
    Question(
        questionText:
            'What should a driver inspect regarding the vehicle’s exhaust system during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'Sound level', isCorrect: false),
          Answer(
              answerText: 'Proper routing and secure mounting',
              isCorrect: true),
          Answer(answerText: 'Color of exhaust fumes', isCorrect: false),
          Answer(answerText: 'Exhaust system brand', isCorrect: false)
        ],
        explanation:
            'The exhaust system should be inspected for proper routing, secure mounting, and absence of leaks or damage.'),
    Question(
        questionText:
            'How should a driver check the vehicle’s braking system during a pre-trip inspection?',
        answers: [
          Answer(
              answerText: 'By driving at high speed and braking suddenly',
              isCorrect: false),
          Answer(
              answerText:
                  'By checking for proper pedal resistance and air pressure or brake fluid levels',
              isCorrect: true),
          Answer(
              answerText: 'By listening for any unusual sounds',
              isCorrect: false),
          Answer(
              answerText: 'By visually inspecting the brake pads only',
              isCorrect: false)
        ],
        explanation:
            'The braking system should be checked for proper pedal resistance and adequate air pressure or brake fluid levels.'),
    Question(
        questionText:
            'Why is it important to inspect the vehicle’s seats and seatbelts during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'To adjust for comfort', isCorrect: false),
          Answer(
              answerText: 'To ensure they are secure and functional',
              isCorrect: true),
          Answer(
              answerText: 'To comply with interior design standards',
              isCorrect: false),
          Answer(
              answerText: 'To check for fashionable styles', isCorrect: false)
        ],
        explanation:
            'Inspecting seats and seatbelts is important to ensure they are secure and functional for safety reasons.'),
    Question(
        questionText:
            'During a pre-trip inspection, how should a driver inspect the vehicle’s lights and reflectors?',
        answers: [
          Answer(answerText: 'By checking their color', isCorrect: false),
          Answer(
              answerText:
                  'By ensuring they are clean, functional, and properly mounted',
              isCorrect: true),
          Answer(
              answerText: 'By measuring the light intensity', isCorrect: false),
          Answer(
              answerText: 'By checking if they are automatic', isCorrect: false)
        ],
        explanation:
            'Lights and reflectors should be inspected to ensure they are clean, functional, and properly mounted.'),
    Question(
        questionText:
            'What should a driver look for when inspecting the vehicle’s tires during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'Tire brand and age', isCorrect: false),
          Answer(
              answerText:
                  'Proper inflation, tread depth, and absence of damage',
              isCorrect: true),
          Answer(
              answerText: 'Color and cleanliness of the tires',
              isCorrect: false),
          Answer(answerText: 'The type of tire tread', isCorrect: false)
        ],
        explanation:
            'Tires should be inspected for proper inflation, adequate tread depth, and absence of damage or wear.'),
    Question(
        questionText:
            'How should the vehicle’s windshield and mirrors be checked during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'For their size and shape', isCorrect: false),
          Answer(
              answerText: 'For cleanliness, damage, and proper adjustment',
              isCorrect: true),
          Answer(answerText: 'By checking the tint level', isCorrect: false),
          Answer(
              answerText: 'For brand and model compatibility', isCorrect: false)
        ],
        explanation:
            'Windshields and mirrors should be checked for cleanliness, damage, and proper adjustment.'),
    Question(
        questionText:
            'Why is it necessary to check the vehicle’s emergency equipment during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'To comply with traffic laws', isCorrect: false),
          Answer(
              answerText: 'To ensure it is present, functional, and accessible',
              isCorrect: true),
          Answer(answerText: 'For inventory purposes', isCorrect: false),
          Answer(
              answerText: 'To use it during the pre-trip inspection',
              isCorrect: false)
        ],
        explanation:
            'Emergency equipment must be checked to ensure it is present, functional, and easily accessible in case of an emergency.'),
    Question(
        questionText:
            'During a pre-trip inspection, what should a driver check about the vehicle’s fluid levels?',
        answers: [
          Answer(answerText: 'Their color and odor', isCorrect: false),
          Answer(
              answerText:
                  'They are at appropriate levels and there are no leaks',
              isCorrect: true),
          Answer(answerText: 'The brand of fluids used', isCorrect: false),
          Answer(answerText: 'The temperature of the fluids', isCorrect: false)
        ],
        explanation:
            'Fluid levels should be checked to ensure they are at the appropriate levels and there are no leaks.'),
    Question(
        questionText:
            'How should a driver check the vehicle’s suspension system during a pre-trip inspection?',
        answers: [
          Answer(answerText: 'By driving over speed bumps', isCorrect: false),
          Answer(
              answerText: 'By visually inspecting for damage or wear',
              isCorrect: true),
          Answer(answerText: 'By listening for noises', isCorrect: false),
          Answer(
              answerText: 'By measuring the height of the vehicle',
              isCorrect: false)
        ],
        explanation:
            'The suspension system should be visually inspected for any signs of damage, wear, or leaks.'),
  ];

  void onSelectAnswer(int index) {
    setState(() {
      showNextButton = true;
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        showNextButton = false;
      });
    } else {
      // TODO: Handle the end of the test
      print('Test Completed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CDL Permit Test', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF2797FF),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Displaying the current question number
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                'Question ${currentQuestionIndex + 1}/${questions.length}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            QuestionWidget(
              key: ValueKey(
                  currentQuestionIndex), // Ensure the widget updates with new question
              question: questions[currentQuestionIndex],
              onSelectAnswer: onSelectAnswer,
            ),
            if (showNextButton)
              ElevatedButton(
                onPressed: nextQuestion,
                child: Text('Next'),
              ),
          ],
        ),
      ),
    );
  }
}
