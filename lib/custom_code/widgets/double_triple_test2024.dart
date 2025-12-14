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

class DoubleTripleTest2024 extends StatefulWidget {
  const DoubleTripleTest2024({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _DoubleTripleTest2024State createState() => _DoubleTripleTest2024State();
}

class _DoubleTripleTest2024State extends State<DoubleTripleTest2024> {
  int currentQuestionIndex = 0;
  bool showNextButton = false;

  final List<Question> questions = [
    Question(
      questionText:
          'What is the primary concern when pulling double or triple trailers?',
      answers: [
        Answer(answerText: 'The length of the vehicle', isCorrect: false),
        Answer(answerText: 'The weight of the cargo', isCorrect: false),
        Answer(
            answerText: 'The increased risk of trailer sway', isCorrect: true),
        Answer(
            answerText: 'The color coordination of the trailers',
            isCorrect: false),
      ],
      explanation:
          'The primary concern when pulling double or triple trailers is the increased risk of trailer sway, which can impact vehicle control and safety.',
    ),
    Question(
      questionText:
          'What is the most important factor to consider when coupling and uncoupling double or triple trailers?',
      answers: [
        Answer(answerText: 'The order of the trailers', isCorrect: true),
        Answer(answerText: 'The color of the trailers', isCorrect: false),
        Answer(answerText: 'The brand of the trailers', isCorrect: false),
        Answer(answerText: 'The time of day', isCorrect: false),
      ],
      explanation:
          'When coupling and uncoupling double or triple trailers, the most important factor is the order of the trailers, as it affects the handling and stability of the entire unit.',
    ),
    Question(
      questionText:
          'Why is it important to regularly check the air lines and electrical lines in double or triple trailers?',
      answers: [
        Answer(
            answerText: 'To maintain the correct color coding',
            isCorrect: false),
        Answer(
            answerText: 'To ensure proper braking and lighting',
            isCorrect: true),
        Answer(answerText: 'To keep them clean', isCorrect: false),
        Answer(answerText: 'To prevent theft', isCorrect: false),
      ],
      explanation:
          'Regularly checking the air lines and electrical lines in double or triple trailers is crucial to ensure that the braking systems and lights are functioning properly for safe operation.',
    ),
    Question(
      questionText:
          'What should a driver do before making a turn with double or triple trailers?',
      answers: [
        Answer(answerText: 'Increase speed', isCorrect: false),
        Answer(answerText: 'Signal earlier than usual', isCorrect: true),
        Answer(answerText: 'Turn off the radio', isCorrect: false),
        Answer(answerText: 'Change lanes repeatedly', isCorrect: false),
      ],
      explanation:
          'Before making a turn with double or triple trailers, the driver should signal earlier than usual to warn other road users, due to the increased length and turning radius of the vehicle.',
    ),
    Question(
      questionText:
          'When driving double or triple trailers, what is the impact of a "crack-the-whip" effect?',
      answers: [
        Answer(answerText: 'It increases fuel efficiency', isCorrect: false),
        Answer(answerText: 'It decreases braking distance', isCorrect: false),
        Answer(
            answerText: 'It can cause the rear trailer to overturn',
            isCorrect: true),
        Answer(answerText: 'It stabilizes the trailers', isCorrect: false),
      ],
      explanation:
          'The "crack-the-whip" effect in double or triple trailers can cause the rear trailer to overturn due to rapid changes in direction or speed, especially during lane changes or avoidance maneuvers.',
    ),
    Question(
      questionText:
          'What must a driver check when connecting the converter dolly to the rear trailer in a double or triple setup?',
      answers: [
        Answer(answerText: 'The height of the dolly', isCorrect: true),
        Answer(answerText: 'The color of the dolly', isCorrect: false),
        Answer(answerText: 'The brand of the dolly', isCorrect: false),
        Answer(answerText: 'The age of the dolly', isCorrect: false),
      ],
      explanation:
          'When connecting the converter dolly to the rear trailer, the driver must check the height of the dolly to ensure it matches the height of the trailer for a proper connection.',
    ),
    Question(
      questionText:
          'Why is it more challenging to stop double or triple trailers than a single trailer?',
      answers: [
        Answer(
            answerText: 'Due to increased number of axles', isCorrect: false),
        Answer(answerText: 'Due to the longer overall length', isCorrect: true),
        Answer(
            answerText: 'Due to the color of the trailers', isCorrect: false),
        Answer(
            answerText: 'Due to the different types of cargo',
            isCorrect: false),
      ],
      explanation:
          'Stopping double or triple trailers is more challenging than a single trailer due to the longer overall length, which increases the stopping distance.',
    ),
    Question(
      questionText:
          'How should you position the heaviest trailer in a double or triple combination?',
      answers: [
        Answer(answerText: 'At the rear', isCorrect: false),
        Answer(
            answerText: 'At the front nearest to the tractor', isCorrect: true),
        Answer(answerText: 'In the middle', isCorrect: false),
        Answer(answerText: 'Position does not matter', isCorrect: false),
      ],
      explanation:
          'In a double or triple combination, the heaviest trailer should be positioned at the front nearest to the tractor for better stability and control.',
    ),
    Question(
      questionText:
          'What is the main hazard when pulling double or triple trailers during high winds?',
      answers: [
        Answer(answerText: 'Increased fuel consumption', isCorrect: false),
        Answer(answerText: 'Reduced visibility due to dust', isCorrect: false),
        Answer(answerText: 'Risk of trailer rollover', isCorrect: true),
        Answer(
            answerText: 'Difficulty in changing radio stations',
            isCorrect: false),
      ],
      explanation:
          'The main hazard when pulling double or triple trailers during high winds is the increased risk of trailer rollover due to the large surface area of the trailers.',
    ),
    Question(
      questionText:
          'What must a driver consider when driving double or triple trailers on a curved road?',
      answers: [
        Answer(
            answerText:
                'The trailers will off-track less than a single trailer',
            isCorrect: false),
        Answer(answerText: 'The need for more acceleration', isCorrect: false),
        Answer(answerText: 'The increased off-tracking', isCorrect: true),
        Answer(answerText: 'The need to use high beams', isCorrect: false),
      ],
      explanation:
          'When driving double or triple trailers on a curved road, the driver must consider the increased off-tracking, where the rear trailers will take a wider path than the front.',
    ),
    Question(
      questionText:
          'What is an important factor to check before driving double or triple trailers?',
      answers: [
        Answer(
            answerText: 'The weather forecast for the entire route',
            isCorrect: false),
        Answer(
            answerText: 'The functionality of all coupling devices',
            isCorrect: true),
        Answer(answerText: 'The availability of rest stops', isCorrect: false),
        Answer(answerText: 'The radio signal strength', isCorrect: false),
      ],
      explanation:
          'Before driving double or triple trailers, it is important to check the functionality of all coupling devices to ensure a secure connection between the trailers.',
    ),
    Question(
      questionText:
          'How does the stopping distance of double or triple trailers compare to single trailers?',
      answers: [
        Answer(answerText: 'It is shorter', isCorrect: false),
        Answer(answerText: 'It is about the same', isCorrect: false),
        Answer(answerText: 'It is longer', isCorrect: true),
        Answer(
            answerText: 'It depends on the color of the trailers',
            isCorrect: false),
      ],
      explanation:
          'The stopping distance of double or triple trailers is typically longer than that of single trailers due to the increased weight and length of the combination.',
    ),
    Question(
      questionText:
          'What should you do if one of the trailers in a double or triple combination begins to sway?',
      answers: [
        Answer(answerText: 'Accelerate rapidly', isCorrect: false),
        Answer(answerText: 'Brake hard immediately', isCorrect: false),
        Answer(
            answerText: 'Steer in the direction of the sway', isCorrect: false),
        Answer(
            answerText: 'Ease off the accelerator and steer straight',
            isCorrect: true),
      ],
      explanation:
          'If one of the trailers begins to sway, the driver should ease off the accelerator and steer straight to regain control and prevent the sway from worsening.',
    ),
    Question(
      questionText:
          'What is the correct procedure for checking that air is flowing to all trailers in a double or triple combination?',
      answers: [
        Answer(
            answerText: 'Checking the air gauge on the dashboard',
            isCorrect: false),
        Answer(
            answerText: 'Listening for air flow at the rear of each trailer',
            isCorrect: true),
        Answer(
            answerText: 'Feeling the tires for air pressure', isCorrect: false),
        Answer(
            answerText: 'Driving a short distance and testing the brakes',
            isCorrect: false),
      ],
      explanation:
          'To check that air is flowing to all trailers, the driver should listen for air flow at the rear of each trailer, ensuring that the brake system is functioning throughout the entire combination.',
    ),
    Question(
      questionText:
          'Why should drivers avoid sudden lane changes with double or triple trailers?',
      answers: [
        Answer(answerText: 'To prevent disturbing the cargo', isCorrect: false),
        Answer(answerText: 'To reduce fuel consumption', isCorrect: false),
        Answer(
            answerText: 'To avoid the risk of rollover or jackknife',
            isCorrect: true),
        Answer(answerText: 'To maintain radio reception', isCorrect: false),
      ],
      explanation:
          'Sudden lane changes with double or triple trailers should be avoided to minimize the risk of rollover or jackknife due to the length and instability of the combination.',
    ),
    Question(
      questionText:
          'What additional skill is required for backing double trailers compared to single trailers?',
      answers: [
        Answer(
            answerText: 'Using side mirrors more frequently', isCorrect: false),
        Answer(answerText: 'Greater coordination and control', isCorrect: true),
        Answer(answerText: 'Backing at a higher speed', isCorrect: false),
        Answer(answerText: 'Using only the rearview mirror', isCorrect: false),
      ],
      explanation:
          'Backing double trailers requires greater coordination and control compared to single trailers due to the increased length and the pivot points between the trailers.',
    ),
    Question(
      questionText:
          'How do double or triple trailers affect the vehicle’s turning radius?',
      answers: [
        Answer(
            answerText: 'They decrease the turning radius', isCorrect: false),
        Answer(
            answerText: 'They have no effect on the turning radius',
            isCorrect: false),
        Answer(answerText: 'They increase the turning radius', isCorrect: true),
        Answer(answerText: 'They allow tighter turns', isCorrect: false),
      ],
      explanation:
          'Double or triple trailers increase the vehicle’s turning radius, requiring wider turns and more space to maneuver.',
    ),
    Question(
      questionText:
          'Why is weight distribution critical in double or triple trailers?',
      answers: [
        Answer(
            answerText: 'To comply with color regulations', isCorrect: false),
        Answer(answerText: 'To maximize cargo space', isCorrect: false),
        Answer(
            answerText: 'To maintain vehicle balance and stability',
            isCorrect: true),
        Answer(
            answerText: 'To increase the speed of the vehicle',
            isCorrect: false),
      ],
      explanation:
          'Proper weight distribution in double or triple trailers is critical to maintain vehicle balance and stability, especially when braking and turning.',
    ),
    Question(
      questionText:
          'What should you do when approaching a curve with a double or triple trailer combination?',
      answers: [
        Answer(answerText: 'Speed up to maintain momentum', isCorrect: false),
        Answer(answerText: 'Maintain the current speed', isCorrect: false),
        Answer(
            answerText: 'Reduce speed before entering the curve',
            isCorrect: true),
        Answer(answerText: 'Use only engine braking', isCorrect: false),
      ],
      explanation:
          'When approaching a curve with a double or triple trailer combination, you should reduce speed before entering the curve to prevent rollover and maintain control.',
    ),
    Question(
      questionText:
          'What additional considerations should be made for parking double or triple trailers?',
      answers: [
        Answer(
            answerText: 'Choosing a parking spot with good lighting',
            isCorrect: false),
        Answer(
            answerText: 'Ensuring enough space for the entire combination',
            isCorrect: true),
        Answer(
            answerText: 'Parking only in designated double-trailer spots',
            isCorrect: false),
        Answer(answerText: 'Parking facing downhill', isCorrect: false),
      ],
      explanation:
          'When parking double or triple trailers, it is important to ensure there is enough space for the entire combination and that the area is safe for such long vehicles.',
    ),
    Question(
      questionText:
          'What is the main hazard when driving double or triple trailers on wet roads?',
      answers: [
        Answer(answerText: 'Increased stopping distances', isCorrect: true),
        Answer(answerText: 'Decreased cargo weight', isCorrect: false),
        Answer(answerText: 'Higher fuel consumption', isCorrect: false),
        Answer(answerText: 'Brighter tail lights', isCorrect: false),
      ],
      explanation:
          'The main hazard when driving double or triple trailers on wet roads is increased stopping distances due to the added weight and length of the vehicle combination.',
    ),
    Question(
      questionText:
          'How should the air pressure be maintained in the braking systems of double or triple trailers?',
      answers: [
        Answer(
            answerText: 'At a lower pressure than in single trailers',
            isCorrect: false),
        Answer(
            answerText: 'At a higher pressure than in single trailers',
            isCorrect: false),
        Answer(answerText: 'Equal in all trailers', isCorrect: true),
        Answer(answerText: 'No air pressure is needed', isCorrect: false),
      ],
      explanation:
          'The air pressure in the braking systems of double or triple trailers should be maintained equally in all trailers to ensure effective and even braking.',
    ),
    Question(
      questionText:
          'What is the purpose of a converter dolly in a double-triple trailer setup?',
      answers: [
        Answer(
            answerText: 'To convert the trailer for different cargo types',
            isCorrect: false),
        Answer(answerText: 'To connect two trailers together', isCorrect: true),
        Answer(answerText: 'To increase the fuel efficiency', isCorrect: false),
        Answer(answerText: 'To reduce the overall weight', isCorrect: false),
      ],
      explanation:
          'A converter dolly is used in a double-triple trailer setup to connect two trailers together, allowing them to be towed as a single unit.',
    ),
    Question(
      questionText:
          'Why should drivers avoid sudden braking in double or triple trailers?',
      answers: [
        Answer(answerText: 'To prevent cargo damage', isCorrect: false),
        Answer(
            answerText: 'To avoid jackknifing or loss of control',
            isCorrect: true),
        Answer(answerText: 'To reduce noise pollution', isCorrect: false),
        Answer(answerText: 'To conserve fuel', isCorrect: false),
      ],
      explanation:
          'Drivers should avoid sudden braking in double or triple trailers to prevent jackknifing or loss of control, as the force can cause the trailers to swing out or skid.',
    ),
    Question(
      questionText:
          'What additional license endorsement is required to operate double or triple trailers?',
      answers: [
        Answer(answerText: 'Tanker endorsement', isCorrect: false),
        Answer(
            answerText: 'Double-triple trailer endorsement', isCorrect: true),
        Answer(answerText: 'Passenger endorsement', isCorrect: false),
        Answer(answerText: 'Motorcycle endorsement', isCorrect: false),
      ],
      explanation:
          'To operate double or triple trailers, drivers need a double-triple trailer endorsement on their CDL, indicating they have met specific training and skill requirements.',
    ),
    Question(
      questionText:
          'How does the weight distribution of cargo affect the handling of double or triple trailers?',
      answers: [
        Answer(answerText: 'It has no effect', isCorrect: false),
        Answer(
            answerText: 'Heavier cargo should be placed at the rear',
            isCorrect: false),
        Answer(
            answerText: 'Even distribution is crucial for stability',
            isCorrect: true),
        Answer(
            answerText: 'Cargo should be concentrated in the center',
            isCorrect: false),
      ],
      explanation:
          'Even weight distribution of cargo in double or triple trailers is crucial for stability and safe handling, especially during braking and turning.',
    ),
    Question(
      questionText:
          'What should be checked regularly when driving double or triple trailers?',
      answers: [
        Answer(answerText: 'Radio signal strength', isCorrect: false),
        Answer(answerText: 'Mirror adjustments', isCorrect: true),
        Answer(answerText: 'Seat comfort levels', isCorrect: false),
        Answer(answerText: 'Interior cabin temperature', isCorrect: false),
      ],
      explanation:
          'Regularly checking mirror adjustments is important when driving double or triple trailers to ensure clear visibility of all trailers and surrounding traffic.',
    ),
    Question(
      questionText:
          'What is critical to remember about the rear trailer in a double or triple combination?',
      answers: [
        Answer(answerText: 'It requires more braking force', isCorrect: false),
        Answer(answerText: 'It is more susceptible to sway', isCorrect: true),
        Answer(answerText: 'It carries less weight', isCorrect: false),
        Answer(
            answerText: 'It should be the longest trailer', isCorrect: false),
      ],
      explanation:
          'The rear trailer in a double or triple combination is more susceptible to sway, especially in windy conditions or during quick maneuvers.',
    ),
    Question(
      questionText:
          'Why is it important to conduct a thorough pre-trip inspection on double or triple trailers?',
      answers: [
        Answer(
            answerText: 'To ensure all trailers are the same color',
            isCorrect: false),
        Answer(
            answerText: 'To identify any potential mechanical issues',
            isCorrect: true),
        Answer(answerText: 'To check for fuel levels', isCorrect: false),
        Answer(answerText: 'To adjust the cargo load', isCorrect: false),
      ],
      explanation:
          'Conducting a thorough pre-trip inspection on double or triple trailers is important to identify any potential mechanical or safety issues before starting a journey.',
    ),
    Question(
      questionText:
          'How should a driver manage lane changes with double or triple trailers?',
      answers: [
        Answer(answerText: 'Change lanes frequently', isCorrect: false),
        Answer(answerText: 'Make abrupt lane changes', isCorrect: false),
        Answer(
            answerText: 'Plan and execute lane changes carefully and smoothly',
            isCorrect: true),
        Answer(
            answerText: 'Use only side mirrors for lane changes',
            isCorrect: false),
      ],
      explanation:
          'Lane changes with double or triple trailers should be planned and executed carefully and smoothly, taking into account the increased length and reduced maneuverability.',
    ),
    Question(
      questionText:
          'What factor increases the risk of rollover in double or triple trailers?',
      answers: [
        Answer(answerText: 'Using high-beam headlights', isCorrect: false),
        Answer(answerText: 'High center of gravity', isCorrect: true),
        Answer(answerText: 'Using cruise control', isCorrect: false),
        Answer(answerText: 'Driving in the right lane', isCorrect: false),
      ],
      explanation:
          'A high center of gravity increases the risk of rollover in double or triple trailers, especially during turns or sudden maneuvers.',
    ),
    Question(
      questionText:
          'What is essential when connecting air and electrical lines between trailers in double or triple combinations?',
      answers: [
        Answer(answerText: 'Ensuring they are color-coded', isCorrect: false),
        Answer(
            answerText: 'Making sure there are no leaks or damage',
            isCorrect: true),
        Answer(
            answerText: 'Connecting them in alphabetical order',
            isCorrect: false),
        Answer(
            answerText: 'Using the longest available lines', isCorrect: false),
      ],
      explanation:
          'When connecting air and electrical lines between trailers in double or triple combinations, it is essential to ensure there are no leaks or damage to maintain proper operation.',
    ),
    Question(
      questionText: 'How should cargo be secured in double or triple trailers?',
      answers: [
        Answer(answerText: 'Loosely to allow for movement', isCorrect: false),
        Answer(answerText: 'Only in the front trailer', isCorrect: false),
        Answer(
            answerText: 'Tightly and evenly to prevent shifting',
            isCorrect: true),
        Answer(answerText: 'In the rear trailer only', isCorrect: false),
      ],
      explanation:
          'Cargo in double or triple trailers should be secured tightly and evenly to prevent shifting, which can affect stability and handling.',
    ),
    Question(
      questionText:
          'What additional consideration is necessary when making wide turns with double or triple trailers?',
      answers: [
        Answer(answerText: 'Using four-way flashers', isCorrect: false),
        Answer(
            answerText: 'Allowing for increased off-tracking', isCorrect: true),
        Answer(answerText: 'Turning the radio off', isCorrect: false),
        Answer(answerText: 'Speeding up through the turn', isCorrect: false),
      ],
      explanation:
          'When making wide turns with double or triple trailers, allowing for increased off-tracking of the rear trailers is necessary to avoid hitting curbs or other objects.',
    ),
    Question(
      questionText:
          'What should a driver do before descending a long downgrade with double or triple trailers?',
      answers: [
        Answer(answerText: 'Shift to a higher gear', isCorrect: false),
        Answer(answerText: 'Check the weather report', isCorrect: false),
        Answer(
            answerText: 'Downshift to a lower gear and use engine braking',
            isCorrect: true),
        Answer(
            answerText: 'Increase speed to get down faster', isCorrect: false),
      ],
      explanation:
          'Before descending a long downgrade with double or triple trailers, a driver should downshift to a lower gear and use engine braking to maintain a safe, controlled speed.',
    ),
    Question(
      questionText:
          'How does increasing the following distance benefit drivers of double or triple trailers?',
      answers: [
        Answer(
            answerText: 'Allows for better radio reception', isCorrect: false),
        Answer(
            answerText: 'Gives more time to react and stop safely',
            isCorrect: true),
        Answer(answerText: 'Reduces fuel consumption', isCorrect: false),
        Answer(answerText: 'Improves the view of road signs', isCorrect: false),
      ],
      explanation:
          'Increasing the following distance for drivers of double or triple trailers gives them more time to react and stop safely, considering the longer stopping distances required.',
    ),
    Question(
      questionText:
          'What additional safety checks should be performed for double or triple trailers compared to single trailers?',
      answers: [
        Answer(
            answerText: 'Checking the interior cleanliness', isCorrect: false),
        Answer(
            answerText: 'Ensuring all trailers have matching tire brands',
            isCorrect: false),
        Answer(
            answerText: 'Inspecting all coupling devices and air lines',
            isCorrect: true),
        Answer(
            answerText: 'Verifying the color of all trailers',
            isCorrect: false),
      ],
      explanation:
          'For double or triple trailers, it is crucial to inspect all coupling devices and air lines to ensure they are properly connected and functioning.',
    ),
    Question(
      questionText:
          'Why should sudden movements be avoided when driving double or triple trailers?',
      answers: [
        Answer(
            answerText: 'To prevent distracting other drivers',
            isCorrect: false),
        Answer(answerText: 'To reduce fuel consumption', isCorrect: false),
        Answer(
            answerText: 'To maintain control and prevent rollover',
            isCorrect: true),
        Answer(
            answerText: 'To keep the cargo from making noise',
            isCorrect: false),
      ],
      explanation:
          'Sudden movements should be avoided when driving double or triple trailers to maintain control of the vehicle and prevent rollover due to the increased length and weight.',
    ),
    Question(
      questionText:
          'What is a critical step when backing a double or triple trailer?',
      answers: [
        Answer(answerText: 'Using a spotter for guidance', isCorrect: true),
        Answer(
            answerText: 'Backing quickly to maintain momentum',
            isCorrect: false),
        Answer(answerText: 'Turning up the radio volume', isCorrect: false),
        Answer(answerText: 'Flashing the headlights', isCorrect: false),
      ],
      explanation:
          'Using a spotter for guidance is a critical step when backing a double or triple trailer due to the limited visibility and complex maneuvering required.',
    ),
    Question(
      questionText:
          'What should a driver regularly monitor when pulling double or triple trailers?',
      answers: [
        Answer(answerText: 'Roadside billboards', isCorrect: false),
        Answer(answerText: 'The fuel gauge only', isCorrect: false),
        Answer(
            answerText: 'Air pressure in all braking systems', isCorrect: true),
        Answer(answerText: 'The number of trailers', isCorrect: false),
      ],
      explanation:
          'A driver pulling double or triple trailers should regularly monitor the air pressure in all braking systems to ensure they are operating correctly and safely.',
    ),
    Question(
        questionText:
            'How should you adjust your driving in high wind conditions with double or triple trailers?',
        answers: [
          Answer(
              answerText: 'Drive faster to minimize wind impact',
              isCorrect: false),
          Answer(
              answerText: 'Reduce speed and increase following distance',
              isCorrect: true),
          Answer(
              answerText: 'Use the brakes frequently to maintain control',
              isCorrect: false),
          Answer(answerText: 'No adjustment is necessary', isCorrect: false)
        ],
        explanation:
            'In high wind conditions, it is important to reduce speed and increase the following distance to maintain control of double or triple trailers.'),
    Question(
        questionText:
            'What is the proper way to navigate a steep downgrade with double or triple trailers?',
        answers: [
          Answer(
              answerText: 'Accelerate down the hill to get over quickly',
              isCorrect: false),
          Answer(
              answerText: 'Use a lower gear and apply steady braking',
              isCorrect: true),
          Answer(
              answerText: 'Maintain a constant speed with regular brakes',
              isCorrect: false),
          Answer(
              answerText: 'Stop at the top of the hill and proceed slowly',
              isCorrect: false)
        ],
        explanation:
            'On a steep downgrade, it is best to use a lower gear and apply steady braking to maintain a safe speed and control.'),
    Question(
        questionText:
            'What additional safety measure is important when operating double or triple trailers?',
        answers: [
          Answer(
              answerText: 'Using hazard lights at all times', isCorrect: false),
          Answer(
              answerText: 'Conducting thorough pre-trip inspections',
              isCorrect: true),
          Answer(answerText: 'Avoiding use of the mirrors', isCorrect: false),
          Answer(answerText: 'Driving in the left lane only', isCorrect: false)
        ],
        explanation:
            'Thorough pre-trip inspections are crucial for double or triple trailers to ensure all connections and equipment are secure and functioning properly.'),
    Question(
        questionText:
            'Why is backing up not recommended with double or triple trailers?',
        answers: [
          Answer(answerText: 'It is illegal in most states', isCorrect: false),
          Answer(
              answerText: 'It can lead to jackknifing or loss of control',
              isCorrect: true),
          Answer(answerText: 'It consumes too much fuel', isCorrect: false),
          Answer(answerText: 'The trailers might disconnect', isCorrect: false)
        ],
        explanation:
            'Backing up with double or triple trailers is generally not recommended due to the high risk of jackknifing or losing control of the vehicle.'),
    Question(
        questionText:
            'What should you do before changing lanes with double or triple trailers?',
        answers: [
          Answer(
              answerText: 'Accelerate to match the traffic speed',
              isCorrect: false),
          Answer(
              answerText: 'Check mirrors and blind spots thoroughly',
              isCorrect: true),
          Answer(
              answerText: 'Turn on the emergency flashers', isCorrect: false),
          Answer(
              answerText: 'Change lanes quickly to minimize time',
              isCorrect: false)
        ],
        explanation:
            'Before changing lanes, it is essential to check mirrors and blind spots thoroughly due to the increased length and limited visibility with double or triple trailers.'),
    Question(
        questionText:
            'What is the significance of checking air brake connections in double or triple trailers?',
        answers: [
          Answer(answerText: 'It is a legal requirement', isCorrect: false),
          Answer(
              answerText: 'Ensures all trailers have braking capability',
              isCorrect: true),
          Answer(
              answerText: 'Prevents air leaks in the cabin', isCorrect: false),
          Answer(answerText: 'Improves fuel efficiency', isCorrect: false)
        ],
        explanation:
            'Checking air brake connections ensures that all trailers have proper braking capability, which is crucial for safety in double or triple trailers.'),
    Question(
        questionText:
            'How do double or triple trailers affect the maneuverability of a vehicle?',
        answers: [
          Answer(
              answerText: 'Improves maneuverability significantly',
              isCorrect: false),
          Answer(
              answerText: 'Does not affect maneuverability', isCorrect: false),
          Answer(
              answerText: 'Reduces maneuverability, especially in tight spaces',
              isCorrect: true),
          Answer(
              answerText: 'Only affects maneuverability in reverse',
              isCorrect: false)
        ],
        explanation:
            'Double or triple trailers reduce the maneuverability of a vehicle, particularly in tight spaces or when making turns.'),
    Question(
        questionText:
            'What is the best practice for maintaining control on a downhill grade with double or triple trailers?',
        answers: [
          Answer(answerText: 'Use only the engine brake', isCorrect: false),
          Answer(
              answerText: 'Alternate between braking and coasting',
              isCorrect: true),
          Answer(
              answerText: 'Brake continuously to maintain a slow speed',
              isCorrect: false),
          Answer(answerText: 'Coast down the hill in neutral', isCorrect: false)
        ],
        explanation:
            'On a downhill grade, it is best to alternate between braking and coasting to maintain control while preventing brake overheating.'),
    Question(
        questionText:
            'How should you approach curves and turns when pulling double or triple trailers?',
        answers: [
          Answer(
              answerText: 'Take curves and turns at higher speeds',
              isCorrect: false),
          Answer(
              answerText: 'Approach and execute at lower speeds',
              isCorrect: true),
          Answer(
              answerText: 'Maintain normal speed as with single trailers',
              isCorrect: false),
          Answer(
              answerText: 'Take the inside lane for tighter turns',
              isCorrect: false)
        ],
        explanation:
            'When pulling double or triple trailers, curves and turns should be approached and executed at lower speeds to ensure stability and prevent rollover.'),
    Question(
        questionText:
            'What should be the focus during a pre-trip inspection of double or triple trailers?',
        answers: [
          Answer(answerText: 'Interior comfort settings', isCorrect: false),
          Answer(
              answerText: 'Cosmetic appearance of trailers', isCorrect: false),
          Answer(
              answerText: 'Securing of cargo and connection points',
              isCorrect: true),
          Answer(
              answerText: 'Radio and communication devices', isCorrect: false)
        ],
        explanation:
            'The focus during a pre-trip inspection should be on securing the cargo and checking all connection points for safety in double or triple trailers.'),
    Question(
        questionText:
            'What additional precautions should be taken when loading cargo into double or triple trailers?',
        answers: [
          Answer(
              answerText: 'Loading cargo only in the front trailer',
              isCorrect: false),
          Answer(
              answerText:
                  'Ensuring even weight distribution across all trailers',
              isCorrect: true),
          Answer(
              answerText: 'Placing the heaviest cargo on top',
              isCorrect: false),
          Answer(
              answerText: 'Loading cargo without securing it', isCorrect: false)
        ],
        explanation:
            'When loading cargo into double or triple trailers, it is important to ensure even weight distribution across all trailers for stability and safety.'),
    Question(
        questionText:
            'What is a key factor to check when connecting the second and third trailers in a triple trailer setup?',
        answers: [
          Answer(
              answerText: 'The color scheme of the trailers', isCorrect: false),
          Answer(answerText: 'The branding on the trailers', isCorrect: false),
          Answer(
              answerText: 'The locking mechanisms on the pintle hook',
              isCorrect: true),
          Answer(answerText: 'The size of the trailers', isCorrect: false)
        ],
        explanation:
            'A key factor to check when connecting the second and third trailers is the locking mechanisms on the pintle hook to ensure a secure attachment.'),
    Question(
        questionText:
            'Why is it important to have extra space ahead when driving double or triple trailers?',
        answers: [
          Answer(answerText: 'For better fuel efficiency', isCorrect: false),
          Answer(
              answerText: 'To allow more time for lane changes',
              isCorrect: false),
          Answer(
              answerText: 'For increased stopping distance', isCorrect: true),
          Answer(
              answerText: 'To improve visibility of road signs',
              isCorrect: false)
        ],
        explanation:
            'Having extra space ahead when driving double or triple trailers is important due to the increased stopping distance required by the longer vehicle combination.'),
    Question(
        questionText:
            'What should you do if the rear trailer of a double or triple begins to skid?',
        answers: [
          Answer(
              answerText: 'Accelerate to straighten the trailer',
              isCorrect: false),
          Answer(answerText: 'Brake hard to regain control', isCorrect: false),
          Answer(
              answerText: 'Ease off the accelerator and steer gently',
              isCorrect: true),
          Answer(answerText: 'Quickly change lanes', isCorrect: false)
        ],
        explanation:
            'If the rear trailer begins to skid, ease off the accelerator and steer gently to regain control and avoid a potential jackknife.'),
    Question(
        questionText:
            'How should you inspect the coupling devices in a double or triple trailer setup?',
        answers: [
          Answer(
              answerText: 'Visually check for general appearance',
              isCorrect: false),
          Answer(
              answerText: 'Ensure they are locked and secure', isCorrect: true),
          Answer(
              answerText: 'Check only the front coupling device',
              isCorrect: false),
          Answer(
              answerText: 'Inspect them only at the end of a trip',
              isCorrect: false)
        ],
        explanation:
            'Inspecting the coupling devices involves ensuring that they are properly locked and secure to prevent disconnection during transit.'),
    Question(
        questionText:
            'What are the consequences of not evenly distributing cargo in double or triple trailers?',
        answers: [
          Answer(answerText: 'Increased fuel consumption', isCorrect: false),
          Answer(answerText: 'More frequent rest stops', isCorrect: false),
          Answer(answerText: 'Reduced radio signal strength', isCorrect: false),
          Answer(
              answerText: 'Increased risk of rollover or loss of control',
              isCorrect: true)
        ],
        explanation:
            'Not evenly distributing cargo in double or triple trailers can lead to an increased risk of rollover or loss of control due to uneven weight distribution.'),
    Question(
        questionText:
            'Why is it important to secure all air and electrical lines in double or triple trailers?',
        answers: [
          Answer(
              answerText: 'To prevent them from dragging on the road',
              isCorrect: true),
          Answer(
              answerText: 'To improve the vehicle’s appearance',
              isCorrect: false),
          Answer(answerText: 'To avoid radio interference', isCorrect: false),
          Answer(answerText: 'To keep them clean', isCorrect: false)
        ],
        explanation:
            'Securing all air and electrical lines is crucial to prevent them from dragging on the road, which could lead to damage or disconnection.'),
    Question(
        questionText:
            'What should you be aware of when driving double or triple trailers in urban areas?',
        answers: [
          Answer(
              answerText: 'The need for more frequent fuel stops',
              isCorrect: false),
          Answer(
              answerText: 'Tighter turning spaces and more traffic',
              isCorrect: true),
          Answer(
              answerText: 'The requirement to use alternative routes',
              isCorrect: false),
          Answer(answerText: 'Increased toll fees', isCorrect: false)
        ],
        explanation:
            'In urban areas, drivers of double or triple trailers need to be aware of tighter turning spaces and increased traffic, requiring more caution and attention.'),
    Question(
        questionText:
            'What should you do to ensure stability when driving a double or triple trailer on a highway?',
        answers: [
          Answer(answerText: 'Change lanes frequently', isCorrect: false),
          Answer(
              answerText: 'Maintain a consistent speed and lane position',
              isCorrect: true),
          Answer(answerText: 'Use only the rightmost lane', isCorrect: false),
          Answer(answerText: 'Drive below the speed limit', isCorrect: false)
        ],
        explanation:
            'To ensure stability on a highway, maintaining a consistent speed and lane position is important for drivers of double or triple trailers.'),
    Question(
        questionText:
            'How does the braking performance of double or triple trailers compare to single trailers?',
        answers: [
          Answer(answerText: 'It is more responsive', isCorrect: false),
          Answer(
              answerText: 'It is less effective and requires more distance',
              isCorrect: true),
          Answer(answerText: 'There is no difference', isCorrect: false),
          Answer(
              answerText: 'Only the front trailer’s brakes are effective',
              isCorrect: false)
        ],
        explanation:
            'The braking performance of double or triple trailers is generally less effective than single trailers, requiring more distance to come to a complete stop.'),
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
