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

class PassengerVehiclesTest2024 extends StatefulWidget {
  const PassengerVehiclesTest2024({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _PassengerVehiclesTest2024State createState() =>
      _PassengerVehiclesTest2024State();
}

class _PassengerVehiclesTest2024State extends State<PassengerVehiclesTest2024> {
  int currentQuestionIndex = 0;
  bool showNextButton = false;

  final List<Question> questions = [
    Question(
        questionText:
            'What is the most important priority when operating a passenger vehicle?',
        answers: [
          Answer(answerText: 'Maintaining a strict schedule', isCorrect: false),
          Answer(answerText: 'Ensuring passenger comfort', isCorrect: false),
          Answer(answerText: 'The safety of the passengers', isCorrect: true),
          Answer(answerText: 'Fuel efficiency', isCorrect: false)
        ],
        explanation:
            'When operating a passenger vehicle, the most important priority is the safety of the passengers.'),
    Question(
        questionText:
            'What should a driver do before starting a passenger vehicle route?',
        answers: [
          Answer(
              answerText: 'Check all mirrors and adjust if necessary',
              isCorrect: true),
          Answer(answerText: 'Choose a radio station', isCorrect: false),
          Answer(
              answerText: 'Decide on the best route to avoid traffic',
              isCorrect: false),
          Answer(answerText: 'Assign seats to passengers', isCorrect: false)
        ],
        explanation:
            'Before starting a route, a driver should check all mirrors and adjust them if necessary to ensure good visibility.'),
    Question(
        questionText:
            'How should a driver handle unruly passengers in a passenger vehicle?',
        answers: [
          Answer(answerText: 'Ignore the behavior', isCorrect: false),
          Answer(
              answerText: 'Confront the passengers directly', isCorrect: false),
          Answer(
              answerText:
                  'Stop the vehicle in a safe place and address the situation',
              isCorrect: true),
          Answer(
              answerText: 'Ask other passengers to intervene', isCorrect: false)
        ],
        explanation:
            'A driver should handle unruly passengers by stopping the vehicle in a safe place and addressing the situation appropriately.'),
    Question(
        questionText:
            'What is a key factor in safely operating a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'Maximizing the number of passengers',
              isCorrect: false),
          Answer(answerText: 'Ensuring the vehicle is clean', isCorrect: false),
          Answer(
              answerText:
                  'Understanding the vehicle’s handling characteristics',
              isCorrect: true),
          Answer(answerText: 'Playing calming music', isCorrect: false)
        ],
        explanation:
            'A key factor in safely operating a passenger vehicle is understanding the vehicle’s handling characteristics, particularly when fully loaded.'),
    Question(
        questionText:
            'What should be done if a passenger vehicle breaks down on the road?',
        answers: [
          Answer(
              answerText: 'Attempt to fix the vehicle immediately',
              isCorrect: false),
          Answer(
              answerText: 'Continue driving to the nearest station',
              isCorrect: false),
          Answer(
              answerText: 'Secure the vehicle and notify the dispatcher',
              isCorrect: true),
          Answer(
              answerText: 'Ask passengers to help push the vehicle',
              isCorrect: false)
        ],
        explanation:
            'If a passenger vehicle breaks down on the road, the driver should secure the vehicle, ensure passengers’ safety, and notify the dispatcher.'),
    Question(
        questionText:
            'How often should emergency exits on a passenger vehicle be checked?',
        answers: [
          Answer(answerText: 'Once a month', isCorrect: false),
          Answer(answerText: 'Every six months', isCorrect: false),
          Answer(answerText: 'Before each trip', isCorrect: true),
          Answer(answerText: 'Annually', isCorrect: false)
        ],
        explanation:
            'Emergency exits on a passenger vehicle should be checked before each trip to ensure they are functioning properly and accessible.'),
    Question(
        questionText:
            'What is the correct procedure when approaching a railroad crossing in a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'Increase speed to cross quickly', isCorrect: false),
          Answer(
              answerText: 'Slow down, look both ways, and listen for trains',
              isCorrect: true),
          Answer(
              answerText: 'Stop always, regardless of train visibility',
              isCorrect: false),
          Answer(answerText: 'Cross without stopping', isCorrect: false)
        ],
        explanation:
            'When approaching a railroad crossing, the correct procedure is to slow down, look both ways, and listen for trains.'),
    Question(
        questionText:
            'What should a driver do to ensure passenger safety during boarding and alighting?',
        answers: [
          Answer(
              answerText: 'Board and alight passengers quickly',
              isCorrect: false),
          Answer(
              answerText: 'Only open doors when the vehicle is moving',
              isCorrect: false),
          Answer(
              answerText: 'Ensure the vehicle is fully stopped and secure',
              isCorrect: true),
          Answer(
              answerText: 'Encourage passengers to jump out quickly',
              isCorrect: false)
        ],
        explanation:
            'To ensure passenger safety during boarding and alighting, the driver should ensure the vehicle is fully stopped and secure.'),
    Question(
        questionText:
            'How should a driver respond to a disruptive passenger on a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'Engage in an argument to defend their position',
              isCorrect: false),
          Answer(
              answerText: 'Stop the vehicle and resolve the situation calmly',
              isCorrect: true),
          Answer(
              answerText: 'Ignore the passenger and continue driving',
              isCorrect: false),
          Answer(
              answerText: 'Call for police assistance while driving',
              isCorrect: false)
        ],
        explanation:
            'The driver should respond to a disruptive passenger by stopping the vehicle in a safe location and resolving the situation calmly and professionally.'),
    Question(
        questionText:
            'What is the proper way to handle sharp turns in a passenger vehicle?',
        answers: [
          Answer(answerText: 'By accelerating into the turn', isCorrect: false),
          Answer(
              answerText: 'By braking hard before the turn', isCorrect: false),
          Answer(
              answerText: 'By reducing speed before entering the turn',
              isCorrect: true),
          Answer(
              answerText: 'By maintaining a constant speed throughout the turn',
              isCorrect: false)
        ],
        explanation:
            'The proper way to handle sharp turns in a passenger vehicle is by reducing speed before entering the turn to maintain control.'),
    Question(
        questionText:
            'What is the best practice for a passenger vehicle driver during adverse weather conditions?',
        answers: [
          Answer(
              answerText: 'Drive faster to reduce trip time', isCorrect: false),
          Answer(
              answerText: 'Take a break and wait for conditions to improve',
              isCorrect: true),
          Answer(
              answerText: 'Follow other vehicles closely for guidance',
              isCorrect: false),
          Answer(
              answerText: 'Use the emergency lights and continue driving',
              isCorrect: false)
        ],
        explanation:
            'During adverse weather conditions, the best practice for a passenger vehicle driver is to take a break and wait for conditions to improve, if possible.'),
    Question(
        questionText:
            'What is an important consideration when driving a fully loaded passenger vehicle?',
        answers: [
          Answer(
              answerText: 'Playing entertaining music for passengers',
              isCorrect: false),
          Answer(
              answerText: 'The vehicle will handle differently than when empty',
              isCorrect: true),
          Answer(
              answerText: 'Taking the shortest route possible',
              isCorrect: false),
          Answer(
              answerText: 'Keeping windows open for ventilation',
              isCorrect: false)
        ],
        explanation:
            'An important consideration when driving a fully loaded passenger vehicle is that it will handle differently than when empty, particularly in terms of braking and turning.'),
    Question(
        questionText:
            'Why should a passenger vehicle driver be cautious when making lane changes?',
        answers: [
          Answer(
              answerText: 'To prevent damage to the radio antenna',
              isCorrect: false),
          Answer(answerText: 'To avoid startling passengers', isCorrect: false),
          Answer(answerText: 'Due to larger blind spots', isCorrect: true),
          Answer(answerText: 'To save fuel', isCorrect: false)
        ],
        explanation:
            'A passenger vehicle driver should be cautious when making lane changes due to larger blind spots that can hide other vehicles.'),
    Question(
        questionText:
            'What is essential for a passenger vehicle driver to do before driving under a bridge or overpass?',
        answers: [
          Answer(answerText: 'Check the vehicle’s speed', isCorrect: false),
          Answer(
              answerText:
                  'Know the vehicle’s height and clearance requirements',
              isCorrect: true),
          Answer(answerText: 'Adjust the mirrors', isCorrect: false),
          Answer(answerText: 'Turn on the headlights', isCorrect: false)
        ],
        explanation:
            'It is essential for a passenger vehicle driver to know the vehicle’s height and ensure it meets clearance requirements before driving under a bridge or overpass.'),
    Question(
        questionText:
            'How should a passenger vehicle driver manage a steep uphill grade?',
        answers: [
          Answer(
              answerText: 'Shift to a lower gear and maintain steady speed',
              isCorrect: true),
          Answer(
              answerText: 'Stop and wait for traffic to clear',
              isCorrect: false),
          Answer(
              answerText: 'Shift to a higher gear to gain speed',
              isCorrect: false),
          Answer(
              answerText: 'Turn off the air conditioning to save power',
              isCorrect: false)
        ],
        explanation:
            'On a steep uphill grade, a passenger vehicle driver should shift to a lower gear and maintain a steady speed to prevent stalling or overworking the engine.'),
    Question(
        questionText:
            'What is important when evacuating passengers from a passenger vehicle in an emergency?',
        answers: [
          Answer(
              answerText: 'Ensuring passengers take their belongings',
              isCorrect: false),
          Answer(
              answerText: 'Evacuating as quickly as possible without order',
              isCorrect: false),
          Answer(
              answerText:
                  'Keeping passengers calm and evacuating in an orderly manner',
              isCorrect: true),
          Answer(
              answerText: 'Leaving the vehicle running for climate control',
              isCorrect: false)
        ],
        explanation:
            'In an emergency, it is important to keep passengers calm and evacuate them from the passenger vehicle in an orderly manner to ensure safety.'),
    Question(
        questionText:
            'What should a passenger vehicle driver do if they encounter a flooded roadway?',
        answers: [
          Answer(
              answerText: 'Drive through quickly to minimize exposure',
              isCorrect: false),
          Answer(
              answerText: 'Stop and wait for the water to recede',
              isCorrect: true),
          Answer(
              answerText: 'Drive slowly to create less wake', isCorrect: false),
          Answer(answerText: 'Follow other vehicles closely', isCorrect: false)
        ],
        explanation:
            'If a passenger vehicle driver encounters a flooded roadway, they should stop and wait for the water to recede or find an alternative route.'),
    Question(
        questionText:
            'What should be checked regularly during a long trip in a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'The personal comfort of each passenger',
              isCorrect: false),
          Answer(
              answerText: 'The vehicle’s fluid levels and tire pressure',
              isCorrect: true),
          Answer(
              answerText: 'The availability of onboard entertainment',
              isCorrect: false),
          Answer(answerText: 'The schedule to stay on time', isCorrect: false)
        ],
        explanation:
            'During a long trip, a passenger vehicle driver should regularly check the vehicle’s fluid levels and tire pressure to ensure safe operation.'),
    Question(
        questionText:
            'What is a critical action when approaching a stop with a passenger vehicle?',
        answers: [
          Answer(answerText: 'Announce the next stop loudly', isCorrect: false),
          Answer(
              answerText: 'Begin braking early to ensure a smooth stop',
              isCorrect: true),
          Answer(
              answerText: 'Accelerate before coming to a complete stop',
              isCorrect: false),
          Answer(
              answerText: 'Open the doors before the vehicle stops',
              isCorrect: false)
        ],
        explanation:
            'When approaching a stop, it is critical for a passenger vehicle driver to begin braking early to ensure a smooth and safe stop.'),
    Question(
        questionText:
            'What should a driver do to maintain control on slippery roads with a passenger vehicle?',
        answers: [
          Answer(answerText: 'Brake and accelerate sharply', isCorrect: false),
          Answer(
              answerText: 'Drive at the maximum speed limit', isCorrect: false),
          Answer(
              answerText: 'Make sudden turns to test traction',
              isCorrect: false),
          Answer(
              answerText: 'Reduce speed and make gentle maneuvers',
              isCorrect: true)
        ],
        explanation:
            'To maintain control on slippery roads, a passenger vehicle driver should reduce speed and make gentle maneuvers to avoid skidding or losing control.'),
    Question(
        questionText:
            'How often should a driver inspect the emergency equipment in a passenger vehicle?',
        answers: [
          Answer(answerText: 'Once a week', isCorrect: false),
          Answer(answerText: 'Every day before the trip', isCorrect: true),
          Answer(answerText: 'Once a month', isCorrect: false),
          Answer(
              answerText: 'Only when the vehicle is serviced', isCorrect: false)
        ],
        explanation:
            'A driver should inspect the emergency equipment in a passenger vehicle every day before starting the trip to ensure it is in proper working condition.'),
    Question(
        questionText:
            'What is the correct procedure for a passenger vehicle driver to follow at railroad crossings?',
        answers: [
          Answer(answerText: 'Accelerate to cross quickly', isCorrect: false),
          Answer(
              answerText: 'Stop, look, and listen for trains', isCorrect: true),
          Answer(answerText: 'Rely on signals only', isCorrect: false),
          Answer(
              answerText: 'Cross without stopping if no train is visible',
              isCorrect: false)
        ],
        explanation:
            'At railroad crossings, a passenger vehicle driver should stop, look, and listen for trains, even if signals are not active, to ensure safety.'),
    Question(
        questionText:
            'What is a key consideration when driving a passenger vehicle in inclement weather?',
        answers: [
          Answer(
              answerText: 'Keeping the windows open for ventilation',
              isCorrect: false),
          Answer(
              answerText: 'Maintaining higher speeds for stability',
              isCorrect: false),
          Answer(
              answerText: 'Adjusting speed to the conditions of the road',
              isCorrect: true),
          Answer(answerText: 'Using the horn frequently', isCorrect: false)
        ],
        explanation:
            'In inclement weather, the key consideration for a passenger vehicle driver is to adjust speed to match the conditions of the road for safety.'),
    Question(
        questionText:
            'How should a driver secure a passenger vehicle when making a stop for passenger boarding or alighting?',
        answers: [
          Answer(
              answerText: 'Leave the engine running in neutral',
              isCorrect: false),
          Answer(answerText: 'Apply the parking brake', isCorrect: true),
          Answer(answerText: 'Keep the vehicle in gear', isCorrect: false),
          Answer(answerText: 'Rely on air brakes only', isCorrect: false)
        ],
        explanation:
            'When making a stop for passenger boarding or alighting, a driver should secure the vehicle by applying the parking brake.'),
    Question(
        questionText:
            'What is the importance of using a passenger count system in a passenger vehicle?',
        answers: [
          Answer(answerText: 'For ticket sales purposes', isCorrect: false),
          Answer(
              answerText: 'To balance the weight distribution',
              isCorrect: false),
          Answer(
              answerText: 'To ensure all passengers are accounted for',
              isCorrect: true),
          Answer(
              answerText: 'To determine the popularity of the route',
              isCorrect: false)
        ],
        explanation:
            'Using a passenger count system is important to ensure that all passengers are accounted for, especially during emergency situations.'),
    Question(
        questionText:
            'What should be the primary action if a passenger vehicle is involved in an accident?',
        answers: [
          Answer(answerText: 'Continue to the next stop', isCorrect: false),
          Answer(
              answerText: 'Immediately notify the authorities',
              isCorrect: true),
          Answer(
              answerText: 'Ask passengers to keep quiet about the incident',
              isCorrect: false),
          Answer(
              answerText: 'Exchange information with the other party only',
              isCorrect: false)
        ],
        explanation:
            'If involved in an accident, the primary action for a passenger vehicle driver is to immediately notify the authorities.'),
    Question(
        questionText:
            'Why is it important to enforce the no standing rule while a passenger vehicle is in motion?',
        answers: [
          Answer(
              answerText: 'To avoid obstructing the driver’s view',
              isCorrect: false),
          Answer(
              answerText: 'To prevent passenger falls and injuries',
              isCorrect: true),
          Answer(
              answerText: 'To keep the aisle clear for ticket checks',
              isCorrect: false),
          Answer(
              answerText: 'To reduce noise levels in the vehicle',
              isCorrect: false)
        ],
        explanation:
            'Enforcing the no standing rule while the vehicle is in motion is important to prevent passenger falls and injuries during sudden stops or turns.'),
    Question(
        questionText:
            'What is the recommended action if a passenger vehicle driver notices a mechanical issue while driving?',
        answers: [
          Answer(
              answerText: 'Continue driving to the nearest garage',
              isCorrect: false),
          Answer(
              answerText: 'Stop in a safe location and check the issue',
              isCorrect: true),
          Answer(
              answerText:
                  'Call the dispatcher and report at the end of the shift',
              isCorrect: false),
          Answer(
              answerText: 'Ignore it if the vehicle is still operational',
              isCorrect: false)
        ],
        explanation:
            'If a mechanical issue is noticed while driving, the recommended action is to stop in a safe location and check the issue.'),
    Question(
        questionText:
            'How should a passenger vehicle driver handle sharp downhill grades?',
        answers: [
          Answer(
              answerText: 'Increase speed to pass quickly', isCorrect: false),
          Answer(
              answerText: 'Use lower gears to control speed', isCorrect: true),
          Answer(answerText: 'Depend solely on air brakes', isCorrect: false),
          Answer(answerText: 'Stop frequently to rest brakes', isCorrect: false)
        ],
        explanation:
            'On sharp downhill grades, a passenger vehicle driver should use lower gears to help control the speed of the vehicle.'),
    Question(
        questionText:
            'What is a crucial factor in avoiding collisions in a passenger vehicle?',
        answers: [
          Answer(answerText: 'Honking regularly', isCorrect: false),
          Answer(answerText: 'Maintaining constant speed', isCorrect: false),
          Answer(
              answerText: 'Keeping a safe following distance', isCorrect: true),
          Answer(answerText: 'Driving in the left lane', isCorrect: false)
        ],
        explanation:
            'Maintaining a safe following distance is crucial in avoiding collisions, as it allows more time to react to traffic changes.'),
    Question(
        questionText:
            'Why is it important for a passenger vehicle driver to be aware of overhead clearance?',
        answers: [
          Answer(
              answerText: 'To prevent damage to the roof-mounted equipment',
              isCorrect: true),
          Answer(answerText: 'To improve fuel efficiency', isCorrect: false),
          Answer(
              answerText: 'To comply with noise regulations', isCorrect: false),
          Answer(
              answerText: 'To maintain radio signal strength', isCorrect: false)
        ],
        explanation:
            'Awareness of overhead clearance is important to prevent damage to the vehicle, particularly to roof-mounted equipment like air conditioning units.'),
    Question(
        questionText:
            'What should a driver do if a passenger becomes ill or injured on the vehicle?',
        answers: [
          Answer(
              answerText: 'Continue to the final destination',
              isCorrect: false),
          Answer(
              answerText: 'Provide medical assistance personally',
              isCorrect: false),
          Answer(
              answerText: 'Stop safely and seek medical assistance',
              isCorrect: true),
          Answer(
              answerText: 'Move the passenger to the back of the vehicle',
              isCorrect: false)
        ],
        explanation:
            'If a passenger becomes ill or injured, the driver should stop safely and seek medical assistance.'),
    Question(
        questionText:
            'How can a driver ensure effective communication with passengers in a passenger vehicle?',
        answers: [
          Answer(answerText: 'By using technical jargon', isCorrect: false),
          Answer(
              answerText: 'Speaking clearly and making announcements as needed',
              isCorrect: true),
          Answer(
              answerText:
                  'Communicating only at the beginning and end of the trip',
              isCorrect: false),
          Answer(answerText: 'Using hand signals', isCorrect: false)
        ],
        explanation:
            'Effective communication with passengers involves speaking clearly and making necessary announcements regarding stops, safety procedures, and other relevant information.'),
    Question(
        questionText:
            'What should be done to ensure passenger safety when operating a lift or ramp in a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'Operate as quickly as possible', isCorrect: false),
          Answer(
              answerText: 'Ensure the vehicle is on a level surface and secure',
              isCorrect: true),
          Answer(
              answerText: 'Allow passengers to operate the lift themselves',
              isCorrect: false),
          Answer(
              answerText: 'Use the lift while the vehicle is in motion',
              isCorrect: false)
        ],
        explanation:
            'To ensure passenger safety when operating a lift or ramp, the vehicle should be on a level surface, and the lift or ramp must be securely operated.'),
    Question(
        questionText:
            'What is essential for managing a large number of passengers boarding and alighting from a passenger vehicle?',
        answers: [
          Answer(answerText: 'Assigning seats in advance', isCorrect: false),
          Answer(
              answerText: 'Allowing passengers to find their own seats',
              isCorrect: false),
          Answer(
              answerText: 'Monitoring the boarding and alighting process',
              isCorrect: true),
          Answer(
              answerText: 'Rushing the process to stay on schedule',
              isCorrect: false)
        ],
        explanation:
            'Monitoring the boarding and alighting process is essential for managing a large number of passengers, ensuring order and safety.'),
    Question(
        questionText:
            'How should a passenger vehicle driver respond to an emergency vehicle approaching with sirens and lights?',
        answers: [
          Answer(answerText: 'Speed up to clear the path', isCorrect: false),
          Answer(
              answerText: 'Pull over to the right and stop', isCorrect: true),
          Answer(
              answerText: 'Continue driving at the same speed',
              isCorrect: false),
          Answer(
              answerText: 'Stop immediately in the roadway', isCorrect: false)
        ],
        explanation:
            'When an emergency vehicle is approaching with sirens and lights, a passenger vehicle driver should pull over to the right and stop to clear the path.'),
    Question(
        questionText:
            'What is the importance of conducting a walk-around inspection of a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'To check for any damage to the exterior',
              isCorrect: true),
          Answer(
              answerText: 'To ensure the vehicle is clean', isCorrect: false),
          Answer(
              answerText: 'To familiarize passengers with the vehicle',
              isCorrect: false),
          Answer(
              answerText: 'To determine if the vehicle needs fuel',
              isCorrect: false)
        ],
        explanation:
            'Conducting a walk-around inspection is important to check for any damage, leaks, or issues with the exterior of the passenger vehicle.'),
    Question(
        questionText:
            'What should a driver be aware of when operating a passenger vehicle with a high center of gravity?',
        answers: [
          Answer(
              answerText: 'The need for more frequent fuel stops',
              isCorrect: false),
          Answer(
              answerText: 'Increased risk of rollover on turns and curves',
              isCorrect: true),
          Answer(answerText: 'Reduced speed limits', isCorrect: false),
          Answer(answerText: 'Enhanced vehicle stability', isCorrect: false)
        ],
        explanation:
            'Drivers should be aware of the increased risk of rollover on turns and curves when operating a passenger vehicle with a high center of gravity.'),
    Question(
        questionText:
            'How should a driver manage passenger complaints or conflicts on a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'Ignore them and focus on driving', isCorrect: false),
          Answer(
              answerText: 'Ask other passengers to intervene',
              isCorrect: false),
          Answer(
              answerText: 'Address them calmly and professionally',
              isCorrect: true),
          Answer(
              answerText: 'Stop the vehicle and demand the passengers leave',
              isCorrect: false)
        ],
        explanation:
            'Passenger complaints or conflicts should be addressed calmly and professionally by the driver to maintain a safe and comfortable environment.'),
    Question(
        questionText:
            'What should a driver do if a passenger experiences a medical emergency?',
        answers: [
          Answer(
              answerText: 'Continue to the next scheduled stop',
              isCorrect: false),
          Answer(
              answerText: 'Ask other passengers for medical advice',
              isCorrect: false),
          Answer(
              answerText: 'Pull over safely and call for emergency services',
              isCorrect: true),
          Answer(
              answerText: 'Administer first aid without any training',
              isCorrect: false)
        ],
        explanation:
            'In case of a medical emergency, the driver should pull over safely and call for emergency services.'),
    Question(
        questionText:
            'How should a passenger vehicle driver manage a large group of passengers boarding at once?',
        answers: [
          Answer(
              answerText: 'Rush the boarding process to stay on schedule',
              isCorrect: false),
          Answer(
              answerText: 'Allow passengers to board without checking tickets',
              isCorrect: false),
          Answer(
              answerText:
                  'Monitor the boarding process to ensure order and safety',
              isCorrect: true),
          Answer(
              answerText: 'Ignore passenger seating preferences',
              isCorrect: false)
        ],
        explanation:
            'The driver should monitor the boarding process of a large group to maintain order and safety.'),
    Question(
        questionText:
            'What is an important safety procedure when operating a passenger vehicle with a wheelchair lift?',
        answers: [
          Answer(
              answerText: 'Using the lift while the vehicle is in motion',
              isCorrect: false),
          Answer(
              answerText: 'Ensuring the lift is properly stowed before moving',
              isCorrect: true),
          Answer(
              answerText: 'Allowing passengers to operate the lift themselves',
              isCorrect: false),
          Answer(
              answerText: 'Only using the lift at designated stops',
              isCorrect: false)
        ],
        explanation:
            'It i s important to ensure the wheelchair lift is properly stowed and secure before the vehicle is moved.'),
    Question(
        questionText:
            'How should a driver react to aggressive drivers while operating a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'Respond aggressively to assert dominance',
              isCorrect: false),
          Answer(
              answerText: 'Ignore them and maintain safe driving practices',
              isCorrect: true),
          Answer(
              answerText: 'Follow them closely to show disapproval',
              isCorrect: false),
          Answer(
              answerText: 'Use the vehicle’s horn to express frustration',
              isCorrect: false)
        ],
        explanation:
            'A driver should ignore aggressive drivers and continue to practice safe driving to ensure passenger safety.'),
    Question(
        questionText:
            'What is the best practice for handling luggage and personal items in a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'Allow passengers to leave items in the aisle',
              isCorrect: false),
          Answer(
              answerText: 'Stack all luggage near the front door',
              isCorrect: false),
          Answer(
              answerText:
                  'Store luggage in designated areas to avoid obstruction',
              isCorrect: true),
          Answer(
              answerText: 'Place heavy items on passenger seats',
              isCorrect: false)
        ],
        explanation:
            'Luggage and personal items should be stored in designated areas to avoid obstruction and ensure safety.'),
    Question(
        questionText:
            'What should a driver do when approaching a pedestrian crosswalk with a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'Speed up to clear the crosswalk quickly',
              isCorrect: false),
          Answer(
              answerText: 'Wave pedestrians to cross rapidly',
              isCorrect: false),
          Answer(
              answerText: 'Slow down and prepare to stop if necessary',
              isCorrect: true),
          Answer(
              answerText: 'Honk to alert pedestrians of the vehicle’s presence',
              isCorrect: false)
        ],
        explanation:
            'The driver should slow down and be prepared to stop if necessary when approaching a pedestrian crosswalk.'),
    Question(
        questionText:
            'What is the recommended action if a passenger becomes disruptive during the trip?',
        answers: [
          Answer(
              answerText: 'Engage in a verbal confrontation', isCorrect: false),
          Answer(
              answerText:
                  'Stop the vehicle in a safe place and address the behavior',
              isCorrect: true),
          Answer(
              answerText: 'Ignore the behavior and continue driving',
              isCorrect: false),
          Answer(
              answerText: 'Ask other passengers to handle the situation',
              isCorrect: false)
        ],
        explanation:
            'For disruptive passenger behavior, the recommended action is to stop the vehicle safely and address the behavior appropriately.'),
    Question(
        questionText:
            'How should a driver assist passengers with special needs in a passenger vehicle?',
        answers: [
          Answer(
              answerText:
                  'By providing individualized attention and assistance',
              isCorrect: true),
          Answer(
              answerText: 'Asking other passengers to help', isCorrect: false),
          Answer(
              answerText: 'Ignoring their needs to avoid delays',
              isCorrect: false),
          Answer(
              answerText: 'Directing them to sit at the back of the vehicle',
              isCorrect: false)
        ],
        explanation:
            'Drivers should provide individualized attention and assistance to passengers with special needs to ensure their safety and comfort.'),
    Question(
        questionText:
            'What should a driver do to ensure clear visibility while operating a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'Use high-beam headlights at all times',
              isCorrect: false),
          Answer(
              answerText: 'Keep the windshield and mirrors clean',
              isCorrect: true),
          Answer(
              answerText: 'Adjust the seat to the highest position',
              isCorrect: false),
          Answer(
              answerText: 'Only use the side mirrors for visibility',
              isCorrect: false)
        ],
        explanation:
            'Maintaining clean windshields and mirrors is essential for clear visibility while operating a passenger vehicle.'),
    Question(
        questionText:
            'What is the proper procedure for loading and unloading passengers on a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'Loading and unloading while in motion to save time',
              isCorrect: false),
          Answer(
              answerText: 'Allowing passengers to exit and enter at any point',
              isCorrect: false),
          Answer(
              answerText: 'Loading and unloading at designated stops only',
              isCorrect: true),
          Answer(
              answerText:
                  'Encouraging passengers to exit from the front door only',
              isCorrect: false)
        ],
        explanation:
            'The proper procedure is to load and unload passengers at designated stops only, ensuring safety and order.'),
    Question(
        questionText:
            'Why is it important to conduct a post-trip inspection of a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'To check for any passenger items left behind',
              isCorrect: true),
          Answer(answerText: 'To count the fare collected', isCorrect: false),
          Answer(
              answerText: 'To adjust the seats for the next trip',
              isCorrect: false),
          Answer(
              answerText: 'To take a break before the next trip',
              isCorrect: false)
        ],
        explanation:
            'Conducting a post-trip inspection is important to check for any items left behind by passengers and to ensure the vehicle is ready for the next trip.'),
    Question(
        questionText:
            'How should a passenger vehicle driver handle a situation where the vehicle exceeds its passenger capacity?',
        answers: [
          Answer(
              answerText: 'Allow standing passengers in the aisle',
              isCorrect: false),
          Answer(
              answerText:
                  'Refuse additional passengers and inform them of the next available service',
              isCorrect: true),
          Answer(answerText: 'Ask passengers to share seats', isCorrect: false),
          Answer(
              answerText: 'Allow passengers to sit on the floor',
              isCorrect: false)
        ],
        explanation:
            'If the vehicle exceeds its passenger capacity, the driver should refuse additional passengers and inform them of the next available service.'),
    Question(
        questionText:
            'What should be done to maintain proper ventilation in a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'Keep all windows closed at all times',
              isCorrect: false),
          Answer(
              answerText: 'Use air conditioning or heating systems as needed',
              isCorrect: true),
          Answer(
              answerText:
                  'Allow passengers to open windows at their discretion',
              isCorrect: false),
          Answer(
              answerText: 'Operate the vehicle with the roof hatch open',
              isCorrect: false)
        ],
        explanation:
            'To maintain proper ventilation, the driver should use air conditioning or heating systems as appropriate for the weather conditions.'),
    Question(
        questionText:
            'What is the importance of familiarizing oneself with the passenger vehicle’s emergency exits?',
        answers: [
          Answer(answerText: 'To be able to smoke near them', isCorrect: false),
          Answer(
              answerText: 'To ensure quick and safe evacuation in an emergency',
              isCorrect: true),
          Answer(
              answerText: 'To use them as regular entrances and exits',
              isCorrect: false),
          Answer(
              answerText: 'To impress passengers with safety knowledge',
              isCorrect: false)
        ],
        explanation:
            'Familiarizing oneself with the emergency exits of the passenger vehicle is crucial to ensure quick and safe evacuation in case of an emergency.'),
    Question(
        questionText:
            'What should a driver do if the passenger vehicle’s warning lights or gauges indicate a problem?',
        answers: [
          Answer(
              answerText: 'Disregard them until the end of the trip',
              isCorrect: false),
          Answer(
              answerText: 'Stop the vehicle safely and investigate the issue',
              isCorrect: true),
          Answer(
              answerText: 'Continue driving and report it at the next stop',
              isCorrect: false),
          Answer(
              answerText: 'Ask passengers for advice on the problem',
              isCorrect: false)
        ],
        explanation:
            'If warning lights or gauges indicate a problem, the driver should stop the vehicle safely and investigate the issue.'),
    Question(
        questionText:
            'How should a driver handle stops at bus stations or terminals with a passenger vehicle?',
        answers: [
          Answer(answerText: 'Park in any available spot', isCorrect: false),
          Answer(
              answerText:
                  'Park in designated areas and follow station procedures',
              isCorrect: true),
          Answer(
              answerText: 'Block other vehicles for quick boarding',
              isCorrect: false),
          Answer(
              answerText: 'Rush through the stop to stay on schedule',
              isCorrect: false)
        ],
        explanation:
            'At bus stations or terminals, a driver should park in designated areas and adhere to station procedures for the safety and order of operations.'),
    Question(
        questionText:
            'What is the best practice when communicating route changes or delays to passengers?',
        answers: [
          Answer(
              answerText: 'Wait until passengers ask about it',
              isCorrect: false),
          Answer(
              answerText: 'Communicate clearly and promptly', isCorrect: true),
          Answer(
              answerText: 'Use technical terms to explain the situation',
              isCorrect: false),
          Answer(
              answerText: 'Ignore it to avoid causing distress',
              isCorrect: false)
        ],
        explanation:
            'It is best practice to communicate any route changes or delays to passengers clearly and promptly to keep them informed.'),
    Question(
        questionText:
            'Why is it important to keep aisles and exits clear in a passenger vehicle?',
        answers: [
          Answer(
              answerText: 'To provide space for additional standing passengers',
              isCorrect: false),
          Answer(
              answerText:
                  'To ensure passenger safety and quick evacuation if needed',
              isCorrect: true),
          Answer(
              answerText: 'To make it easier to clean the vehicle',
              isCorrect: false),
          Answer(
              answerText: 'To create room for more luggage', isCorrect: false)
        ],
        explanation:
            'Keeping aisles and exits clear is crucial for passenger safety and to ensure a quick evacuation in case of an emergency.'),
    Question(
        questionText:
            'What should a driver do if they notice a door malfunction on a passenger vehicle?',
        answers: [
          Answer(answerText: 'Ignore it if it still closes', isCorrect: false),
          Answer(answerText: 'Try to fix it while driving', isCorrect: false),
          Answer(
              answerText:
                  'Stop at the nearest safe location to assess the issue',
              isCorrect: true),
          Answer(
              answerText:
                  'Continue the route and report it at the end of the day',
              isCorrect: false)
        ],
        explanation:
            'If a door malfunction is noticed, the driver should stop at the nearest safe location to assess and address the issue.'),
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
