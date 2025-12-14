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

class CombinationVehiclesTest2024 extends StatefulWidget {
  const CombinationVehiclesTest2024({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CombinationVehiclesTest2024State createState() =>
      _CombinationVehiclesTest2024State();
}

class _CombinationVehiclesTest2024State
    extends State<CombinationVehiclesTest2024> {
  int currentQuestionIndex = 0;
  bool showNextButton = false;

  final List<Question> questions = [
    Question(
      questionText:
          'What is the most important reason for doing a vehicle inspection?',
      answers: [
        Answer(answerText: 'To avoid traffic violations', isCorrect: false),
        Answer(answerText: 'Safety', isCorrect: true),
        Answer(answerText: 'To increase fuel efficiency', isCorrect: false),
        Answer(answerText: 'To prevent cargo damage', isCorrect: false),
      ],
      explanation:
          'Safety is the most important reason for conducting vehicle inspections, ensuring that the vehicle and its components are in good working condition to prevent accidents and breakdowns.',
    ),
    Question(
      questionText: 'What is off-tracking?',
      answers: [
        Answer(answerText: 'When a vehicle loses traction', isCorrect: false),
        Answer(
            answerText:
                'When the rear wheels follow a tighter path than the front wheels',
            isCorrect: true),
        Answer(
            answerText: 'When the engine turns off unexpectedly',
            isCorrect: false),
        Answer(
            answerText: 'When cargo shifts off the trailer', isCorrect: false),
      ],
      explanation:
          'Off-tracking occurs when the rear wheels of a combination vehicle follow a tighter path than the front wheels during a turn, common in vehicles with trailers.',
    ),
    Question(
      questionText:
          'Why should you lock the trailer brakes before backing under a trailer?',
      answers: [
        Answer(
            answerText: 'To prevent the trailer from rolling away',
            isCorrect: true),
        Answer(
            answerText: 'To align the trailer with the dock', isCorrect: false),
        Answer(answerText: 'To adjust the trailer height', isCorrect: false),
        Answer(answerText: 'To test the trailer brakes', isCorrect: false),
      ],
      explanation:
          'Locking the trailer brakes prevents the trailer from moving or rolling away as you back the tractor under it.',
    ),
    Question(
      questionText: 'What is a "tractor jackknife"?',
      answers: [
        Answer(
            answerText: 'When the tractor and trailer form an acute angle',
            isCorrect: true),
        Answer(answerText: 'When the tractor engine fails', isCorrect: false),
        Answer(answerText: 'When the tractor tires go flat', isCorrect: false),
        Answer(
            answerText: 'When the tractor disconnects from the trailer',
            isCorrect: false),
      ],
      explanation:
          'A "tractor jackknife" occurs when the tractor and the trailer form an acute angle, often due to sudden braking or slippery conditions.',
    ),
    Question(
      questionText: 'What should you do if your trailer begins to skid?',
      answers: [
        Answer(answerText: 'Accelerate quickly', isCorrect: false),
        Answer(answerText: 'Brake hard to regain control', isCorrect: false),
        Answer(
            answerText: 'Release the brakes to regain traction',
            isCorrect: true),
        Answer(
            answerText: 'Turn the steering wheel in the direction of the skid',
            isCorrect: false),
      ],
      explanation:
          'If your trailer begins to skid, you should release the brakes to allow the tires to regain traction and then gently apply the brakes once control is regained.',
    ),
    Question(
      questionText:
          'What is the proper following distance for a combination vehicle?',
      answers: [
        Answer(
            answerText: 'At least 1 second for every 10 feet of vehicle length',
            isCorrect: true),
        Answer(
            answerText: '2 seconds behind the vehicle in front',
            isCorrect: false),
        Answer(answerText: 'Equal to the vehicle length', isCorrect: false),
        Answer(answerText: 'Half of the vehicle length', isCorrect: false),
      ],
      explanation:
          'The proper following distance for a combination vehicle is at least 1 second for every 10 feet of vehicle length to allow for safe stopping.',
    ),
    Question(
      questionText:
          'Why should you be cautious when pulling a trailer with a low underneath clearance?',
      answers: [
        Answer(answerText: 'It can limit your speed', isCorrect: false),
        Answer(
            answerText: 'It can cause the trailer to sway', isCorrect: false),
        Answer(
            answerText: 'The trailer can get stuck at railroad crossings',
            isCorrect: true),
        Answer(answerText: 'It increases fuel consumption', isCorrect: false),
      ],
      explanation:
          'Trailers with low underneath clearance can get stuck on raised railroad crossings or steep driveways.',
    ),
    Question(
      questionText:
          'What is the main reason for having a header board on a flatbed trailer?',
      answers: [
        Answer(answerText: 'To provide shade for the cargo', isCorrect: false),
        Answer(
            answerText:
                'To protect the driver from forward-moving cargo in the event of sudden stopping',
            isCorrect: true),
        Answer(answerText: 'To display the company logo', isCorrect: false),
        Answer(answerText: 'To prevent air drag', isCorrect: false),
      ],
      explanation:
          'The main purpose of a header board is to protect the driver from the risk of forward-moving cargo during sudden stops or accidents.',
    ),
    Question(
      questionText: 'What is the purpose of a sliding fifth wheel?',
      answers: [
        Answer(
            answerText: 'To adjust the weight distribution on the axles',
            isCorrect: true),
        Answer(
            answerText: 'To make it easier to connect the trailer',
            isCorrect: false),
        Answer(answerText: 'To reduce tire wear', isCorrect: false),
        Answer(answerText: 'To increase fuel efficiency', isCorrect: false),
      ],
      explanation:
          'A sliding fifth wheel is used to adjust the distribution of weight on the axles, ensuring compliance with axle weight limits and improving handling.',
    ),
    Question(
      questionText:
          'How should you test the tractor-semitrailer connection for security?',
      answers: [
        Answer(answerText: 'By driving slowly in a circle', isCorrect: false),
        Answer(answerText: 'By applying the service brake', isCorrect: false),
        Answer(
            answerText: 'By pulling against the locked trailer brakes',
            isCorrect: true),
        Answer(
            answerText:
                'By checking the security of the locking jaws with a flashlight',
            isCorrect: false),
      ],
      explanation:
          'To test the security of the tractor-semitrailer connection, you should gently pull against the locked trailer brakes and ensure that the connection is secure and does not separate.',
    ),
    Question(
      questionText:
          'What is the most common cause of rollovers with combination vehicles?',
      answers: [
        Answer(answerText: 'Brake failure', isCorrect: false),
        Answer(
            answerText: 'Turning too quickly at high speeds', isCorrect: true),
        Answer(answerText: 'Poor road conditions', isCorrect: false),
        Answer(answerText: 'Overloaded trailers', isCorrect: false),
      ],
      explanation:
          'The most common cause of rollovers with combination vehicles is turning too quickly at high speeds, which can cause the trailer to tip over.',
    ),
    Question(
      questionText:
          'Why should you be extra cautious when driving a combination vehicle with an empty trailer?',
      answers: [
        Answer(
            answerText: 'The trailer is more likely to sway', isCorrect: true),
        Answer(
            answerText: 'The trailer is more likely to get stuck',
            isCorrect: false),
        Answer(answerText: 'The stopping distance increases', isCorrect: false),
        Answer(answerText: 'It is more difficult to turn', isCorrect: false),
      ],
      explanation:
          'An empty trailer is lighter and therefore more prone to swaying or being pushed by wind, requiring extra caution while driving.',
    ),
    Question(
      questionText: 'What is the "crack-the-whip" effect?',
      answers: [
        Answer(
            answerText: 'The noise made by a broken exhaust system',
            isCorrect: false),
        Answer(
            answerText: 'A technique for reducing fuel consumption',
            isCorrect: false),
        Answer(
            answerText:
                'The snapping action of the last trailer in a combination vehicle during a quick lane change',
            isCorrect: true),
        Answer(
            answerText: 'The sound of tires popping under heavy load',
            isCorrect: false),
      ],
      explanation:
          'The "crack-the-whip" effect refers to the snapping action of the last trailer in a combination vehicle during a quick lane change or maneuver.',
    ),
    Question(
      questionText:
          'When connecting a converter dolly to a second or third trailer, what is the proper position for the trailer height?',
      answers: [
        Answer(
            answerText: 'Slightly higher than the center of the fifth wheel',
            isCorrect: true),
        Answer(answerText: 'Level with the fifth wheel', isCorrect: false),
        Answer(
            answerText: 'Slightly lower than the center of the fifth wheel',
            isCorrect: false),
        Answer(
            answerText: 'At the same height as the tractor', isCorrect: false),
      ],
      explanation:
          'When connecting a converter dolly to a trailer, the trailer height should be slightly higher than the center of the fifth wheel to ensure proper connection.',
    ),
    Question(
      questionText:
          'What is the primary function of the shut-off valves in the rear of a trailer?',
      answers: [
        Answer(answerText: 'To connect the electrical lines', isCorrect: false),
        Answer(answerText: 'To shut off the fuel supply', isCorrect: false),
        Answer(
            answerText:
                'To close the air lines when another trailer is not being towed',
            isCorrect: true),
        Answer(answerText: 'To lock the trailer doors', isCorrect: false),
      ],
      explanation:
          'Shut-off valves in the rear of a trailer are used to close the air lines when another trailer is not being towed, preventing air loss.',
    ),
    Question(
      questionText:
          'How does a longer combination vehicle affect stopping distance?',
      answers: [
        Answer(answerText: 'It decreases stopping distance', isCorrect: false),
        Answer(
            answerText: 'It has no effect on stopping distance',
            isCorrect: false),
        Answer(answerText: 'It increases stopping distance', isCorrect: true),
        Answer(
            answerText: 'It varies depending on the time of day',
            isCorrect: false),
      ],
      explanation:
          'A longer combination vehicle typically has an increased stopping distance due to the added weight and length.',
    ),
    Question(
      questionText:
          'What is the key factor in preventing rollovers when driving a combination vehicle?',
      answers: [
        Answer(answerText: 'Maintaining a high speed', isCorrect: false),
        Answer(
            answerText: 'Keeping the cargo as high as possible',
            isCorrect: false),
        Answer(
            answerText: 'Keeping the load well balanced and low',
            isCorrect: true),
        Answer(
            answerText: 'Using brakes instead of engine braking',
            isCorrect: false),
      ],
      explanation:
          'To prevent rollovers, it is crucial to keep the load well balanced and as low as possible in the trailer.',
    ),
    Question(
      questionText:
          'What should a driver do when making a turn with a combination vehicle?',
      answers: [
        Answer(
            answerText: 'Make the turn as sharply as possible',
            isCorrect: false),
        Answer(
            answerText: 'Make a wider turn to prevent off-tracking',
            isCorrect: true),
        Answer(
            answerText: 'Stop midway through the turn to check clearance',
            isCorrect: false),
        Answer(
            answerText: 'Accelerate quickly during the turn', isCorrect: false),
      ],
      explanation:
          'Drivers should make wider turns with combination vehicles to compensate for off-tracking and ensure the rear of the vehicle clears the turn.',
    ),
    Question(
      questionText:
          'What is the proper way to inspect the coupling between the tractor and the trailer?',
      answers: [
        Answer(
            answerText: 'Check it visually from a distance', isCorrect: false),
        Answer(answerText: 'Listen for any unusual noises', isCorrect: false),
        Answer(
            answerText: 'Physically check the locking jaws and the kingpin',
            isCorrect: true),
        Answer(answerText: 'Ensure the trailer is level', isCorrect: false),
      ],
      explanation:
          'To properly inspect the coupling, physically check the connection between the locking jaws and the kingpin to ensure it is secure.',
    ),
    Question(
      questionText:
          'Why should air tanks be drained regularly in a combination vehicle with air brakes?',
      answers: [
        Answer(
            answerText:
                'To reduce the risk of brake failure due to water freezing',
            isCorrect: true),
        Answer(answerText: 'To improve fuel efficiency', isCorrect: false),
        Answer(answerText: 'To decrease air pressure', isCorrect: false),
        Answer(
            answerText: 'To comply with weight regulations', isCorrect: false),
      ],
      explanation:
          'Draining air tanks regularly is essential to remove water that may freeze in cold weather, potentially causing brake failure due to blocked air lines.',
    ),
    Question(
      questionText:
          'What is the purpose of a dolly brake handle in a combination vehicle?',
      answers: [
        Answer(
            answerText: 'To control the trailer’s air conditioning',
            isCorrect: false),
        Answer(answerText: 'To adjust the trailer mirrors', isCorrect: false),
        Answer(answerText: 'To apply the brakes of the dolly', isCorrect: true),
        Answer(
            answerText: 'To lock the dolly wheels while parking',
            isCorrect: false),
      ],
      explanation:
          'The dolly brake handle in a combination vehicle is used to apply the brakes of the dolly, providing additional control and safety.',
    ),
    Question(
      questionText:
          'What should you check during a walk-around inspection of a combination vehicle?',
      answers: [
        Answer(
            answerText: 'Only the condition of the tractor', isCorrect: false),
        Answer(answerText: 'The security of the cargo', isCorrect: true),
        Answer(
            answerText: 'The paint and body for cosmetic damage',
            isCorrect: false),
        Answer(
            answerText: 'The comfort of the sleeping compartment',
            isCorrect: false),
      ],
      explanation:
          'During a walk-around inspection, it is important to check the security of the cargo, as well as the condition of the vehicle components and connections.',
    ),
    Question(
      questionText:
          'What is the recommended method to use when coupling a tractor to a semitrailer?',
      answers: [
        Answer(answerText: 'Back up at a high speed', isCorrect: false),
        Answer(answerText: 'Back up without using mirrors', isCorrect: false),
        Answer(
            answerText:
                'Back up slowly until the fifth wheel touches the trailer',
            isCorrect: true),
        Answer(
            answerText: 'Use the trailer brakes to adjust the height',
            isCorrect: false),
      ],
      explanation:
          'When coupling a tractor to a semitrailer, it is recommended to back up slowly until the fifth wheel touches the trailer, ensuring a safe and proper connection.',
    ),
    Question(
      questionText:
          'Why should you be cautious when driving a tractor without a trailer (bobtailing)?',
      answers: [
        Answer(answerText: 'It has a higher risk of skidding', isCorrect: true),
        Answer(answerText: 'It is illegal in most states', isCorrect: false),
        Answer(answerText: 'It consumes more fuel', isCorrect: false),
        Answer(answerText: 'It has increased stopping power', isCorrect: false),
      ],
      explanation:
          'Driving a tractor without a trailer (bobtailing) can be riskier due to a higher chance of skidding, as the weight distribution and handling characteristics are different.',
    ),
    Question(
      questionText:
          'When uncoupling a trailer, what should you do after you have shut off the trailer air supply and locked the trailer brakes?',
      answers: [
        Answer(answerText: 'Disconnect the electrical line', isCorrect: false),
        Answer(answerText: 'Lower the landing gear', isCorrect: true),
        Answer(
            answerText: 'Drive the tractor away from the trailer',
            isCorrect: false),
        Answer(
            answerText: 'Raise the trailer with the tractor', isCorrect: false),
      ],
      explanation:
          'After shutting off the air supply and locking the trailer brakes, the next step in uncoupling is to lower the landing gear to support the trailer.',
    ),
    Question(
      questionText: 'What is the most common type of trailer jackknife?',
      answers: [
        Answer(
            answerText: 'When the trailer swings to the right of the tractor',
            isCorrect: false),
        Answer(
            answerText: 'When the tractor spins around the trailer',
            isCorrect: false),
        Answer(
            answerText: 'When the trailer swings wide during a turn',
            isCorrect: true),
        Answer(
            answerText: 'When the trailer lifts off the ground',
            isCorrect: false),
      ],
      explanation:
          'The most common type of trailer jackknife is when the trailer swings wide during a turn, often due to incorrect speed or turning angle.',
    ),
    Question(
      questionText:
          'How do you test the tractor-semitrailer connection for security?',
      answers: [
        Answer(answerText: 'Accelerate quickly in reverse', isCorrect: false),
        Answer(
            answerText: 'Tug gently forward with the trailer brakes locked',
            isCorrect: true),
        Answer(
            answerText: 'Apply the service brake while in neutral',
            isCorrect: false),
        Answer(answerText: 'Inspect visually only', isCorrect: false),
      ],
      explanation:
          'To test the tractor-semitrailer connection, gently tug forward with the trailer brakes locked to ensure the kingpin is properly seated in the fifth wheel.',
    ),
    Question(
      questionText:
          'Which statement about turning with a long combination vehicle is true?',
      answers: [
        Answer(
            answerText:
                'Long combination vehicles require less turning space than single vehicles',
            isCorrect: false),
        Answer(
            answerText:
                'The rear wheels follow the same path as the front wheels',
            isCorrect: false),
        Answer(
            answerText: 'The rear wheels will off-track to take a shorter path',
            isCorrect: true),
        Answer(
            answerText: 'You should swing wide before making a turn',
            isCorrect: false),
      ],
      explanation:
          'In long combination vehicles, the rear wheels off-track and take a shorter path than the front wheels, requiring careful consideration when turning.',
    ),
    Question(
      questionText:
          'What is the main hazard of having a fully loaded trailer with a high center of gravity?',
      answers: [
        Answer(
            answerText: 'Increased risk of sliding on turns', isCorrect: false),
        Answer(answerText: 'Difficulty in steering', isCorrect: false),
        Answer(answerText: 'Greater risk of rollover', isCorrect: true),
        Answer(answerText: 'Reduced visibility', isCorrect: false),
      ],
      explanation:
          'A fully loaded trailer with a high center of gravity presents a greater risk of rollover, especially in turns or sudden maneuvers.',
    ),
    Question(
      questionText:
          'What is the correct way to check if your vehicle is equipped with ABS (Anti-lock Braking System)?',
      answers: [
        Answer(
            answerText: 'Check for a sticker on the side of the trailer',
            isCorrect: true),
        Answer(
            answerText: 'Listen for the ABS sound during braking',
            isCorrect: false),
        Answer(
            answerText: 'Look at the color of the brake drums',
            isCorrect: false),
        Answer(
            answerText: 'Feel the brake pedal during operation',
            isCorrect: false),
      ],
      explanation:
          'To check for ABS, look for a sticker or label on the side of the trailer or on the tractor indicating the presence of an Anti-lock Braking System.',
    ),
    Question(
      questionText:
          'What should a driver do if the trailer starts to swing out to the side (fishtailing)?',
      answers: [
        Answer(
            answerText: 'Accelerate to straighten out the trailer',
            isCorrect: false),
        Answer(
            answerText: 'Apply hard braking to stop the vehicle',
            isCorrect: false),
        Answer(
            answerText: 'Steer in the opposite direction of the swing',
            isCorrect: false),
        Answer(
            answerText: 'Ease off the accelerator and gently apply the brakes',
            isCorrect: true),
      ],
      explanation:
          'If the trailer begins to fishtail, the driver should ease off the accelerator and gently apply the brakes to regain control.',
    ),
    Question(
      questionText: 'What is the function of the fifth wheel locking lever?',
      answers: [
        Answer(
            answerText: 'To connect the electrical cables', isCorrect: false),
        Answer(
            answerText: 'To lift the trailer for height adjustment',
            isCorrect: false),
        Answer(
            answerText: 'To lock the trailer kingpin into place',
            isCorrect: true),
        Answer(
            answerText: 'To release air pressure from the brake system',
            isCorrect: false),
      ],
      explanation:
          'The fifth wheel locking lever is used to lock the trailer kingpin into place, securing the trailer to the tractor.',
    ),
    Question(
      questionText:
          'How can you check for a secure connection after coupling the tractor to the trailer?',
      answers: [
        Answer(
            answerText: 'By checking the air pressure gauge', isCorrect: false),
        Answer(
            answerText: 'By pulling against the pin with the tractor',
            isCorrect: true),
        Answer(
            answerText:
                'By driving a short distance and inspecting the connection',
            isCorrect: false),
        Answer(
            answerText: 'By listening for air leaks around the fifth wheel',
            isCorrect: false),
      ],
      explanation:
          'After coupling, check for a secure connection by gently pulling against the pin with the tractor to ensure the kingpin is properly seated.',
    ),
    Question(
      questionText:
          'Why should the landing gear be slightly off the ground before coupling?',
      answers: [
        Answer(
            answerText: 'To test the strength of the landing gear',
            isCorrect: false),
        Answer(
            answerText: 'To ensure proper weight distribution',
            isCorrect: false),
        Answer(
            answerText: 'To prevent damage to the landing gear during coupling',
            isCorrect: true),
        Answer(
            answerText: 'To make it easier to adjust the trailer height later',
            isCorrect: false),
      ],
      explanation:
          'The landing gear should be slightly off the ground before coupling to prevent damage when the tractor backs under the trailer.',
    ),
    Question(
      questionText:
          'What is the purpose of the trailer air supply control in a combination vehicle?',
      answers: [
        Answer(
            answerText: 'To control the temperature in the trailer',
            isCorrect: false),
        Answer(
            answerText: 'To supply air to the trailer air tanks',
            isCorrect: true),
        Answer(
            answerText: 'To activate the trailer ABS system', isCorrect: false),
        Answer(
            answerText: 'To adjust the height of the trailer',
            isCorrect: false),
      ],
      explanation:
          'The trailer air supply control is used to supply air to the trailer air tanks, necessary for the operation of the trailer brakes.',
    ),
    Question(
      questionText:
          'What is the correct sequence for uncoupling a semitrailer?',
      answers: [
        Answer(
            answerText:
                'Lower the landing gear, disconnect airlines, release fifth wheel',
            isCorrect: true),
        Answer(
            answerText:
                'Release fifth wheel, lower the landing gear, disconnect airlines',
            isCorrect: false),
        Answer(
            answerText:
                'Disconnect airlines, release fifth wheel, lower the landing gear',
            isCorrect: false),
        Answer(
            answerText:
                'Release fifth wheel, disconnect airlines, lower the landing gear',
            isCorrect: false),
      ],
      explanation:
          'The correct sequence for uncoupling is to first lower the landing gear to support the trailer, then disconnect the airlines, and finally release the fifth wheel.',
    ),
    Question(
      questionText:
          'Why is it important to distribute the cargo weight evenly in a combination vehicle?',
      answers: [
        Answer(answerText: 'To prevent damage to the cargo', isCorrect: false),
        Answer(
            answerText: 'To ensure proper handling and stability',
            isCorrect: true),
        Answer(
            answerText: 'To comply with weight regulations', isCorrect: false),
        Answer(answerText: 'To reduce fuel consumption', isCorrect: false),
      ],
      explanation:
          'Even distribution of cargo weight in a combination vehicle is crucial for proper handling and stability, especially when turning or stopping.',
    ),
    Question(
      questionText:
          'What is the danger of having too much weight on the steering axle?',
      answers: [
        Answer(
            answerText: 'It can make the steering too sensitive',
            isCorrect: false),
        Answer(
            answerText:
                'It can cause hard steering and potential loss of control',
            isCorrect: true),
        Answer(answerText: 'It can increase fuel efficiency', isCorrect: false),
        Answer(
            answerText: 'It can cause the brakes to overheat',
            isCorrect: false),
      ],
      explanation:
          'Excessive weight on the steering axle can lead to hard steering and difficulty controlling the vehicle, posing a safety risk.',
    ),
    Question(
      questionText:
          'What should you do before backing under a semitrailer to couple?',
      answers: [
        Answer(
            answerText: 'Ensure the trailer brakes are locked',
            isCorrect: true),
        Answer(
            answerText: 'Raise the landing gear completely', isCorrect: false),
        Answer(answerText: 'Disconnect the electrical cable', isCorrect: false),
        Answer(
            answerText: 'Check the tire pressure on the tractor',
            isCorrect: false),
      ],
      explanation:
          'Before backing under a semitrailer to couple, ensure the trailer brakes are locked to prevent the trailer from moving.',
    ),
    Question(
      questionText:
          'What is the primary function of the "service line" in a combination vehicle?',
      answers: [
        Answer(
            answerText: 'To supply air for the parking brakes',
            isCorrect: false),
        Answer(answerText: 'To control the trailer brakes', isCorrect: true),
        Answer(answerText: 'To power the trailer lights', isCorrect: false),
        Answer(answerText: 'To activate the ABS system', isCorrect: false),
      ],
      explanation:
          'The primary function of the service line in a combination vehicle is to control the trailer brakes, providing braking power when needed.',
    ),
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
