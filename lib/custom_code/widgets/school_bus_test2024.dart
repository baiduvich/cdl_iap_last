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

class SchoolBusTest2024 extends StatefulWidget {
  const SchoolBusTest2024({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _SchoolBusTest2024State createState() => _SchoolBusTest2024State();
}

class _SchoolBusTest2024State extends State<SchoolBusTest2024> {
  int currentQuestionIndex = 0;
  bool showNextButton = false;

  final List<Question> questions = [
    Question(
        questionText:
            'What is the most important concern when driving a school bus?',
        answers: [
          Answer(answerText: 'Maintaining the bus schedule', isCorrect: false),
          Answer(
              answerText: 'Ensuring the comfort of the students',
              isCorrect: false),
          Answer(
              answerText: 'The safety of the students on board',
              isCorrect: true),
          Answer(answerText: 'Fuel efficiency of the bus', isCorrect: false)
        ],
        explanation:
            'The safety of the students is the most important concern when driving a school bus.'),
    Question(
        questionText:
            'What should a school bus driver do before starting the engine?',
        answers: [
          Answer(
              answerText: 'Check all mirrors for proper adjustment',
              isCorrect: true),
          Answer(answerText: 'Turn on the radio', isCorrect: false),
          Answer(answerText: 'Set the fastest route on GPS', isCorrect: false),
          Answer(answerText: 'Assign seats to students', isCorrect: false)
        ],
        explanation:
            'Before starting the engine, a school bus driver should check all mirrors to ensure they are properly adjusted for maximum visibility.'),
    Question(
        questionText:
            'How should a school bus driver handle student discipline issues?',
        answers: [
          Answer(
              answerText: 'Delegate to students to handle among themselves',
              isCorrect: false),
          Answer(
              answerText: 'Stop the bus in a safe place and address the issue',
              isCorrect: true),
          Answer(
              answerText: 'Ignore the issues and focus on driving',
              isCorrect: false),
          Answer(answerText: 'Call parents while driving', isCorrect: false)
        ],
        explanation:
            'A school bus driver should stop the bus in a safe place and address student discipline issues to maintain a safe environment.'),
    Question(
        questionText:
            'What is crucial when driving a school bus in inclement weather?',
        answers: [
          Answer(
              answerText: 'Maintaining the usual speed to stay on schedule',
              isCorrect: false),
          Answer(
              answerText: 'Adjusting driving to the current weather conditions',
              isCorrect: true),
          Answer(answerText: 'Taking alternate routes', isCorrect: false),
          Answer(
              answerText: 'Opening windows for better visibility',
              isCorrect: false)
        ],
        explanation:
            'In inclement weather, it is crucial to adjust driving to the current conditions to ensure the safety of the students.'),
    Question(
        questionText:
            'What should a school bus driver do if the vehicle breaks down?',
        answers: [
          Answer(
              answerText: 'Continue to the closest school', isCorrect: false),
          Answer(
              answerText:
                  'Secure the bus and notify the transportation department',
              isCorrect: true),
          Answer(answerText: 'Ask students to call for help', isCorrect: false),
          Answer(answerText: 'Attempt roadside repairs', isCorrect: false)
        ],
        explanation:
            'If the school bus breaks down, the driver should secure the bus and notify the transportation department.'),
    Question(
        questionText:
            'How often should a school bus driver inspect emergency exits?',
        answers: [
          Answer(answerText: 'Once a week', isCorrect: false),
          Answer(answerText: 'Every morning', isCorrect: true),
          Answer(answerText: 'Once a month', isCorrect: false),
          Answer(
              answerText: 'At the beginning of each school year',
              isCorrect: false)
        ],
        explanation:
            'A school bus driver should inspect emergency exits every morning to ensure they are functioning properly.'),
    Question(
        questionText:
            'What is the proper procedure at railroad crossings in a school bus?',
        answers: [
          Answer(answerText: 'Slow down and look both ways', isCorrect: false),
          Answer(
              answerText: 'Come to a complete stop and open the door to listen',
              isCorrect: true),
          Answer(
              answerText: 'Cross without stopping if no train is in sight',
              isCorrect: false),
          Answer(
              answerText: 'Rely solely on railroad crossing signals',
              isCorrect: false)
        ],
        explanation:
            'At railroad crossings, a school bus driver must come to a complete stop and open the door to listen for any approaching trains.'),
    Question(
        questionText:
            'What should be done to ensure student safety during boarding and alighting the school bus?',
        answers: [
          Answer(
              answerText: 'Encourage quick entry and exit', isCorrect: false),
          Answer(
              answerText: 'Ensure the bus is fully stopped and secure',
              isCorrect: true),
          Answer(
              answerText:
                  'Allow students to board and alight while the bus is in motion',
              isCorrect: false),
          Answer(
              answerText: 'Board and alight students only at traffic lights',
              isCorrect: false)
        ],
        explanation:
            'To ensure student safety, the bus must be fully stopped and secure during boarding and alighting.'),
    Question(
        questionText:
            'What should a school bus driver do in the event of an onboard altercation?',
        answers: [
          Answer(
              answerText: 'Continue driving to avoid schedule delays',
              isCorrect: false),
          Answer(
              answerText:
                  'Stop the bus in a safe location and address the situation',
              isCorrect: true),
          Answer(
              answerText: 'Ask other students to intervene', isCorrect: false),
          Answer(
              answerText: 'Report the altercation at the end of the route',
              isCorrect: false)
        ],
        explanation:
            'In the event of an altercation, the driver should stop the bus in a safe location and address the situation appropriately.'),
    Question(
        questionText:
            'How should sharp turns be handled when driving a school bus?',
        answers: [
          Answer(
              answerText: 'By taking the turns at high speeds',
              isCorrect: false),
          Answer(
              answerText: 'By reducing speed before the turn', isCorrect: true),
          Answer(
              answerText: 'By braking sharply in the middle of the turn',
              isCorrect: false),
          Answer(
              answerText: 'By asking students to lean towards the turn',
              isCorrect: false)
        ],
        explanation:
            'Sharp turns should be handled by reducing speed before entering the turn to maintain control of the bus.'),
    Question(
        questionText:
            'What is a key consideration when evacuating students from a school bus in an emergency?',
        answers: [
          Answer(
              answerText: 'Keeping the radio on for communication',
              isCorrect: false),
          Answer(
              answerText: 'Ensuring an orderly and calm evacuation',
              isCorrect: true),
          Answer(
              answerText: 'Evacuating older students first', isCorrect: false),
          Answer(
              answerText: 'Leaving personal belongings on the bus',
              isCorrect: false)
        ],
        explanation:
            'In an emergency, ensuring an orderly and calm evacuation of all students is a key consideration for safety.'),
    Question(
        questionText:
            'Why is maintaining a consistent routine important in school bus operations?',
        answers: [
          Answer(answerText: 'To minimize fuel consumption', isCorrect: false),
          Answer(
              answerText: 'To provide predictability and security for students',
              isCorrect: true),
          Answer(answerText: 'To avoid traffic congestion', isCorrect: false),
          Answer(
              answerText: 'To comply with state regulations', isCorrect: false)
        ],
        explanation:
            'Maintaining a consistent routine is important to provide predictability and a sense of security for students.'),
    Question(
        questionText:
            'What should a school bus driver do before allowing students to exit the bus?',
        answers: [
          Answer(
              answerText: 'Make sure the bus is in motion', isCorrect: false),
          Answer(
              answerText:
                  'Check that the bus is fully stopped and the exit path is safe',
              isCorrect: true),
          Answer(answerText: 'Ask students to exit quickly', isCorrect: false),
          Answer(answerText: 'Open all emergency exits', isCorrect: false)
        ],
        explanation:
            'Before allowing students to exit, the driver should ensure that the bus is fully stopped and that the exit path is safe.'),
    Question(
        questionText:
            'How should a school bus driver manage stops in high-traffic areas?',
        answers: [
          Answer(
              answerText: 'Stop quickly to minimize traffic disruption',
              isCorrect: false),
          Answer(
              answerText: 'Use hazard lights and follow safety protocols',
              isCorrect: true),
          Answer(
              answerText: 'Avoid stopping in high-traffic areas',
              isCorrect: false),
          Answer(
              answerText: 'Ask students to exit the bus quickly',
              isCorrect: false)
        ],
        explanation:
            'In high-traffic areas, a school bus driver should use hazard lights and adhere to safety protocols while stopping.'),
    Question(
        questionText:
            'What is the best practice for driving a school bus during adverse weather conditions?',
        answers: [
          Answer(
              answerText: 'Drive faster to reduce trip duration',
              isCorrect: false),
          Answer(
              answerText: 'Take shelter and wait for the weather to improve',
              isCorrect: true),
          Answer(
              answerText: 'Follow other vehicles closely for guidance',
              isCorrect: false),
          Answer(
              answerText: 'Use the emergency lights and continue driving',
              isCorrect: false)
        ],
        explanation:
            'During adverse weather conditions, the best practice is to take shelter and wait for conditions to improve.'),
    Question(
        questionText:
            'Why is it important for a school bus driver to be familiar with the bus route?',
        answers: [
          Answer(
              answerText: 'To identify the best places for breaks',
              isCorrect: false),
          Answer(
              answerText: 'To ensure timely pick-up and drop-off',
              isCorrect: true),
          Answer(
              answerText: 'To entertain students with route facts',
              isCorrect: false),
          Answer(answerText: 'To avoid using GPS navigation', isCorrect: false)
        ],
        explanation:
            'Familiarity with the bus route is important to ensure timely and efficient pick-up and drop-off of students.'),
    Question(
        questionText:
            'What should a school bus driver do if they encounter a road obstruction?',
        answers: [
          Answer(
              answerText: 'Try to move the obstruction themselves',
              isCorrect: false),
          Answer(
              answerText: 'Drive around it, even if it means leaving the route',
              isCorrect: false),
          Answer(
              answerText: 'Stop at a safe distance and notify the dispatcher',
              isCorrect: true),
          Answer(
              answerText: 'Ask students to help clear the obstruction',
              isCorrect: false)
        ],
        explanation:
            'If a road obstruction is encountered, the driver should stop at a safe distance, ensure the safety of the students, and notify the dispatcher.'),
    Question(
        questionText:
            'How can a school bus driver ensure effective communication with students?',
        answers: [
          Answer(answerText: 'By using complex language', isCorrect: false),
          Answer(
              answerText: 'Speaking clearly and making necessary announcements',
              isCorrect: true),
          Answer(
              answerText: 'Communicating only through written notes',
              isCorrect: false),
          Answer(
              answerText: 'Relying on students to pass messages',
              isCorrect: false)
        ],
        explanation:
            'Effective communication with students involves speaking clearly and making necessary announcements regarding safety and behavior expectations.'),
    Question(
        questionText:
            'What should a driver inspect during a post-trip inspection of a school bus?',
        answers: [
          Answer(answerText: 'Fuel level only', isCorrect: false),
          Answer(
              answerText: 'Any items left behind by students', isCorrect: true),
          Answer(answerText: 'Seat comfort adjustments', isCorrect: false),
          Answer(
              answerText: 'Mirror angles for the next trip', isCorrect: false)
        ],
        explanation:
            'During a post-trip inspection, a driver should check for any items left behind by students and ensure the bus is ready for the next route.'),
    Question(
        questionText:
            'Why is it important to have a clearly defined emergency evacuation plan for a school bus?',
        answers: [
          Answer(answerText: 'To meet legal requirements', isCorrect: false),
          Answer(
              answerText:
                  'To ensure a quick and orderly evacuation in emergencies',
              isCorrect: true),
          Answer(
              answerText: 'To practice drills during the trip',
              isCorrect: false),
          Answer(answerText: 'To keep students entertained', isCorrect: false)
        ],
        explanation:
            'A clearly defined emergency evacuation plan is essential to ensure a quick and orderly evacuation in case of an emergency.'),
    Question(
        questionText:
            'What should a school bus driver do when approaching a stop with students onboard?',
        answers: [
          Answer(answerText: 'Accelerate towards the stop', isCorrect: false),
          Answer(
              answerText: 'Use the flashing red lights and stop arm',
              isCorrect: true),
          Answer(
              answerText: 'Only use the horn to alert traffic',
              isCorrect: false),
          Answer(answerText: 'Stop abruptly at the stop', isCorrect: false)
        ],
        explanation:
            'When approaching a stop, a school bus driver should use the flashing red lights and stop arm as a signal to other drivers and for student safety.'),
    Question(
        questionText:
            'How should a school bus driver monitor student behavior?',
        answers: [
          Answer(
              answerText: 'By frequently looking in the rearview mirror',
              isCorrect: true),
          Answer(
              answerText: 'By using a video monitoring system only',
              isCorrect: false),
          Answer(
              answerText: 'By stopping the bus to check each time',
              isCorrect: false),
          Answer(
              answerText: 'By assigning a student as a monitor',
              isCorrect: false)
        ],
        explanation:
            'A school bus driver should frequently look in the rearview mirror to monitor student behavior and ensure safety.'),
    Question(
        questionText:
            'What is the proper way for a school bus driver to handle sharp bends in the road?',
        answers: [
          Answer(answerText: 'Maintain regular speed', isCorrect: false),
          Answer(answerText: 'Slow down before the bend', isCorrect: true),
          Answer(answerText: 'Accelerate through the bend', isCorrect: false),
          Answer(answerText: 'Use the horn while turning', isCorrect: false)
        ],
        explanation:
            'The proper way to handle sharp bends is to slow down before the bend to maintain control of the bus.'),
    Question(
        questionText:
            'What should a school bus driver do in case of a behavioral emergency with a student?',
        answers: [
          Answer(
              answerText: 'Continue driving to maintain schedule',
              isCorrect: false),
          Answer(
              answerText:
                  'Stop the bus in a safe location and address the situation',
              isCorrect: true),
          Answer(
              answerText: 'Ask other students to intervene', isCorrect: false),
          Answer(answerText: 'Call the parents while driving', isCorrect: false)
        ],
        explanation:
            'In case of a behavioral emergency, the driver should stop the bus in a safe location and address the situation appropriately.'),
    Question(
        questionText:
            'How can a school bus driver ensure that all students have exited the bus at the end of a route?',
        answers: [
          Answer(
              answerText: 'Perform a post-trip inspection and walk-through',
              isCorrect: true),
          Answer(answerText: 'Assume all students have left', isCorrect: false),
          Answer(
              answerText: 'Check only the front of the bus', isCorrect: false),
          Answer(answerText: 'Rely on student count', isCorrect: false)
        ],
        explanation:
            'Performing a post-trip inspection and walk-through ensures that all students have safely exited the bus.'),
    Question(
        questionText:
            'What is the best practice for loading and unloading students on a school bus?',
        answers: [
          Answer(answerText: 'Loading and unloading quickly', isCorrect: false),
          Answer(
              answerText:
                  'Allowing students to determine when to get on and off',
              isCorrect: false),
          Answer(
              answerText:
                  'Loading and unloading in an orderly and supervised manner',
              isCorrect: true),
          Answer(
              answerText: 'Unloading all students at one stop',
              isCorrect: false)
        ],
        explanation:
            'Students should be loaded and unloaded in an orderly and supervised manner to ensure safety.'),
    Question(
        questionText:
            'What should a school bus driver do if they suspect a mechanical issue during a route?',
        answers: [
          Answer(
              answerText: 'Wait until the route is complete to check it',
              isCorrect: false),
          Answer(
              answerText: 'Ignore it if the bus is still operational',
              isCorrect: false),
          Answer(
              answerText: 'Pull over safely and investigate the issue',
              isCorrect: true),
          Answer(
              answerText: 'Contact the dispatcher at the next stop',
              isCorrect: false)
        ],
        explanation:
            'If a mechanical issue is suspected, the driver should pull over safely and investigate or seek assistance.'),
    Question(
        questionText:
            'Why is it important to conduct regular emergency evacuation drills on a school bus?',
        answers: [
          Answer(
              answerText: 'To comply with school policies', isCorrect: false),
          Answer(
              answerText: 'To ensure students know how to evacuate safely',
              isCorrect: true),
          Answer(
              answerText: 'To make the drills a routine part of the trip',
              isCorrect: false),
          Answer(answerText: 'To pass the time on long trips', isCorrect: false)
        ],
        explanation:
            'Regular emergency evacuation drills are important to ensure that students know how to evacuate the bus safely in case of an emergency.'),
    Question(
        questionText:
            'What should a school bus driver do when students need to cross the street after alighting the bus?',
        answers: [
          Answer(
              answerText: 'Instruct them to cross immediately',
              isCorrect: false),
          Answer(
              answerText: 'Have them wait for a hand signal before crossing',
              isCorrect: true),
          Answer(
              answerText: 'Leave as soon as the students alight',
              isCorrect: false),
          Answer(
              answerText: 'Tell them to run across the street',
              isCorrect: false)
        ],
        explanation:
            'Students should wait for a hand signal from the driver before safely crossing the street after alighting the bus.'),
    Question(
        questionText:
            'What is an essential step in preparing a school bus for operation?',
        answers: [
          Answer(
              answerText: 'Decorating the interior of the bus',
              isCorrect: false),
          Answer(
              answerText: 'Conducting a pre-trip vehicle inspection',
              isCorrect: true),
          Answer(
              answerText: 'Checking the schedule for changes',
              isCorrect: false),
          Answer(
              answerText: 'Arranging the seats for students', isCorrect: false)
        ],
        explanation:
            'Conducting a pre-trip vehicle inspection is essential to ensure the bus is safe and operational for the route.'),
    Question(
        questionText:
            'How should a school bus driver handle a situation where the bus is overcrowded?',
        answers: [
          Answer(
              answerText: 'Allow students to sit in the aisles',
              isCorrect: false),
          Answer(answerText: 'Continue the route as normal', isCorrect: false),
          Answer(
              answerText:
                  'Refuse additional passengers and inform the dispatcher',
              isCorrect: true),
          Answer(
              answerText: 'Ask students to double up in seats',
              isCorrect: false)
        ],
        explanation:
            'In an overcrowded situation, the driver should refuse additional passengers and inform the dispatcher for safety reasons.'),
    Question(
        questionText: 'What is the proper way to use mirrors on a school bus?',
        answers: [
          Answer(answerText: 'Checking them only at stops', isCorrect: false),
          Answer(
              answerText: 'Using them to monitor traffic and student behavior',
              isCorrect: true),
          Answer(answerText: 'Adjusting them while driving', isCorrect: false),
          Answer(answerText: 'Relying solely on side mirrors', isCorrect: false)
        ],
        explanation:
            'Mirrors should be used to monitor traffic and student behavior, and they should be adjusted before starting the route.'),
    Question(
        questionText:
            'What is a key factor in maintaining discipline on a school bus?',
        answers: [
          Answer(
              answerText: 'Having a strict no-talking policy',
              isCorrect: false),
          Answer(
              answerText: 'Setting clear behavior expectations',
              isCorrect: true),
          Answer(
              answerText: 'Allowing students to resolve issues themselves',
              isCorrect: false),
          Answer(answerText: 'Ignoring minor disruptions', isCorrect: false)
        ],
        explanation:
            'Setting clear behavior expectations is a key factor in maintaining discipline and ensuring a safe environment on the bus.'),
    Question(
        questionText:
            'What should be done if a student is not at their designated bus stop?',
        answers: [
          Answer(
              answerText: 'Wait indefinitely for the student',
              isCorrect: false),
          Answer(
              answerText: 'Leave immediately to stay on schedule',
              isCorrect: false),
          Answer(
              answerText: 'Follow standard procedure for absent students',
              isCorrect: true),
          Answer(
              answerText: 'Check nearby locations for the student',
              isCorrect: false)
        ],
        explanation:
            'If a student is not at their stop, the driver should follow the standard procedure, which may include waiting for a short period before continuing.'),
    Question(
        questionText:
            'How should a school bus driver approach and leave bus stops?',
        answers: [
          Answer(answerText: 'Quickly, to minimize delays', isCorrect: false),
          Answer(answerText: 'Slowly and cautiously', isCorrect: true),
          Answer(
              answerText: 'Using the horn to alert traffic', isCorrect: false),
          Answer(answerText: 'Without using signals', isCorrect: false)
        ],
        explanation:
            'School bus drivers should approach and leave bus stops slowly and cautiously to ensure the safety of students and other road users.'),
    Question(
        questionText:
            'What is the proper response if a school bus becomes stuck or stranded?',
        answers: [
          Answer(answerText: 'Ask students to push the bus', isCorrect: false),
          Answer(
              answerText: 'Keep students on the bus and notify dispatch',
              isCorrect: true),
          Answer(
              answerText: 'Evacuate and leave the bus immediately',
              isCorrect: false),
          Answer(
              answerText: 'Try to fix the bus without professional help',
              isCorrect: false)
        ],
        explanation:
            'If a bus becomes stuck or stranded, the driver should keep students on the bus and notify dispatch for assistance.'),
    Question(
        questionText:
            'What is the appropriate action if a school bus encounters high water on the road?',
        answers: [
          Answer(answerText: 'Drive through quickly', isCorrect: false),
          Answer(
              answerText: 'Stop, turn around, and find an alternate route',
              isCorrect: true),
          Answer(
              answerText: 'Ask students for advice on whether to cross',
              isCorrect: false),
          Answer(
              answerText: 'Wait for the water level to decrease',
              isCorrect: false)
        ],
        explanation:
            'In the case of high water on the road, the driver should stop, turn around, and find an alternate route for safety.'),
    Question(
        questionText:
            'Why is it important for school bus drivers to know the names of the students on their route?',
        answers: [
          Answer(answerText: 'For attendance purposes', isCorrect: false),
          Answer(
              answerText: 'To build rapport and enhance student safety',
              isCorrect: true),
          Answer(
              answerText: 'To report misbehavior more easily',
              isCorrect: false),
          Answer(answerText: 'To create a seating chart', isCorrect: false)
        ],
        explanation:
            'Knowing the names of students helps build rapport and enhances safety by allowing the driver to account for all students.'),
    Question(
        questionText:
            'What should a school bus driver do to ensure safe operation during winter conditions?',
        answers: [
          Answer(answerText: 'Install chains on all tires', isCorrect: false),
          Answer(
              answerText: 'Increase speed to maintain traction',
              isCorrect: false),
          Answer(
              answerText: 'Drive cautiously and allow extra stopping distance',
              isCorrect: true),
          Answer(
              answerText: 'Use only the rear heaters to avoid fogging',
              isCorrect: false)
        ],
        explanation:
            'During winter conditions, driving cautiously and allowing extra stopping distance is essential for safe operation.'),
    Question(
        questionText:
            'How should a school bus driver address a situation where a student is consistently late for the bus?',
        answers: [
          Answer(
              answerText: 'Leave after waiting for a few minutes',
              isCorrect: false),
          Answer(
              answerText: 'Report the issue to school officials',
              isCorrect: true),
          Answer(
              answerText: 'Ignore the issue as it is not the driver’s concern',
              isCorrect: false),
          Answer(
              answerText: 'Scold the student in front of others',
              isCorrect: false)
        ],
        explanation:
            'Consistent lateness should be reported to school officials to address the issue appropriately.'),
    Question(
        questionText:
            'What is the first action a school bus driver should take if they smell smoke while driving?',
        answers: [
          Answer(
              answerText: 'Continue to the nearest school', isCorrect: false),
          Answer(
              answerText: 'Turn off the engine immediately', isCorrect: false),
          Answer(
              answerText: 'Pull over safely and evacuate the bus',
              isCorrect: true),
          Answer(
              answerText: 'Open windows to let the smoke out', isCorrect: false)
        ],
        explanation:
            'If a school bus driver smells smoke, they should pull over safely and evacuate the bus to ensure student safety.'),
    Question(
        questionText:
            'How should a school bus driver manage student behavior without causing distractions?',
        answers: [
          Answer(
              answerText: 'By frequently turning around while driving',
              isCorrect: false),
          Answer(
              answerText: 'By using the bus public address system',
              isCorrect: true),
          Answer(
              answerText: 'By stopping the bus to discipline students',
              isCorrect: false),
          Answer(
              answerText: 'By delegating to a student monitor',
              isCorrect: false)
        ],
        explanation:
            'Using the bus’s public address system helps manage student behavior without causing distractions from driving.'),
    Question(
        questionText:
            'What is the safest way for students to cross the street after alighting from a school bus?',
        answers: [
          Answer(
              answerText: 'Running across the street quickly',
              isCorrect: false),
          Answer(
              answerText:
                  'Walking in front of the bus where the driver can see them',
              isCorrect: true),
          Answer(answerText: 'Crossing behind the bus', isCorrect: false),
          Answer(
              answerText: 'Crossing without the driver’s signal',
              isCorrect: false)
        ],
        explanation:
            'The safest way for students to cross is in front of the bus where the driver can see them and provide a signal when safe.'),
    Question(
        questionText:
            'What should a school bus driver do if a student leaves an item on the bus?',
        answers: [
          Answer(
              answerText: 'Ignore it and continue driving', isCorrect: false),
          Answer(answerText: 'Throw the item away', isCorrect: false),
          Answer(
              answerText: 'Keep the item for their own use', isCorrect: false),
          Answer(
              answerText: 'Turn the item into the lost and found',
              isCorrect: true)
        ],
        explanation:
            'Items left on the bus should be turned into the lost and found for students to reclaim.'),
    Question(
        questionText:
            'What should a school bus driver do before allowing students to board?',
        answers: [
          Answer(
              answerText: 'Check for traffic approaching from behind',
              isCorrect: true),
          Answer(
              answerText: 'Honk to signal students it is safe',
              isCorrect: false),
          Answer(
              answerText: 'Begin moving to allow students to catch up',
              isCorrect: false),
          Answer(
              answerText: 'Ask students to form a line before boarding',
              isCorrect: false)
        ],
        explanation:
            'Before allowing students to board, the driver should check for traffic approaching from behind to ensure it is safe to board.'),
    Question(
        questionText:
            'How often should emergency exit routes be discussed with students on a school bus?',
        answers: [
          Answer(answerText: 'Once a year', isCorrect: false),
          Answer(answerText: 'Every trip', isCorrect: true),
          Answer(
              answerText: 'Only at the beginning of the school year',
              isCorrect: false),
          Answer(answerText: 'Whenever a new student boards', isCorrect: false)
        ],
        explanation:
            'Emergency exit routes should be discussed with students on every trip to ensure they are familiar with the procedures.'),
    Question(
        questionText:
            'What is the proper way to approach a railway crossing in a school bus?',
        answers: [
          Answer(answerText: 'Slow down and look both ways', isCorrect: false),
          Answer(
              answerText: 'Stop, open the door, and listen for a train',
              isCorrect: true),
          Answer(answerText: 'Speed up to cross quickly', isCorrect: false),
          Answer(answerText: 'Rely on the railway signals', isCorrect: false)
        ],
        explanation:
            'Approaching a railway crossing, the bus should stop, the driver should open the door, and listen for any approaching trains.'),
    Question(
        questionText:
            'What should be done if a school bus gets stuck or stranded in severe weather?',
        answers: [
          Answer(answerText: 'Ask students to push the bus', isCorrect: false),
          Answer(
              answerText: 'Leave the bus and seek shelter elsewhere',
              isCorrect: false),
          Answer(
              answerText: 'Keep students on the bus and call for help',
              isCorrect: true),
          Answer(answerText: 'Continue driving at all costs', isCorrect: false)
        ],
        explanation:
            'If stranded, keep students on the bus and call for help, as the bus is the safest place for them.'),
    Question(
        questionText:
            'Why is it important for school bus drivers to conduct a headcount?',
        answers: [
          Answer(
              answerText: 'To ensure the bus is not overloaded',
              isCorrect: false),
          Answer(
              answerText: 'To confirm all students are accounted for',
              isCorrect: true),
          Answer(
              answerText: 'To pass time while waiting at stops',
              isCorrect: false),
          Answer(answerText: 'For attendance records', isCorrect: false)
        ],
        explanation:
            'Conducting a headcount is essential to ensure all students are accounted for, particularly after stops.'),
    Question(
        questionText:
            'What should a school bus driver do if a student is found sleeping on the bus after a route is completed?',
        answers: [
          Answer(
              answerText: 'Wake the student and ask them to leave the bus',
              isCorrect: true),
          Answer(
              answerText: 'Let them sleep until they wake up naturally',
              isCorrect: false),
          Answer(answerText: 'Drive them back to school', isCorrect: false),
          Answer(
              answerText: 'Report to the authorities immediately',
              isCorrect: false)
        ],
        explanation:
            'If a student is found sleeping on the bus, the driver should wake them and ensure they safely leave the bus.'),
    Question(
        questionText:
            'How should a school bus driver handle a fight between students while driving?',
        answers: [
          Answer(
              answerText: 'Stop the bus in a safe place and intervene',
              isCorrect: true),
          Answer(
              answerText: 'Continue driving to the next stop',
              isCorrect: false),
          Answer(
              answerText: 'Let the students resolve it themselves',
              isCorrect: false),
          Answer(answerText: 'Call the police while driving', isCorrect: false)
        ],
        explanation:
            'In case of a fight, the driver should stop the bus in a safe place and intervene to ensure student safety.'),
    Question(
        questionText:
            'What is the best practice for monitoring the rear of the bus while driving?',
        answers: [
          Answer(answerText: 'Use only the rearview mirror', isCorrect: false),
          Answer(answerText: 'Regularly check all mirrors', isCorrect: true),
          Answer(answerText: 'Install a rear-view camera', isCorrect: false),
          Answer(
              answerText: 'Ask a student to monitor and report',
              isCorrect: false)
        ],
        explanation:
            'The best practice is to regularly check all mirrors to monitor the rear and sides of the bus.'),
    Question(
        questionText:
            'How should a school bus driver ensure that no students are left behind after a stop?',
        answers: [
          Answer(
              answerText: 'Perform a physical walk-through of the bus',
              isCorrect: true),
          Answer(
              answerText: 'Ask students to report if anyone is missing',
              isCorrect: false),
          Answer(
              answerText: 'Assume all students have exited', isCorrect: false),
          Answer(
              answerText: 'Check only the front and back seats',
              isCorrect: false)
        ],
        explanation:
            'After each stop, the driver should perform a physical walk-through to ensure no students are left behind.'),
    Question(
        questionText:
            'What should a school bus driver do when a student is being bullied on the bus?',
        answers: [
          Answer(
              answerText: 'Ignore it as it’s a student issue',
              isCorrect: false),
          Answer(
              answerText: 'Stop the bus and address the situation',
              isCorrect: true),
          Answer(
              answerText: 'Tell the bullied student to fight back',
              isCorrect: false),
          Answer(
              answerText: 'Report it at the end of the day', isCorrect: false)
        ],
        explanation:
            'If bullying occurs, the driver should stop the bus and address the situation to maintain a safe environment.'),
    Question(
        questionText:
            'What is the protocol if a school bus is involved in a minor traffic accident?',
        answers: [
          Answer(
              answerText: 'Leave the scene immediately to avoid congestion',
              isCorrect: false),
          Answer(
              answerText: 'Wait for authorities and file a report',
              isCorrect: true),
          Answer(
              answerText: 'Continue driving to the destination',
              isCorrect: false),
          Answer(
              answerText: 'Ask students to call their parents',
              isCorrect: false)
        ],
        explanation:
            'In a minor accident, the driver should wait for authorities, file a report, and ensure student safety.'),
    Question(
        questionText:
            'How should a school bus driver address dangerous behavior like students throwing objects?',
        answers: [
          Answer(
              answerText: 'Ignore it unless someone complains',
              isCorrect: false),
          Answer(
              answerText: 'Stop the bus and address the behavior immediately',
              isCorrect: true),
          Answer(
              answerText: 'Join in to build rapport with students',
              isCorrect: false),
          Answer(
              answerText: 'Report it to the school at the end of the route',
              isCorrect: false)
        ],
        explanation:
            'Dangerous behavior like throwing objects should be addressed immediately by stopping the bus and correcting the behavior.'),
    Question(
        questionText:
            'What is the correct action when a school bus needs to back up?',
        answers: [
          Answer(answerText: 'Back up without assistance', isCorrect: false),
          Answer(answerText: 'Use the mirrors only', isCorrect: false),
          Answer(
              answerText: 'Never back up unless absolutely necessary',
              isCorrect: true),
          Answer(answerText: 'Have a student guide the bus', isCorrect: false)
        ],
        explanation:
            'A school bus should never back up unless absolutely necessary and with proper assistance or guidance.'),
    Question(
        questionText:
            'How should a school bus driver ensure the safety of students during drop-off?',
        answers: [
          Answer(
              answerText: 'Let students exit while the bus is still moving',
              isCorrect: false),
          Answer(
              answerText:
                  'Ensure the bus is fully stopped and check for traffic',
              isCorrect: true),
          Answer(
              answerText: 'Rush the students to exit quickly',
              isCorrect: false),
          Answer(
              answerText: 'Only focus on the students inside the bus',
              isCorrect: false)
        ],
        explanation:
            'During drop-off, the driver must ensure the bus is fully stopped and check for traffic before allowing students to exit.'),
    Question(
        questionText:
            'What should a school bus driver do to manage high noise levels on the bus?',
        answers: [
          Answer(
              answerText: 'Increase the volume of the radio', isCorrect: false),
          Answer(
              answerText: 'Stop the bus and address the noise issue',
              isCorrect: true),
          Answer(
              answerText: 'Ignore the noise as long as the students are seated',
              isCorrect: false),
          Answer(answerText: 'Wear earplugs while driving', isCorrect: false)
        ],
        explanation:
            'To manage high noise levels, the driver should stop the bus and address the issue to maintain a safe and controlled environment.'),
    Question(
        questionText:
            'What is an effective way for school bus drivers to deal with stress on the job?',
        answers: [
          Answer(
              answerText: 'Take frequent breaks during the route',
              isCorrect: false),
          Answer(
              answerText: 'Practice deep breathing or relaxation techniques',
              isCorrect: true),
          Answer(
              answerText: 'Drive faster to finish the route sooner',
              isCorrect: false),
          Answer(answerText: 'Vent frustration while driving', isCorrect: false)
        ],
        explanation:
            'Practicing deep breathing or relaxation techniques is an effective way for drivers to manage stress on the job.'),
    Question(
      questionText: 'Q',
      answers: [
        Answer(answerText: 'A1', isCorrect: false),
        Answer(answerText: 'A2', isCorrect: true),
        Answer(answerText: 'A3', isCorrect: false),
        Answer(answerText: 'A4', isCorrect: false),
      ],
      explanation: 'Exp', // Add explanation here
    ),
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
