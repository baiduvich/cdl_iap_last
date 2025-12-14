// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

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

class GeneralKnowledgeTest2024 extends StatefulWidget {
  const GeneralKnowledgeTest2024({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _GeneralKnowledgeTest2024State createState() =>
      _GeneralKnowledgeTest2024State();
}

class _GeneralKnowledgeTest2024State extends State<GeneralKnowledgeTest2024> {
  int currentQuestionIndex = 0;
  bool showNextButton = false;

  final List<Question> questions = [
    Question(
      questionText: 'When should you first inspect your vehicle?',
      answers: [
        Answer(
            answerText: 'Before starting the trip (pre-inspection)',
            isCorrect: true),
        Answer(answerText: 'Every day', isCorrect: false),
        Answer(
            answerText:
                'None of these. Inspection is not the responsibility of the driver; it will be done by a certified mechanic.',
            isCorrect: false),
        Answer(answerText: 'Whenever a light comes on', isCorrect: false),
      ],
      explanation:
          'A pre-trip inspection ensures the vehicle is safe and roadworthy before starting the journey.', // Add explanation here
    ),
    Question(
      questionText:
          'During a trip, how often should your vehicle be inspected?',
      answers: [
        Answer(answerText: 'every hour', isCorrect: false),
        Answer(
            answerText:
                'within the first 50 miles and every 150 miles or every 3 hours',
            isCorrect: true),
        Answer(
            answerText: 'whenever a light comes on or every 12 hours',
            isCorrect: false),
        Answer(answerText: 'every planned stop', isCorrect: false),
      ],
      explanation:
          'Your vehicle should be inspected within the first 50 miles and also every 150 miles or every 3 hours, whichever comes first. Gauges should be monitored, but do not wait until one comes on to inspect the vehicle.', // Add explanation here
    ),
    Question(
      questionText:
          'Of the following, which are the most critical vehicle items you should check when doing an inspection?',
      answers: [
        Answer(answerText: 'Accuracy of supplies in cargo', isCorrect: false),
        Answer(answerText: 'Tires, brakes, lights', isCorrect: true),
        Answer(answerText: 'Personal items', isCorrect: false),
        Answer(answerText: 'Food supply', isCorrect: false),
      ],
      explanation:
          'Among several other things, critical things to check on vehicle inspection include: tires (pressure, tread), brakes and lights (make sure they all turn on/off when needed).', // Add explanation here
    ),
    Question(
      questionText: 'What is the correct amount of tread needed on your tires?',
      answers: [
        Answer(
            answerText: 'A minimum of 1/2 inch on front tires',
            isCorrect: false),
        Answer(
            answerText: 'A minimum of 1/2 inch on all tires', isCorrect: false),
        Answer(
            answerText: 'At least 4/32 of an inch on front wheels',
            isCorrect: true),
        Answer(
            answerText: '4/32 of an inch on all tires except the front tires',
            isCorrect: false),
      ],
      explanation:
          'Tire tread on the front tires of your vehicle should be at least 4/32 of an inch. The other tires can have 2/32 inch tread.', // Add explanation here
    ),
    Question(
      questionText:
          'What is the greatest amount of play that should be in your steering wheel?',
      answers: [
        Answer(answerText: 'None', isCorrect: false),
        Answer(answerText: '1 inch/10 degrees', isCorrect: false),
        Answer(answerText: '5 inches/5 degrees', isCorrect: false),
        Answer(answerText: '2 inches/10 degrees', isCorrect: true),
      ],
      explanation:
          'There should be no more than 2 inches of play in your steering wheel to avoid problems.', // Add explanation here
    ),
    Question(
      questionText:
          'When performing a pre-trip inspection, why is it a good idea to do it exactly the same way every time?',
      answers: [
        Answer(
            answerText: 'You will be less likely to forget something.',
            isCorrect: true),
        Answer(
            answerText:
                'The law requires you to do it the same way every time.',
            isCorrect: false),
        Answer(
            answerText: 'Most companies requires you to do so.',
            isCorrect: false),
        Answer(
            answerText:
                'You should not do it the same way every time; this may make you too comfortable in your inspection.',
            isCorrect: false),
      ],
      explanation:
          'It is important to maintain the same routine every time you preform a pretrip vehicle inspection because you are least likely to forget something, especially when it is late at night and/or you are working while tired..', // Add explanation here
    ),
    Question(
      questionText: 'What is a Vehicle Inspection Report?',
      answers: [
        Answer(
            answerText:
                'A signed statement that says you checked the vehicle that day.',
            isCorrect: false),
        Answer(
            answerText:
                'A report written by the driver that notes the condition of the truck and any items that may need to be repaired.',
            isCorrect: true),
        Answer(
            answerText:
                'A report written by the vehicle owner that notes the condition of the truck and any items that may need to be repaired.',
            isCorrect: false),
        Answer(
            answerText:
                'A report you receive after you have the vehicle serviced.',
            isCorrect: false),
      ],
      explanation:
          'The Vehicle Inspection Report is a daily log that drivers keep. It includes information regarding the vehicle such as problems and inspections.', // Add explanation here
    ),
    Question(
      questionText:
          'If a vehicle is equipped with circuit breakers, should you carry spare fuses?',
      answers: [
        Answer(
            answerText: 'Carrying extra equipment is the driver’s preference.',
            isCorrect: false),
        Answer(answerText: 'No, this is not necessary.', isCorrect: true),
        Answer(answerText: 'Yes, this is mandatory.', isCorrect: false),
        Answer(
            answerText: 'No, every vehicle comes with an extra set.',
            isCorrect: false),
      ],
      explanation:
          'If your vehicle is equipped with circuit breakers, that means it doesn’t use fuses, so you do not need to carry spare electrical fuses.', // Add explanation here
    ),
    Question(
      questionText: 'What should you do if you start to skid?',
      answers: [
        Answer(answerText: 'Accelerate quickly', isCorrect: false),
        Answer(
            answerText: 'Steer in the direction of the skid', isCorrect: true),
        Answer(answerText: 'Slam on the brakes', isCorrect: false),
        Answer(
            answerText: 'Turn the steering wheel rapidly back and forth',
            isCorrect: false),
      ],
      explanation:
          'When you start to skid, you should steer in the direction of the skid. This helps regain control of the vehicle.',
    ),
    Question(
      questionText: 'What is the main reason for doing a pre-trip inspection?',
      answers: [
        Answer(
            answerText: 'To ensure the vehicle looks presentable',
            isCorrect: false),
        Answer(
            answerText: 'To check if the vehicle is safe for operation',
            isCorrect: true),
        Answer(
            answerText: 'To check for any mechanical issues', isCorrect: false),
        Answer(
            answerText: 'To make sure the vehicle is comfortable to drive',
            isCorrect: false),
      ],
      explanation:
          'The main purpose of a pre-trip inspection is to ensure the vehicle is safe to operate before hitting the road.',
    ),
    Question(
      questionText:
          'What is the proper following distance under ideal driving conditions?',
      answers: [
        Answer(
            answerText: '2 seconds behind the vehicle in front',
            isCorrect: false),
        Answer(
            answerText: '4 seconds behind the vehicle in front',
            isCorrect: false),
        Answer(
            answerText: '1 second behind the vehicle in front',
            isCorrect: false),
        Answer(
            answerText: '3 seconds behind the vehicle in front',
            isCorrect: true),
      ],
      explanation:
          'Under ideal conditions, maintaining a 3-second following distance provides a safe buffer zone.',
    ),
    Question(
      questionText: 'What is a Jake Brake and when should you use it?',
      answers: [
        Answer(
            answerText: 'A parking brake used at stop lights',
            isCorrect: false),
        Answer(
            answerText: 'An engine braking system used to slow down',
            isCorrect: true),
        Answer(answerText: 'A special brake for wet roads', isCorrect: false),
        Answer(
            answerText: 'A brake used only in emergencies', isCorrect: false),
      ],
      explanation:
          'A Jake Brake is an engine braking system that helps slow the vehicle, especially useful on long downhill grades to prevent overheating of service brakes.',
    ),
    Question(
      questionText: 'How often should you check your mirrors while driving?',
      answers: [
        Answer(answerText: 'Every 2-5 minutes', isCorrect: false),
        Answer(answerText: 'Only when changing lanes', isCorrect: false),
        Answer(answerText: 'Every 8-10 seconds', isCorrect: true),
        Answer(answerText: 'Only in heavy traffic', isCorrect: false),
      ],
      explanation:
          'Regularly checking your mirrors every 8-10 seconds helps maintain awareness of the traffic and environment around your vehicle.',
    ),
    Question(
      questionText: 'What should you do if your vehicle hydroplanes?',
      answers: [
        Answer(answerText: 'Accelerate to regain traction', isCorrect: false),
        Answer(answerText: 'Apply the brakes hard', isCorrect: false),
        Answer(
            answerText: 'Reduce speed gradually and steer straight',
            isCorrect: true),
        Answer(
            answerText: 'Turn the steering wheel back and forth',
            isCorrect: false),
      ],
      explanation:
          'If your vehicle hydroplanes, reduce speed gradually without braking hard and keep the steering wheel straight to regain control.',
    ),
    Question(
      questionText:
          'What is the legal blood alcohol concentration (BAC) limit for commercial drivers?',
      answers: [
        Answer(answerText: '0.02%', isCorrect: false),
        Answer(answerText: '0.08%', isCorrect: false),
        Answer(answerText: '0.04%', isCorrect: true),
        Answer(answerText: '0.00%', isCorrect: false),
      ],
      explanation:
          'The legal BAC limit for commercial drivers is 0.04%, which is stricter than for non-commercial drivers.',
    ),
    Question(
      questionText: 'What does "overdriving your headlights" mean?',
      answers: [
        Answer(
            answerText: 'Driving with high beams on all the time',
            isCorrect: false),
        Answer(
            answerText:
                'Driving too fast for your headlights to illuminate the road ahead',
            isCorrect: true),
        Answer(
            answerText: 'Using headlights during the daytime',
            isCorrect: false),
        Answer(
            answerText: 'Failing to turn on headlights at night',
            isCorrect: false),
      ],
      explanation:
          'Overdriving your headlights means driving so fast that your stopping distance exceeds the area illuminated by your headlights.',
    ),
    Question(
      questionText: 'What should you do when approaching a railroad crossing?',
      answers: [
        Answer(answerText: 'Speed up to cross quickly', isCorrect: false),
        Answer(answerText: 'Always stop before crossing', isCorrect: false),
        Answer(answerText: 'Slow down and check for trains', isCorrect: true),
        Answer(answerText: 'Continue at your current speed', isCorrect: false),
      ],
      explanation:
          'When approaching a railroad crossing, slow down, look and listen for trains, and be prepared to stop if necessary.',
    ),
    Question(
      questionText:
          'What is the function of an air supply pressure gauge in an air brake system?',
      answers: [
        Answer(
            answerText: 'Indicates when to apply the brakes', isCorrect: false),
        Answer(
            answerText: 'Shows the amount of air in the air tanks',
            isCorrect: true),
        Answer(
            answerText: 'Measures the speed of the vehicle', isCorrect: false),
        Answer(
            answerText: 'Indicates the temperature of the brakes',
            isCorrect: false),
      ],
      explanation:
          'The air supply pressure gauge shows the pressure in the air tanks, which is crucial for the operation of air brakes.',
    ),
    Question(
      questionText: 'What is the main purpose of using retarders?',
      answers: [
        Answer(answerText: 'To increase speed', isCorrect: false),
        Answer(
            answerText: 'To aid in braking and reduce brake wear',
            isCorrect: true),
        Answer(answerText: 'To improve fuel efficiency', isCorrect: false),
        Answer(answerText: 'To cool down the engine', isCorrect: false),
      ],
      explanation:
          'Retarders help slow the vehicle, aiding in braking and reducing wear on the brakes, especially on long or steep descents.',
    ),
    Question(
      questionText: 'When are you required to stop before a railroad crossing?',
      answers: [
        Answer(
            answerText: 'When the crossing is in a city or town',
            isCorrect: false),
        Answer(answerText: 'When hauling hazardous materials', isCorrect: true),
        Answer(answerText: 'Only when a train is visible', isCorrect: false),
        Answer(
            answerText: 'When the crossing has no barriers', isCorrect: false),
      ],
      explanation:
          'Drivers hauling hazardous materials must stop at all railroad crossings to ensure safety before proceeding.',
    ),
    Question(
      questionText: 'What is the minimum tread depth for front tires?',
      answers: [
        Answer(answerText: '1/32 inch', isCorrect: false),
        Answer(answerText: '2/32 inch', isCorrect: false),
        Answer(answerText: '4/32 inch', isCorrect: true),
        Answer(answerText: '5/32 inch', isCorrect: false),
      ],
      explanation:
          'The minimum tread depth for front tires on a commercial vehicle is 4/32 inch to ensure adequate traction and safety.',
    ),
    Question(
      questionText: 'What does a flashing red traffic light signify?',
      answers: [
        Answer(answerText: 'To proceed with caution', isCorrect: false),
        Answer(
            answerText: 'To stop completely, then proceed when safe',
            isCorrect: true),
        Answer(answerText: 'A malfunctioning traffic light', isCorrect: false),
        Answer(answerText: 'A pedestrian crossing', isCorrect: false),
      ],
      explanation:
          'A flashing red traffic light means the same as a stop sign: you must stop completely and proceed when it is safe.',
    ),
    Question(
      questionText:
          'What should you do if your brakes fail while driving downhill?',
      answers: [
        Answer(answerText: 'Continue to pump the brakes', isCorrect: false),
        Answer(answerText: 'Use the emergency brake', isCorrect: false),
        Answer(answerText: 'Look for an escape ramp or route', isCorrect: true),
        Answer(
            answerText: 'Increase your speed to reach the bottom quickly',
            isCorrect: false),
      ],
      explanation:
          'If your brakes fail on a downhill, look for an escape ramp or route to safely stop the vehicle.',
    ),
    Question(
      questionText: 'How often should cargo be inspected during a trip?',
      answers: [
        Answer(answerText: 'Every 100 miles', isCorrect: false),
        Answer(
            answerText: 'Every 3 hours or 150 miles, whichever comes first',
            isCorrect: true),
        Answer(answerText: 'Once halfway through the trip', isCorrect: false),
        Answer(
            answerText: 'Only at the start and end of the trip',
            isCorrect: false),
      ],
      explanation:
          'Cargo should be inspected every 3 hours or 150 miles, and after every break you take during driving, to ensure it is secure.',
    ),
    Question(
      questionText: 'What is the proper way to hold a steering wheel?',
      answers: [
        Answer(
            answerText: 'With both hands at the top of the wheel',
            isCorrect: false),
        Answer(
            answerText: 'With one hand at the bottom of the wheel',
            isCorrect: false),
        Answer(
            answerText: 'With both hands on opposite sides of the wheel',
            isCorrect: true),
        Answer(
            answerText:
                'With one hand on the wheel and one hand on the gear shift',
            isCorrect: false),
      ],
      explanation:
          'The proper way to hold a steering wheel is with both hands on opposite sides of the wheel for maximum control.',
    ),
    Question(
      questionText:
          'What is the first thing you should do if your vehicle starts to hydroplane?',
      answers: [
        Answer(answerText: 'Brake hard immediately', isCorrect: false),
        Answer(answerText: 'Turn the steering wheel sharply', isCorrect: false),
        Answer(answerText: 'Ease off the accelerator', isCorrect: true),
        Answer(
            answerText: 'Increase speed to regain traction', isCorrect: false),
      ],
      explanation:
          'If your vehicle starts to hydroplane, the first thing to do is ease off the accelerator to reduce speed and regain traction.',
    ),
    Question(
      questionText: 'What is "off-tracking" or "cheating" when turning?',
      answers: [
        Answer(answerText: 'Turning at a very slow speed', isCorrect: false),
        Answer(
            answerText:
                'The rear wheels following a tighter path than the front wheels',
            isCorrect: true),
        Answer(answerText: 'Using two lanes to turn', isCorrect: false),
        Answer(
            answerText: 'Turning with the emergency brakes on',
            isCorrect: false),
      ],
      explanation:
          'Off-tracking or cheating occurs when turning, where the rear wheels follow a tighter path than the front wheels, common in long vehicles.',
    ),
    Question(
      questionText:
          'What is the function of an Anti-Lock Braking System (ABS)?',
      answers: [
        Answer(
            answerText: 'To lock the brakes in case of an emergency',
            isCorrect: false),
        Answer(
            answerText: 'To prevent the brakes from locking up',
            isCorrect: true),
        Answer(
            answerText: 'To increase the vehicle’s braking power',
            isCorrect: false),
        Answer(
            answerText: 'To automatically brake at stop signs',
            isCorrect: false),
      ],
      explanation:
          'The function of an ABS is to prevent the brakes from locking up, maintaining steering control during hard braking.',
    ),
    Question(
      questionText: 'What should you do when a tire blows out?',
      answers: [
        Answer(answerText: 'Brake immediately to stop', isCorrect: false),
        Answer(
            answerText: 'Maintain speed and steer straight', isCorrect: true),
        Answer(
            answerText: 'Turn on your emergency flashers and drive slowly',
            isCorrect: false),
        Answer(
            answerText: 'Immediately steer to the side of the road',
            isCorrect: false),
      ],
      explanation:
          'When a tire blows out, you should maintain speed and steer straight to keep control, then slow down gradually.',
    ),
    Question(
      questionText:
          'Which of the following is not a proper use of vehicle lights?',
      answers: [
        Answer(
            answerText:
                'Flashing your lights to signal another driver to proceed',
            isCorrect: true),
        Answer(
            answerText: 'Using low beams in foggy conditions',
            isCorrect: false),
        Answer(
            answerText: 'Turning on headlights during low visibility',
            isCorrect: false),
        Answer(
            answerText:
                'Using hazard lights when stopped on the side of the road',
            isCorrect: false),
      ],
      explanation:
          'Flashing your lights to signal other drivers to proceed is not a recommended use, as it may cause confusion or accidents.',
    ),
    Question(
      questionText:
          'What is the main use of side mirrors on a commercial vehicle?',
      answers: [
        Answer(
            answerText: 'To check blind spots when turning', isCorrect: true),
        Answer(
            answerText: 'To view vehicles directly behind you',
            isCorrect: false),
        Answer(answerText: 'For aesthetic purposes', isCorrect: false),
        Answer(answerText: 'To check the condition of cargo', isCorrect: false),
      ],
      explanation:
          'Side mirrors on a commercial vehicle are primarily used to check blind spots, especially when turning or changing lanes.',
    ),
    Question(
      questionText:
          'What does it mean when you see amber lights flashing at the rear of a school bus?',
      answers: [
        Answer(
            answerText: 'The bus is stopping to load or unload children',
            isCorrect: true),
        Answer(answerText: 'The bus is broken down', isCorrect: false),
        Answer(answerText: 'The bus is turning', isCorrect: false),
        Answer(answerText: 'The bus is reversing', isCorrect: false),
      ],
      explanation:
          'Amber lights flashing at the rear of a school bus indicate it is stopping to load or unload children, and drivers should prepare to stop.',
    ),
    Question(
      questionText:
          'What should you do if an aggressive driver is following you too closely?',
      answers: [
        Answer(
            answerText: 'Speed up to increase the distance', isCorrect: false),
        Answer(answerText: 'Brake sharply to warn them', isCorrect: false),
        Answer(
            answerText: 'Maintain your speed and keep a steady course',
            isCorrect: true),
        Answer(
            answerText: 'Pull over and confront the driver', isCorrect: false),
      ],
      explanation:
          'If an aggressive driver is following you too closely, maintain your speed and keep a steady course, allowing them to pass safely.',
    ),
    Question(
      questionText: 'What is black ice?',
      answers: [
        Answer(
            answerText: 'Ice covered with dirt and debris', isCorrect: false),
        Answer(
            answerText: 'A thin layer of transparent ice on the roadway',
            isCorrect: true),
        Answer(answerText: 'Frozen diesel fuel on the road', isCorrect: false),
        Answer(
            answerText: 'Asphalt that has become extremely cold',
            isCorrect: false),
      ],
      explanation:
          'Black ice is a thin, transparent layer of ice on the roadway that can be very dangerous because it is hard to see.',
    ),
    Question(
      questionText: 'Why is it important to distribute cargo evenly?',
      answers: [
        Answer(answerText: 'To make unloading easier', isCorrect: false),
        Answer(answerText: 'To prevent damage to the cargo', isCorrect: false),
        Answer(
            answerText: 'To maintain vehicle stability and control',
            isCorrect: true),
        Answer(
            answerText: 'To comply with weight station regulations',
            isCorrect: false),
      ],
      explanation:
          'Evenly distributing cargo is crucial for maintaining vehicle stability and control, especially when turning or stopping.',
    ),
    Question(
      questionText: 'What should you do if you encounter fog while driving?',
      answers: [
        Answer(answerText: 'Turn on your high beams', isCorrect: false),
        Answer(
            answerText: 'Use your low beam headlights and fog lights',
            isCorrect: true),
        Answer(
            answerText: 'Continue driving at your normal speed',
            isCorrect: false),
        Answer(
            answerText: 'Pull over and wait for the fog to clear',
            isCorrect: false),
      ],
      explanation:
          'In foggy conditions, use your low beam headlights and fog lights to improve visibility; high beams can reflect off the fog and decrease visibility.',
    ),
    Question(
      questionText: 'When is it necessary to downshift?',
      answers: [
        Answer(answerText: 'Before going up a hill', isCorrect: true),
        Answer(
            answerText: 'When the engine is making a loud noise',
            isCorrect: false),
        Answer(answerText: 'Only when carrying heavy cargo', isCorrect: false),
        Answer(answerText: 'Before making a right turn', isCorrect: false),
      ],
      explanation:
          'Downshifting before going up a hill helps maintain power and prevent the vehicle from stalling or struggling on the incline.',
    ),
    Question(
      questionText:
          'What is the proper way to secure a parked trailer without a tractor?',
      answers: [
        Answer(
            answerText: 'Leave it in neutral with the parking brakes off',
            isCorrect: false),
        Answer(
            answerText: 'Chock the wheels and lock the trailer brakes',
            isCorrect: true),
        Answer(answerText: 'Leave the landing gear up', isCorrect: false),
        Answer(
            answerText: 'Park it on a slope for easier pickup',
            isCorrect: false),
      ],
      explanation:
          'When parking a trailer without a tractor, you should chock the wheels and lock the trailer brakes to prevent it from rolling.',
    ),
    Question(
      questionText: 'What is the function of the service brake?',
      answers: [
        Answer(
            answerText: 'To control the speed of the vehicle', isCorrect: true),
        Answer(answerText: 'To park the vehicle', isCorrect: false),
        Answer(answerText: 'To balance the cargo load', isCorrect: false),
        Answer(answerText: 'To signal other drivers', isCorrect: false),
      ],
      explanation:
          'The service brake is used to control the speed of the vehicle and bring it to a stop during normal driving conditions.',
    ),
    Question(
      questionText:
          'What should you do if you encounter a traffic control signal that is not working?',
      answers: [
        Answer(
            answerText: 'Drive through the intersection quickly',
            isCorrect: false),
        Answer(
            answerText: 'Stop before entering the intersection',
            isCorrect: true),
        Answer(answerText: 'Continue as if nothing is wrong', isCorrect: false),
        Answer(
            answerText: 'Only stop if there is other traffic',
            isCorrect: false),
      ],
      explanation:
          'If a traffic control signal is not working, treat the intersection as a four-way stop, stopping before entering and proceeding when it is safe.',
    ),
    Question(
      questionText: 'What should be the primary focus of pre-trip inspections?',
      answers: [
        Answer(
            answerText: 'Checking the comfort of the cabin', isCorrect: false),
        Answer(
            answerText: 'Ensuring the vehicle is fuel-efficient',
            isCorrect: false),
        Answer(
            answerText: 'Identifying potential safety hazards',
            isCorrect: true),
        Answer(
            answerText: 'Making sure the vehicle is clean', isCorrect: false),
      ],
      explanation:
          'The primary focus of pre-trip inspections is to identify potential safety hazards that could affect the vehicle\'s safe operation.',
    ),
    Question(
      questionText: 'How should you react to a tailgater?',
      answers: [
        Answer(
            answerText:
                'Speed up to put distance between you and the tailgater',
            isCorrect: false),
        Answer(
            answerText: 'Brake sharply to discourage tailgating',
            isCorrect: false),
        Answer(
            answerText:
                'Maintain your speed and allow extra space in front of your vehicle',
            isCorrect: true),
        Answer(answerText: 'Wave them to pass you', isCorrect: false),
      ],
      explanation:
          'When dealing with a tailgater, maintain your speed and increase the space in front of your vehicle to allow for safe stopping.',
    ),
    Question(
      questionText:
          'Which of these is not a reason for a commercial driver to be disqualified?',
      answers: [
        Answer(
            answerText: 'Exceeding the speed limit by 5 mph', isCorrect: true),
        Answer(
            answerText: 'Driving under the influence of alcohol',
            isCorrect: false),
        Answer(
            answerText: 'Leaving the scene of an accident', isCorrect: false),
        Answer(
            answerText: 'Committing a felony involving a vehicle',
            isCorrect: false),
      ],
      explanation:
          'While serious violations like DUI, fleeing an accident, or committing a felony with a vehicle can lead to disqualification, exceeding the speed limit by 5 mph typically does not.',
    ),
    Question(
      questionText:
          'When is it acceptable to drive a commercial vehicle without a seat belt?',
      answers: [
        Answer(answerText: 'When driving at low speeds', isCorrect: false),
        Answer(answerText: 'Never', isCorrect: true),
        Answer(answerText: 'When making short trips', isCorrect: false),
        Answer(
            answerText: 'If the seat belt is uncomfortable', isCorrect: false),
      ],
      explanation:
          'It is never acceptable to operate a commercial vehicle without wearing a seat belt, regardless of speed or distance.',
    ),
    Question(
      questionText: 'How do you test hydraulic brakes for leaks?',
      answers: [
        Answer(
            answerText:
                'By pumping the brake pedal three times then applying firm pressure for five seconds',
            isCorrect: true),
        Answer(
            answerText: 'By slamming on the brakes at a high speed',
            isCorrect: false),
        Answer(
            answerText: 'By listening for leaks while the engine is off',
            isCorrect: false),
        Answer(
            answerText: 'By inspecting the brake lines for visible damage',
            isCorrect: false),
      ],
      explanation:
          'To test hydraulic brakes for leaks, pump the brake pedal three times, then apply firm pressure and hold for five seconds. The pedal should not move (sink) if there are no leaks.',
    ),
    Question(
      questionText: 'What does "gross combination weight rating" (GCWR) mean?',
      answers: [
        Answer(
            answerText:
                'The weight of the vehicle when fully loaded with cargo',
            isCorrect: false),
        Answer(
            answerText:
                'The total weight of a powered unit, plus trailers, and the cargo',
            isCorrect: true),
        Answer(
            answerText: 'The maximum weight allowed on a single axle',
            isCorrect: false),
        Answer(
            answerText: 'The weight of the vehicle and trailer without cargo',
            isCorrect: false),
      ],
      explanation:
          'GCWR refers to the total weight of a powered unit, plus trailers, and the cargo, as specified by the manufacturer.',
    ),
    Question(
      questionText: 'What is an escape ramp?',
      answers: [
        Answer(
            answerText: 'A ramp for avoiding traffic jams', isCorrect: false),
        Answer(
            answerText:
                'A safety feature on highways for vehicles to stop safely when out of control',
            isCorrect: true),
        Answer(
            answerText: 'A ramp used exclusively by emergency vehicles',
            isCorrect: false),
        Answer(answerText: 'A detour route', isCorrect: false),
      ],
      explanation:
          'An escape ramp is a safety feature on highways that allows vehicles, particularly those with brake failure, to stop safely when out of control.',
    ),
    Question(
      questionText:
          'What should a driver do when approaching a low clearance bridge?',
      answers: [
        Answer(
            answerText: 'Accelerate to pass under quickly', isCorrect: false),
        Answer(
            answerText: 'Ensure the vehicle can safely clear the height limit',
            isCorrect: true),
        Answer(answerText: 'Honk to warn others', isCorrect: false),
        Answer(answerText: 'Unload cargo to reduce height', isCorrect: false),
      ],
      explanation:
          'When approaching a low clearance bridge, a driver should ensure the vehicle can safely clear the height limit to avoid collisions with the bridge.',
    ),
    Question(
      questionText: 'What is the main purpose of hazard warning lights?',
      answers: [
        Answer(answerText: 'To signal when changing lanes', isCorrect: false),
        Answer(
            answerText: 'To warn others of a vehicle breakdown or hazard ahead',
            isCorrect: true),
        Answer(
            answerText: 'To use when driving in bad weather', isCorrect: false),
        Answer(answerText: 'For night time driving', isCorrect: false),
      ],
      explanation:
          'Hazard warning lights are primarily used to warn others of a vehicle breakdown or a hazard on the road ahead, requiring caution from other drivers.',
    ),
    Question(
      questionText:
          'What should you do if your accelerator gets stuck while driving?',
      answers: [
        Answer(
            answerText: 'Keep driving and try to unstick it', isCorrect: false),
        Answer(answerText: 'Turn off the engine immediately', isCorrect: false),
        Answer(
            answerText: 'Shift to neutral and apply the brakes',
            isCorrect: true),
        Answer(answerText: 'Pump the accelerator', isCorrect: false),
      ],
      explanation:
          'If your accelerator gets stuck, you should shift to neutral, apply the brakes, and guide your vehicle to a safe area to stop.',
    ),
    Question(
      questionText: 'How should you handle a front tire blowout?',
      answers: [
        Answer(answerText: 'Apply the brakes immediately', isCorrect: false),
        Answer(
            answerText: 'Steer gently in the opposite direction of the blowout',
            isCorrect: false),
        Answer(
            answerText: 'Maintain your lane and slow down gradually',
            isCorrect: true),
        Answer(answerText: 'Accelerate to maintain control', isCorrect: false),
      ],
      explanation:
          'In the event of a front tire blowout, maintain your lane, grip the steering wheel firmly, and slow down gradually before safely pulling off the road.',
    ),
    Question(
      questionText: 'What is the most effective way to deal with brake fade?',
      answers: [
        Answer(answerText: 'Increase your speed', isCorrect: false),
        Answer(answerText: 'Use the parking brake', isCorrect: false),
        Answer(answerText: 'Downshift and use engine braking', isCorrect: true),
        Answer(answerText: 'Pump the brakes repeatedly', isCorrect: false),
      ],
      explanation:
          'The most effective way to deal with brake fade is to downshift and use engine braking to reduce speed and allow the brakes to cool.',
    ),
    Question(
      questionText:
          'Why should drivers avoid using retarders in slippery conditions?',
      answers: [
        Answer(answerText: 'To save fuel', isCorrect: false),
        Answer(
            answerText: 'Retarders can cause the wheels to lock up',
            isCorrect: true),
        Answer(
            answerText: 'Retarders are less effective in wet conditions',
            isCorrect: false),
        Answer(answerText: 'To reduce noise pollution', isCorrect: false),
      ],
      explanation:
          'Using retarders on slippery surfaces can be dangerous because they can cause the drive wheels to lock up and lead to loss of control.',
    ),
    Question(
      questionText: 'What is the proper way to load a trailer?',
      answers: [
        Answer(
            answerText: 'Place the heaviest items at the rear',
            isCorrect: false),
        Answer(
            answerText: 'Distribute weight evenly across the axles',
            isCorrect: true),
        Answer(answerText: 'Stack items high for more space', isCorrect: false),
        Answer(
            answerText: 'Load heavier on the left side for balance',
            isCorrect: false),
      ],
      explanation:
          'Properly loading a trailer involves evenly distributing weight across the axles to maintain balance and stability of the vehicle.',
    ),
    Question(
      questionText: 'How can you reduce the risk of rollover?',
      answers: [
        Answer(answerText: 'By driving faster on curves', isCorrect: false),
        Answer(
            answerText: 'By keeping the cargo load low and spread out',
            isCorrect: true),
        Answer(answerText: 'By frequently changing lanes', isCorrect: false),
        Answer(
            answerText: 'By overloading one side of the trailer',
            isCorrect: false),
      ],
      explanation:
          'To reduce the risk of rollover, keep the cargo load low and spread out evenly to lower the center of gravity and increase stability.',
    ),
    Question(
      questionText: 'What should you do when driving in strong crosswinds?',
      answers: [
        Answer(answerText: 'Accelerate to improve stability', isCorrect: false),
        Answer(
            answerText: 'Reduce speed and steer against the wind',
            isCorrect: true),
        Answer(
            answerText: 'Open windows to reduce wind resistance',
            isCorrect: false),
        Answer(answerText: 'Drive in the center of the lane', isCorrect: false),
      ],
      explanation:
          'In strong crosswinds, reduce speed and steer slightly against the wind to maintain control and lane position.',
    ),
    Question(
      questionText:
          'What is the correct procedure for backing a commercial vehicle?',
      answers: [
        Answer(answerText: 'Back up as quickly as possible', isCorrect: false),
        Answer(
            answerText: 'Use only side mirrors for guidance', isCorrect: false),
        Answer(
            answerText: 'Back slowly, using a spotter if available',
            isCorrect: true),
        Answer(
            answerText: 'Rely on backup cameras exclusively', isCorrect: false),
      ],
      explanation:
          'When backing a commercial vehicle, do so slowly and cautiously, using a spotter if available, to avoid collisions and ensure safety.',
    ),
    Question(
        questionText:
            'Why is it important to be cautious when driving around bicycles and motorcycles?',
        answers: [
          Answer(answerText: 'They are harder to see', isCorrect: true),
          Answer(
              answerText: 'They can stop more quickly than cars',
              isCorrect: false),
          Answer(answerText: 'They have the right of way', isCorrect: false),
          Answer(
              answerText: 'They can drive faster than cars', isCorrect: false),
        ],
        explanation:
            'Bicycles and motorcycles are smaller and harder to see, making it important for drivers to be extra cautious and maintain a safe distance.'),
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
