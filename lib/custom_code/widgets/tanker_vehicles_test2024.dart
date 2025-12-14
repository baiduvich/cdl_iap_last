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

class TankerVehiclesTest2024 extends StatefulWidget {
  const TankerVehiclesTest2024({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _TankerVehiclesTest2024State createState() => _TankerVehiclesTest2024State();
}

class _TankerVehiclesTest2024State extends State<TankerVehiclesTest2024> {
  int currentQuestionIndex = 0;
  bool showNextButton = false;

  final List<Question> questions = [
    Question(
      questionText:
          'What is the primary concern when driving a tanker vehicle?',
      answers: [
        Answer(answerText: 'The color of the tanker', isCorrect: false),
        Answer(answerText: 'The movement of liquid', isCorrect: true),
        Answer(answerText: 'The speed of the vehicle', isCorrect: false),
        Answer(
            answerText: 'The noise level inside the cabin', isCorrect: false),
      ],
      explanation:
          'The primary concern when driving a tanker is the movement of liquid, which can significantly affect vehicle handling and stability.',
    ),
    Question(
      questionText: 'What is the surge in liquid tanks?',
      answers: [
        Answer(
            answerText: 'A sudden increase in engine power', isCorrect: false),
        Answer(
            answerText:
                'Movement of liquid within the tank affecting stability',
            isCorrect: true),
        Answer(
            answerText: 'A rapid increase in tank pressure', isCorrect: false),
        Answer(
            answerText: 'An electronic control system in the tanker',
            isCorrect: false),
      ],
      explanation:
          'Surge refers to the movement of liquid within the tank, which can affect the vehicle’s stability and handling, especially when starting, stopping, or changing direction.',
    ),
    Question(
      questionText: 'Why must a tanker driver be cautious on curves?',
      answers: [
        Answer(answerText: 'To avoid high fuel consumption', isCorrect: false),
        Answer(
            answerText: 'To prevent surge and maintain control',
            isCorrect: true),
        Answer(answerText: 'To comply with traffic laws', isCorrect: false),
        Answer(answerText: 'To avoid disturbing the cargo', isCorrect: false),
      ],
      explanation:
          'Tanker drivers must be cautious on curves to prevent surge and maintain control of the vehicle, as the liquid movement can shift the vehicle’s center of gravity.',
    ),
    Question(
      questionText: 'What is the purpose of baffles in a liquid tank?',
      answers: [
        Answer(answerText: 'To keep the liquid warm', isCorrect: false),
        Answer(answerText: 'To control the surge of liquid', isCorrect: true),
        Answer(answerText: 'To increase the tank capacity', isCorrect: false),
        Answer(answerText: 'To separate different liquids', isCorrect: false),
      ],
      explanation:
          'Baffles are used in liquid tanks to control the surge of liquid, improving stability by preventing excessive movement of the liquid.',
    ),
    Question(
      questionText: 'Why are tanker vehicles more likely to roll over?',
      answers: [
        Answer(answerText: 'Due to their higher speed', isCorrect: false),
        Answer(
            answerText: 'Because of the high center of gravity of the load',
            isCorrect: true),
        Answer(answerText: 'Due to the shape of the tank', isCorrect: false),
        Answer(
            answerText: 'Because they are often overloaded', isCorrect: false),
      ],
      explanation:
          'Tanker vehicles are more likely to roll over due to the high center of gravity of the liquid load, especially when partially filled.',
    ),
    Question(
      questionText: 'What should a driver do to control surge?',
      answers: [
        Answer(answerText: 'Brake hard at stop lights', isCorrect: false),
        Answer(answerText: 'Make sudden lane changes', isCorrect: false),
        Answer(
            answerText: 'Accelerate and decelerate smoothly', isCorrect: true),
        Answer(answerText: 'Drive faster on curves', isCorrect: false),
      ],
      explanation:
          'To control surge, drivers should accelerate and decelerate smoothly, avoiding sudden movements that can cause the liquid to surge back and forth.',
    ),
    Question(
      questionText:
          'What is the major hazard of transporting liquids in partially filled tanks?',
      answers: [
        Answer(answerText: 'Increased fuel consumption', isCorrect: false),
        Answer(answerText: 'Decreased vehicle speed', isCorrect: false),
        Answer(
            answerText: 'Increased risk of rollover due to liquid surge',
            isCorrect: true),
        Answer(
            answerText: 'Reduced visibility due to tank design',
            isCorrect: false),
      ],
      explanation:
          'The major hazard of transporting liquids in partially filled tanks is an increased risk of rollover due to liquid surge, which can cause a shift in the vehicle’s center of gravity.',
    ),
    Question(
      questionText: 'What is a "smooth bore" tank?',
      answers: [
        Answer(
            answerText: 'A tank with a rough interior to reduce surge',
            isCorrect: false),
        Answer(answerText: 'A tank without interior baffles', isCorrect: true),
        Answer(answerText: 'A tank designed for dry goods', isCorrect: false),
        Answer(answerText: 'A tank that is easy to clean', isCorrect: false),
      ],
      explanation:
          'A "smooth bore" tank is a liquid tank without interior baffles, allowing more movement of the liquid and thus requiring careful handling due to the increased risk of surge.',
    ),
    Question(
      questionText:
          'What should drivers of tankers check regularly during a trip?',
      answers: [
        Answer(answerText: 'Tire pressure', isCorrect: true),
        Answer(answerText: 'The color of the liquid', isCorrect: false),
        Answer(
            answerText: 'The temperature inside the cabin', isCorrect: false),
        Answer(answerText: 'The radio for weather updates', isCorrect: false),
      ],
      explanation:
          'Tanker drivers should regularly check tire pressure, as improper tire pressure can affect handling and stability, especially when carrying liquid loads.',
    ),
    Question(
      questionText: 'How does a full tank of liquid affect stopping distance?',
      answers: [
        Answer(answerText: 'Decreases stopping distance', isCorrect: false),
        Answer(
            answerText: 'Has no effect on stopping distance', isCorrect: false),
        Answer(answerText: 'Increases stopping distance', isCorrect: true),
        Answer(answerText: 'Varies depending on the liquid', isCorrect: false),
      ],
      explanation:
          'A full tank of liquid increases the stopping distance due to the added weight, making it essential for drivers to maintain a safe following distance.',
    ),
    Question(
      questionText: 'What is the key to turning safely in a tanker vehicle?',
      answers: [
        Answer(answerText: 'Turning at high speeds', isCorrect: false),
        Answer(answerText: 'Making sharp turns', isCorrect: false),
        Answer(
            answerText: 'Approaching turns slowly and smoothly',
            isCorrect: true),
        Answer(
            answerText: 'Using only the mirrors to navigate turns',
            isCorrect: false),
      ],
      explanation:
          'The key to turning safely in a tanker vehicle is to approach turns slowly and smoothly to minimize liquid surge and maintain vehicle stability.',
    ),
    Question(
      questionText:
          'Why is it important to know the outage needed for the liquids you are hauling?',
      answers: [
        Answer(
            answerText: 'To avoid overfilling and allow for expansion',
            isCorrect: true),
        Answer(
            answerText: 'To reduce the overall weight of the cargo',
            isCorrect: false),
        Answer(answerText: 'To calculate fuel consumption', isCorrect: false),
        Answer(answerText: 'To determine the correct route', isCorrect: false),
      ],
      explanation:
          'Knowing the outage (expansion space) needed for the liquids being hauled is important to avoid overfilling the tank, as liquids can expand in transit.',
    ),
    Question(
      questionText:
          'What is the main difference between hauling liquid tanks and dry bulk tanks?',
      answers: [
        Answer(answerText: 'Dry bulk tanks are heavier', isCorrect: false),
        Answer(
            answerText: 'Liquid tanks require a special license',
            isCorrect: false),
        Answer(
            answerText: 'Liquid tanks are more prone to surge and rollover',
            isCorrect: true),
        Answer(
            answerText: 'Dry bulk tanks have a higher center of gravity',
            isCorrect: false),
      ],
      explanation:
          'The main difference is that liquid tanks are more prone to surge and rollover compared to dry bulk tanks, requiring different handling techniques.',
    ),
    Question(
      questionText:
          'What should you do before loading or unloading a liquid tank?',
      answers: [
        Answer(answerText: 'Check the weather', isCorrect: false),
        Answer(answerText: 'Inspect the tank for leaks', isCorrect: true),
        Answer(answerText: 'Fill the fuel tank', isCorrect: false),
        Answer(answerText: 'Adjust the mirrors', isCorrect: false),
      ],
      explanation:
          'Before loading or unloading a liquid tank, inspect the tank for leaks or damage to ensure safety and prevent spills.',
    ),
    Question(
      questionText:
          'What type of valve is commonly used in liquid tankers to control the flow of liquid?',
      answers: [
        Answer(answerText: 'Gate valve', isCorrect: true),
        Answer(answerText: 'Pressure relief valve', isCorrect: false),
        Answer(answerText: 'Butterfly valve', isCorrect: false),
        Answer(answerText: 'Ball valve', isCorrect: false),
      ],
      explanation:
          'Gate valves are commonly used in liquid tankers to control the flow of liquid, providing a secure and adjustable means of releasing the cargo.',
    ),
    Question(
      questionText:
          'Why are tanker vehicles with partially filled tanks more challenging to drive?',
      answers: [
        Answer(answerText: 'Due to increased weight', isCorrect: false),
        Answer(answerText: 'Due to higher center of gravity', isCorrect: false),
        Answer(
            answerText: 'Due to the movement of liquid causing instability',
            isCorrect: true),
        Answer(answerText: 'Due to increased air resistance', isCorrect: false),
      ],
      explanation:
          'Partially filled tanker vehicles are more challenging to drive due to the movement of the liquid inside, which can cause instability and affect handling.',
    ),
    Question(
      questionText:
          'What is a common mistake drivers make when braking in a tank vehicle?',
      answers: [
        Answer(answerText: 'Braking too softly', isCorrect: false),
        Answer(answerText: 'Braking in a straight line', isCorrect: false),
        Answer(answerText: 'Braking too suddenly', isCorrect: true),
        Answer(answerText: 'Braking while turning', isCorrect: false),
      ],
      explanation:
          'A common mistake is braking too suddenly, which can cause liquid surge and increase the risk of losing control or jackknifing.',
    ),
    Question(
      questionText:
          'When hauling hazardous liquids, what additional precautions should a driver take?',
      answers: [
        Answer(
            answerText: 'Carry additional fire extinguishers', isCorrect: true),
        Answer(
            answerText: 'Drive only during daylight hours', isCorrect: false),
        Answer(answerText: 'Use only interstate highways', isCorrect: false),
        Answer(
            answerText: 'Maintain a higher speed for stability',
            isCorrect: false),
      ],
      explanation:
          'When hauling hazardous liquids, carrying additional fire extinguishers and following specific safety protocols for the type of liquid is crucial.',
    ),
    Question(
      questionText:
          'How should you approach a downhill grade in a tanker vehicle?',
      answers: [
        Answer(answerText: 'Maintain a high gear', isCorrect: false),
        Answer(
            answerText: 'Increase speed before descending', isCorrect: false),
        Answer(
            answerText: 'Use engine braking and descend in a low gear',
            isCorrect: true),
        Answer(answerText: 'Rely on the foot brake alone', isCorrect: false),
      ],
      explanation:
          'Approach a downhill grade in a tanker vehicle using engine braking and descend in a low gear to maintain control and prevent brake overheating.',
    ),
    Question(
      questionText:
          'What factor affects the handling of a liquid tanker the most?',
      answers: [
        Answer(
            answerText: 'The type of tires on the vehicle', isCorrect: false),
        Answer(answerText: 'The speed of the vehicle', isCorrect: false),
        Answer(
            answerText: 'The amount and distribution of the liquid',
            isCorrect: true),
        Answer(answerText: 'The outside temperature', isCorrect: false),
      ],
      explanation:
          'The amount and distribution of the liquid in the tanker have the greatest effect on handling, influencing stability and the center of gravity.',
    ),
    Question(
      questionText:
          'What is the key reason for a driver to be aware of the liquid weight in a tanker?',
      answers: [
        Answer(
            answerText: 'To determine the correct driving speed',
            isCorrect: false),
        Answer(
            answerText: 'To ensure compliance with weight regulations',
            isCorrect: true),
        Answer(answerText: 'To calculate fuel consumption', isCorrect: false),
        Answer(
            answerText: 'To adjust the radio volume appropriately',
            isCorrect: false),
      ],
      explanation:
          'Knowing the weight of the liquid in a tanker is crucial to ensure the vehicle complies with weight regulations and maintains proper handling and braking performance.',
    ),
    Question(
      questionText:
          'How does "liquid surge" affect braking in a tanker vehicle?',
      answers: [
        Answer(
            answerText: 'It shortens the braking distance', isCorrect: false),
        Answer(answerText: 'It has no effect on braking', isCorrect: false),
        Answer(
            answerText: 'It can push the vehicle forward when stopping',
            isCorrect: true),
        Answer(answerText: 'It improves braking efficiency', isCorrect: false),
      ],
      explanation:
          'Liquid surge can push the vehicle forward when stopping, making it harder to come to a complete stop and potentially causing loss of control.',
    ),
    Question(
      questionText:
          'What additional certification is required for drivers hauling hazardous liquids in tankers?',
      answers: [
        Answer(answerText: 'A tanker endorsement', isCorrect: true),
        Answer(
            answerText: 'A double/triple trailer endorsement',
            isCorrect: false),
        Answer(answerText: 'A motorcycle license', isCorrect: false),
        Answer(
            answerText: 'No additional certification is required',
            isCorrect: false),
      ],
      explanation:
          'Drivers hauling hazardous liquids in tankers are required to have a tanker endorsement on their CDL, indicating specialized knowledge in handling such cargo.',
    ),
    Question(
      questionText: 'When should a tanker emergency kit be inspected?',
      answers: [
        Answer(
            answerText: 'Once a year during renewal of registration',
            isCorrect: false),
        Answer(answerText: 'Before every trip', isCorrect: true),
        Answer(answerText: 'Only after an emergency', isCorrect: false),
        Answer(
            answerText: 'When the tanker is being serviced', isCorrect: false),
      ],
      explanation:
          'A tanker emergency kit should be inspected before every trip to ensure all necessary equipment is available and in good condition.',
    ),
    Question(
      questionText:
          'What is the effect of a high center of gravity in a liquid tanker?',
      answers: [
        Answer(answerText: 'Decreased risk of rollover', isCorrect: false),
        Answer(answerText: 'Increased maneuverability', isCorrect: false),
        Answer(answerText: 'Increased risk of rollover', isCorrect: true),
        Answer(answerText: 'Reduced impact of liquid surge', isCorrect: false),
      ],
      explanation:
          'A high center of gravity in a liquid tanker increases the risk of rollover, especially in turns or sudden maneuvers, due to the shift in weight and balance.',
    ),
    Question(
      questionText:
          'Why is it important to know the type of liquid being hauled in a tanker?',
      answers: [
        Answer(
            answerText: 'To choose the right radio station', isCorrect: false),
        Answer(
            answerText: 'To determine the correct tire pressure',
            isCorrect: false),
        Answer(
            answerText:
                'To understand the hazards and required safety precautions',
            isCorrect: true),
        Answer(answerText: 'To know how fast to drive', isCorrect: false),
      ],
      explanation:
          'Knowing the type of liquid being hauled is crucial for understanding its hazards (e.g., flammability, toxicity) and the required safety precautions.',
    ),
    Question(
      questionText:
          'What should a driver do if they discover a leak in their tanker?',
      answers: [
        Answer(
            answerText: 'Continue to the destination quickly',
            isCorrect: false),
        Answer(
            answerText: 'Stop in a safe place and notify authorities',
            isCorrect: true),
        Answer(answerText: 'Seal the leak with tape', isCorrect: false),
        Answer(answerText: 'Ignore it if the leak is small', isCorrect: false),
      ],
      explanation:
          'If a leak is discovered in a tanker, the driver should stop in a safe place as soon as possible and notify the appropriate authorities for handling the hazardous situation.',
    ),
    Question(
      questionText:
          'How should drivers handle curves when driving a tanker with a high center of gravity?',
      answers: [
        Answer(answerText: 'Take curves at higher speeds', isCorrect: false),
        Answer(
            answerText: 'Maintain a consistent speed throughout the curve',
            isCorrect: false),
        Answer(
            answerText: 'Slow down before entering the curve', isCorrect: true),
        Answer(
            answerText: 'Speed up after entering the curve', isCorrect: false),
      ],
      explanation:
          'Drivers should slow down before entering a curve when driving a tanker, especially one with a high center of gravity, to reduce the risk of rollover.',
    ),
    Question(
      questionText: 'What type of tanks are most susceptible to surge?',
      answers: [
        Answer(answerText: 'Tanks with baffles', isCorrect: false),
        Answer(
            answerText: 'Tanks with a low center of gravity', isCorrect: false),
        Answer(answerText: 'Smooth bore tanks', isCorrect: true),
        Answer(answerText: 'Smaller capacity tanks', isCorrect: false),
      ],
      explanation:
          'Smooth bore tanks, which lack baffles, are most susceptible to surge due to the unobstructed movement of liquid.',
    ),
    Question(
      questionText:
          'What is the primary hazard when hauling a partially filled tanker of liquid?',
      answers: [
        Answer(answerText: 'Increased weight', isCorrect: false),
        Answer(answerText: 'Reduced visibility', isCorrect: false),
        Answer(answerText: 'Greater likelihood of surge', isCorrect: true),
        Answer(answerText: 'Lower risk of skidding', isCorrect: false),
      ],
      explanation:
          'A partially filled tanker has a greater likelihood of surge, which can affect the stability and control of the vehicle.',
    ),
    Question(
      questionText: 'What is the minimum tread depth for tires on a tanker?',
      answers: [
        Answer(answerText: '1/32 inch', isCorrect: false),
        Answer(answerText: '2/32 inch', isCorrect: false),
        Answer(
            answerText: '4/32 inch on steering axles, 2/32 inch on others',
            isCorrect: true),
        Answer(answerText: '3/32 inch on all axles', isCorrect: false),
      ],
      explanation:
          'The minimum tread depth for tires on a tanker is 4/32 inch on steering axles and 2/32 inch on all other axles.',
    ),
    Question(
      questionText:
          'Why must a tanker driver be aware of the "Out of Service" criteria?',
      answers: [
        Answer(
            answerText: 'To understand radio communication protocols',
            isCorrect: false),
        Answer(
            answerText: 'To ensure the vehicle meets safety standards',
            isCorrect: true),
        Answer(answerText: 'To know when to take breaks', isCorrect: false),
        Answer(
            answerText: 'To plan the most efficient route', isCorrect: false),
      ],
      explanation:
          'Being aware of the "Out of Service" criteria is essential for a tanker driver to ensure the vehicle meets safety standards and is not operating in violation of regulations.',
    ),
    Question(
      questionText:
          'How should you brake when driving a tanker down a long, steep downgrade?',
      answers: [
        Answer(
            answerText: 'With steady, light pressure on the brake pedal',
            isCorrect: false),
        Answer(answerText: 'Using the "Snubbing" technique', isCorrect: true),
        Answer(
            answerText: 'By pumping the brakes continuously', isCorrect: false),
        Answer(answerText: 'By using only the engine brake', isCorrect: false),
      ],
      explanation:
          'When driving down a long, steep downgrade in a tanker, the "Snubbing" technique (brief, firm application of brakes followed by a release) should be used to prevent overheating.',
    ),
    Question(
      questionText: 'What is an "unbaffled" liquid tank?',
      answers: [
        Answer(answerText: 'A tank without heating elements', isCorrect: false),
        Answer(
            answerText: 'A tank without partitions or baffles inside',
            isCorrect: true),
        Answer(
            answerText: 'A tank used for non-hazardous liquids',
            isCorrect: false),
        Answer(answerText: 'A self-cleaning tank', isCorrect: false),
      ],
      explanation:
          'An "unbaffled" liquid tank is a tank that does not have partitions or baffles inside, allowing liquid to move freely and potentially cause more surge.',
    ),
    Question(
      questionText:
          'What is the main safety concern when driving a tanker during winter?',
      answers: [
        Answer(answerText: 'The heater might fail', isCorrect: false),
        Answer(
            answerText: 'Increased risk of skidding and loss of traction',
            isCorrect: true),
        Answer(answerText: 'The liquid may freeze', isCorrect: false),
        Answer(
            answerText: 'Decreased visibility due to shorter days',
            isCorrect: false),
      ],
      explanation:
          'In winter, the main safety concern when driving a tanker is the increased risk of skidding and loss of traction due to icy or slippery road conditions.',
    ),
    Question(
      questionText: 'Why should the hoses of a tanker be inspected regularly?',
      answers: [
        Answer(
            answerText: 'To ensure they match the vehicle color',
            isCorrect: false),
        Answer(answerText: 'To prevent them from tangling', isCorrect: false),
        Answer(answerText: 'To check for leaks or damage', isCorrect: true),
        Answer(
            answerText: 'To confirm they are the correct length',
            isCorrect: false),
      ],
      explanation:
          'Regular inspection of tanker hoses is necessary to check for leaks, damage, or wear, ensuring safe and efficient operation of the tanker.',
    ),
    Question(
      questionText:
          'How can a driver minimize surge when hauling liquid in a tanker?',
      answers: [
        Answer(
            answerText: 'By driving faster on straight roads',
            isCorrect: false),
        Answer(
            answerText: 'By maintaining a constant high speed',
            isCorrect: false),
        Answer(
            answerText: 'By making sudden stops and starts', isCorrect: false),
        Answer(
            answerText: 'By accelerating and braking gently', isCorrect: true),
      ],
      explanation:
          'Minimizing surge in a tanker can be achieved by accelerating and braking gently, reducing the forward and backward movement of the liquid.',
    ),
    Question(
      questionText:
          'What is the main hazard of driving a tanker with a high center of gravity?',
      answers: [
        Answer(
            answerText: 'It may be difficult to see behind the vehicle',
            isCorrect: false),
        Answer(answerText: 'It increases fuel consumption', isCorrect: false),
        Answer(answerText: 'It is more prone to tipping over', isCorrect: true),
        Answer(answerText: 'It makes the vehicle slower', isCorrect: false),
      ],
      explanation:
          'The main hazard of driving a tanker with a high center of gravity is its increased propensity to tip over, especially when turning or in windy conditions.',
    ),
    Question(
      questionText:
          'What is one of the risks of hauling a liquid with a high vapor pressure in a tanker?',
      answers: [
        Answer(
            answerText: 'Increased likelihood of freezing', isCorrect: false),
        Answer(answerText: 'Higher risk of explosion or fire', isCorrect: true),
        Answer(answerText: 'More frequent refueling stops', isCorrect: false),
        Answer(answerText: 'Decreased vehicle stability', isCorrect: false),
      ],
      explanation:
          'Hauling a liquid with a high vapor pressure in a tanker carries a higher risk of explosion or fire due to the volatile nature of such substances.',
    ),
    Question(
      questionText: 'Why should you avoid overfilling a heat expansion tank?',
      answers: [
        Answer(answerText: 'To save fuel', isCorrect: false),
        Answer(answerText: 'To prevent leakage and overflow', isCorrect: true),
        Answer(answerText: 'To keep the load lighter', isCorrect: false),
        Answer(answerText: 'To reduce the risk of speeding', isCorrect: false),
      ],
      explanation:
          'Overfilling a heat expansion tank should be avoided to prevent leakage and overflow, as the liquid may expand due to temperature changes during transit.',
    ),
    Question(
      questionText:
          'What is the primary purpose of the supply pressure gauge in an air brake system?',
      answers: [
        Answer(
            answerText: 'To measure the temperature of the air',
            isCorrect: false),
        Answer(
            answerText: 'To show the amount of air pressure in the tanks',
            isCorrect: true),
        Answer(
            answerText: 'To indicate when to apply the brakes',
            isCorrect: false),
        Answer(
            answerText: 'To display the level of brake fluid',
            isCorrect: false),
      ],
      explanation:
          'The supply pressure gauge in an air brake system shows the amount of air pressure available in the air tanks, which is crucial for the proper operation of the brakes.',
    ),
    Question(
      questionText:
          'What action should you take if the low air pressure warning comes on?',
      answers: [
        Answer(
            answerText: 'Continue driving and check the system later',
            isCorrect: false),
        Answer(
            answerText: 'Stop and safely park as soon as possible',
            isCorrect: true),
        Answer(
            answerText: 'Increase your speed to build up air pressure',
            isCorrect: false),
        Answer(
            answerText: 'Only stop if the warning stays on for over a minute',
            isCorrect: false),
      ],
      explanation:
          'If the low air pressure warning comes on, it is essential to stop and safely park the vehicle as soon as possible to address the issue, as it could lead to brake failure.',
    ),
    Question(
      questionText:
          'What is the function of the air compressor in an air brake system?',
      answers: [
        Answer(answerText: 'To cool the air in the system', isCorrect: false),
        Answer(
            answerText: 'To create and maintain air pressure', isCorrect: true),
        Answer(
            answerText: 'To control the speed of the vehicle',
            isCorrect: false),
        Answer(answerText: 'To activate the ABS system', isCorrect: false),
      ],
      explanation:
          'The air compressor in an air brake system is responsible for creating and maintaining the necessary air pressure to operate the brakes effectively.',
    ),
    Question(
      questionText:
          'Why is it important to drain moisture from air brake tanks?',
      answers: [
        Answer(
            answerText: 'To prevent the air from becoming too dry',
            isCorrect: false),
        Answer(
            answerText: 'To maintain the correct air pressure',
            isCorrect: false),
        Answer(
            answerText: 'To prevent freezing and corrosion in the brake system',
            isCorrect: true),
        Answer(
            answerText: 'To reduce the overall weight of the vehicle',
            isCorrect: false),
      ],
      explanation:
          'Draining moisture from air brake tanks is important to prevent water from freezing in cold temperatures, which can cause brake failure, and to avoid corrosion inside the brake system.',
    ),
    Question(
      questionText:
          'What happens when the air pressure in the system rises to the "cut-out" level?',
      answers: [
        Answer(answerText: 'The emergency brakes engage', isCorrect: false),
        Answer(
            answerText: 'The air compressor stops pumping air',
            isCorrect: true),
        Answer(
            answerText: 'The air pressure begins to decrease',
            isCorrect: false),
        Answer(answerText: 'The brakes lock up', isCorrect: false),
      ],
      explanation:
          'When the air pressure in the system reaches the cut-out level, the air compressor stops pumping air. This mechanism prevents the system from becoming over-pressurized.',
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
