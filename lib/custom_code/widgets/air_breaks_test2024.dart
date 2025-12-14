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

class AirBreaksTest2024 extends StatefulWidget {
  const AirBreaksTest2024({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _AirBreaksTest2024State createState() => _AirBreaksTest2024State();
}

class _AirBreaksTest2024State extends State<AirBreaksTest2024> {
  int currentQuestionIndex = 0;
  bool showNextButton = false;

  final List<Question> questions = [
    Question(
      questionText:
          'What is the primary function of an air compressor in an air brake system?',
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
          'The air compressor primary function in an air brake system is to create and maintain the air pressure needed to operate the brakes.',
    ),
    Question(
      questionText:
          'What is the purpose of the air dryer in an air brake system?',
      answers: [
        Answer(answerText: 'To increase air pressure', isCorrect: false),
        Answer(answerText: 'To remove air contaminants', isCorrect: false),
        Answer(answerText: 'To remove moisture from the air', isCorrect: true),
        Answer(
            answerText: 'To cool the air before it enters the brakes',
            isCorrect: false),
      ],
      explanation:
          'The air dryer in an air brake system removes moisture from the air, preventing water from entering the system and causing damage.',
    ),
    Question(
      questionText:
          'At what PSI level does the air compressor governor typically cut in?',
      answers: [
        Answer(answerText: '100 PSI', isCorrect: false),
        Answer(answerText: '125 PSI', isCorrect: false),
        Answer(answerText: '150 PSI', isCorrect: false),
        Answer(answerText: '85-100 PSI', isCorrect: true),
      ],
      explanation:
          'The air compressor governor typically cuts in at 85-100 PSI, starting the compressor to build up the air pressure in the system.',
    ),
    Question(
      questionText: 'What are spring brakes?',
      answers: [
        Answer(
            answerText: 'Brakes used in the spring season', isCorrect: false),
        Answer(
            answerText:
                'Brakes that use springs to apply the brakes for parking',
            isCorrect: true),
        Answer(
            answerText: 'Brakes used for emergency stopping', isCorrect: false),
        Answer(answerText: 'A type of drum brake', isCorrect: false),
      ],
      explanation:
          'Spring brakes use powerful springs to apply the brakes, primarily used for parking or emergency braking when air pressure is lost.',
    ),
    Question(
      questionText: 'Why must air tanks be drained?',
      answers: [
        Answer(answerText: 'To refill with fresh air', isCorrect: false),
        Answer(answerText: 'To remove oil and water build-up', isCorrect: true),
        Answer(answerText: 'To check for leaks', isCorrect: false),
        Answer(answerText: 'To adjust the air pressure', isCorrect: false),
      ],
      explanation:
          'Air tanks must be drained to remove oil and water build-up, which can affect the performance of the brake system.',
    ),
    Question(
      questionText:
          'What is the primary danger of a leak in the air brake system?',
      answers: [
        Answer(answerText: 'Increased fuel consumption', isCorrect: false),
        Answer(answerText: 'Loud noise', isCorrect: false),
        Answer(
            answerText: 'Loss of air pressure, leading to brake failure',
            isCorrect: true),
        Answer(answerText: 'Overheating of the engine', isCorrect: false),
      ],
      explanation:
          'A leak in the air brake system can lead to a loss of air pressure, which is critical for brake operation and can result in brake failure.',
    ),
    Question(
      questionText: 'What is a dual air brake system?',
      answers: [
        Answer(
            answerText: 'A system with two sets of air brakes on each wheel',
            isCorrect: false),
        Answer(
            answerText: 'A system that uses two compressors', isCorrect: false),
        Answer(
            answerText:
                'A system with two separate air brake systems for added safety',
            isCorrect: true),
        Answer(
            answerText: 'A system used only for double trailers',
            isCorrect: false),
      ],
      explanation:
          'A dual air brake system has two separate air brake systems as a safety feature, providing a backup in case one system fails.',
    ),
    Question(
      questionText: 'What is the purpose of a "wig wag" device?',
      answers: [
        Answer(
            answerText: 'To indicate when the brakes are applied',
            isCorrect: false),
        Answer(
            answerText: 'To alert when air pressure falls below a safe level',
            isCorrect: true),
        Answer(answerText: 'To clean the air filters', isCorrect: false),
        Answer(
            answerText: 'To indicate proper functioning of the ABS',
            isCorrect: false),
      ],
      explanation:
          'A "wig wag" device is an older type of low air pressure warning device that physically drops down into the driver\'s view when air pressure falls below a safe level.',
    ),
    Question(
      questionText: 'What is a "tractor protection valve"?',
      answers: [
        Answer(
            answerText: 'A valve that protects the engine in the tractor',
            isCorrect: false),
        Answer(
            answerText:
                'A valve that controls the flow of air to the tractor brakes',
            isCorrect: false),
        Answer(
            answerText:
                'A valve that prevents air loss in the tractor if the trailer breaks away',
            isCorrect: true),
        Answer(
            answerText: 'A valve used to connect the tractor to the trailer',
            isCorrect: false),
      ],
      explanation:
          'The tractor protection valve prevents air from flowing out of the tractor if the trailer breaks away, ensuring the tractor retains sufficient air pressure for braking.',
    ),
    Question(
      questionText: 'What does "brake lag" refer to in air brake systems?',
      answers: [
        Answer(
            answerText:
                'The delay between pressing the brake pedal and brake application',
            isCorrect: true),
        Answer(
            answerText: 'The time it takes to release the brakes',
            isCorrect: false),
        Answer(
            answerText: 'A malfunction in the brake system', isCorrect: false),
        Answer(
            answerText: 'The time needed to build air pressure',
            isCorrect: false),
      ],
      explanation:
          'Brake lag refers to the slight delay between pressing the brake pedal and the actual application of the brakes in air brake systems.',
    ),
    Question(
      questionText: 'How should you check the air brake system for leaks?',
      answers: [
        Answer(
            answerText: 'By listening for leaks while the engine is running',
            isCorrect: false),
        Answer(
            answerText:
                'By applying pressure to the brake pedal and holding for one minute',
            isCorrect: true),
        Answer(
            answerText: 'By inspecting the brake lines for visible damage',
            isCorrect: false),
        Answer(
            answerText: 'By checking the air pressure gauge only',
            isCorrect: false),
      ],
      explanation:
          'To check for air leaks, apply pressure to the brake pedal and hold for one minute; the air pressure should not drop significantly.',
    ),
    Question(
      questionText:
          'What should be done if the low air pressure warning comes on?',
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
          'If the low air pressure warning comes on, it is essential to stop and safely park the vehicle as soon as possible and address the issue.',
    ),
    Question(
      questionText:
          'What is the main purpose of a safety valve in an air brake system?',
      answers: [
        Answer(answerText: 'To release excess air pressure', isCorrect: true),
        Answer(
            answerText: 'To shut off the air supply in case of a leak',
            isCorrect: false),
        Answer(
            answerText: 'To regulate air flow to the brakes', isCorrect: false),
        Answer(
            answerText: 'To activate the emergency brakes', isCorrect: false),
      ],
      explanation:
          'The safety valve in an air brake system releases excess air pressure, preventing pressure in the system from becoming too high.',
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
          'When the air pressure in the system reaches the cut-out level, the air compressor stops pumping air to prevent over-pressurization.',
    ),
    Question(
      questionText:
          'What is the typical operating range for air pressure in most air brake systems?',
      answers: [
        Answer(answerText: '50-100 PSI', isCorrect: false),
        Answer(answerText: '125-150 PSI', isCorrect: false),
        Answer(answerText: '100-125 PSI', isCorrect: true),
        Answer(answerText: '150-175 PSI', isCorrect: false),
      ],
      explanation:
          'The typical operating range for air pressure in most air brake systems is between 100 and 125 PSI.',
    ),
    Question(
      questionText:
          'What is the importance of "crack pressure" in an air brake system?',
      answers: [
        Answer(
            answerText: 'It is the pressure at which the brakes fail',
            isCorrect: false),
        Answer(
            answerText:
                'It is the pressure at which air starts to flow through the system',
            isCorrect: true),
        Answer(
            answerText: 'It indicates a leak in the system', isCorrect: false),
        Answer(
            answerText: 'It is the maximum pressure the system can handle',
            isCorrect: false),
      ],
      explanation:
          'Crack pressure is the air pressure level at which air starts to flow through the system, indicating the brakes are beginning to apply.',
    ),
    Question(
      questionText:
          'How can you test the automatic slack adjusters on the brakes?',
      answers: [
        Answer(
            answerText:
                'By applying and releasing the brakes several times at a high pressure',
            isCorrect: true),
        Answer(
            answerText:
                'By driving at low speeds and observing brake performance',
            isCorrect: false),
        Answer(
            answerText:
                'By manually adjusting them and checking for resistance',
            isCorrect: false),
        Answer(
            answerText: 'By inspecting them visually for wear',
            isCorrect: false),
      ],
      explanation:
          'Automatic slack adjusters can be tested by applying and releasing the brakes several times at a high pressure to ensure they maintain the correct brake adjustment.',
    ),
    Question(
      questionText:
          'What is the purpose of the "supply pressure gauge" in an air brake system?',
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
          'The supply pressure gauge in an air brake system shows the amount of air pressure available in the air tanks.',
    ),
    Question(
        questionText:
            'What does "fanning the brake pedal" do in an air brake system?',
        answers: [
          Answer(
              answerText: 'Increases air pressure quickly', isCorrect: false),
          Answer(answerText: 'Cools down the brakes', isCorrect: false),
          Answer(
              answerText: 'Reduces air pressure and can deplete air supply',
              isCorrect: true),
          Answer(answerText: 'Adjusts the brake pads', isCorrect: false),
        ],
        explanation:
            'Fanning the brake pedal in an air brake system can rapidly reduce air pressure and may deplete the air supply, leading to brake failure.'),
    Question(
      questionText:
          'What should you do before descending a steep grade with a vehicle that has air brakes?',
      answers: [
        Answer(
            answerText: 'Accelerate to get through quickly', isCorrect: false),
        Answer(
            answerText: 'Ensure the air brakes are fully released',
            isCorrect: false),
        Answer(
            answerText: 'Shift to a lower gear and use engine braking',
            isCorrect: true),
        Answer(
            answerText: 'Turn off the retarder for better control',
            isCorrect: false),
      ],
      explanation:
          'Before descending a steep grade with air brakes, shift to a lower gear and use engine braking to control speed and prevent overuse of air brakes.',
    ),
    Question(
      questionText:
          'How does a low air pressure warning device help the driver?',
      answers: [
        Answer(answerText: 'It indicates when to refuel', isCorrect: false),
        Answer(
            answerText:
                'It alerts the driver to air pressure dropping below a safe level',
            isCorrect: true),
        Answer(
            answerText: 'It tells the driver when to change gears',
            isCorrect: false),
        Answer(
            answerText: 'It signals when the brakes are applied',
            isCorrect: false),
      ],
      explanation:
          'A low air pressure warning device alerts the driver when the air pressure in the brake system drops below a safe level, indicating potential brake failure.',
    ),
    Question(
      questionText:
          'In an air brake system, what does the "cut-out" level refer to?',
      answers: [
        Answer(
            answerText: 'The minimum air pressure required to stop the vehicle',
            isCorrect: false),
        Answer(
            answerText:
                'The point at which the air compressor stops pumping air',
            isCorrect: true),
        Answer(
            answerText: 'The maximum level of air pressure allowed in the tank',
            isCorrect: false),
        Answer(
            answerText: 'The level at which the safety valve releases pressure',
            isCorrect: false),
      ],
      explanation:
          'The "cut-out" level in an air brake system is the point at which the air compressor stops pumping air, having reached the maximum desired pressure.',
    ),
    Question(
      questionText:
          'What happens if the air pressure becomes too low in an air brake system?',
      answers: [
        Answer(
            answerText: 'The vehicle will automatically speed up',
            isCorrect: false),
        Answer(
            answerText: 'The brakes will not fully release', isCorrect: false),
        Answer(
            answerText: 'The emergency brakes will activate', isCorrect: true),
        Answer(answerText: 'The ABS system will engage', isCorrect: false),
      ],
      explanation:
          'If air pressure becomes too low in an air brake system, the emergency brakes will automatically activate to prevent the vehicle from moving.',
    ),
    Question(
      questionText:
          'What is the primary purpose of the "foot valve" in an air brake system?',
      answers: [
        Answer(answerText: 'To control the throttle', isCorrect: false),
        Answer(answerText: 'To release air from the tanks', isCorrect: false),
        Answer(answerText: 'To apply the service brakes', isCorrect: true),
        Answer(
            answerText: 'To drain moisture from the system', isCorrect: false),
      ],
      explanation:
          'The primary purpose of the "foot valve" in an air brake system is to apply the service brakes when the driver presses the brake pedal.',
    ),
    Question(
      questionText:
          'Why is it important to regularly drain moisture from air tanks in an air brake system?',
      answers: [
        Answer(
            answerText: 'To prevent the air compressor from overheating',
            isCorrect: false),
        Answer(
            answerText: 'To maintain the correct air pressure',
            isCorrect: false),
        Answer(
            answerText: 'To prevent corrosion and freezing of the brakes',
            isCorrect: true),
        Answer(answerText: 'To keep the air clean', isCorrect: false),
      ],
      explanation:
          'Regularly draining moisture from air tanks in an air brake system is important to prevent corrosion and freezing, which can damage the brakes.',
    ),
    Question(
      questionText:
          'What is the main function of the relay valve in an air brake system?',
      answers: [
        Answer(answerText: 'To control the air compressor', isCorrect: false),
        Answer(answerText: 'To increase stopping power', isCorrect: false),
        Answer(
            answerText: 'To speed up the application and release of brakes',
            isCorrect: true),
        Answer(
            answerText: 'To regulate air pressure to the brakes',
            isCorrect: false),
      ],
      explanation:
          'The relay valve in an air brake system helps speed up the application and release of brakes, especially in long vehicles.',
    ),
    Question(
      questionText:
          'What is the function of the alcohol evaporator in an air brake system?',
      answers: [
        Answer(answerText: 'To clean the air compressor', isCorrect: false),
        Answer(
            answerText: 'To add alcohol to the air system to prevent freezing',
            isCorrect: true),
        Answer(
            answerText: 'To increase the efficiency of the air dryer',
            isCorrect: false),
        Answer(
            answerText: 'To evaporate excess moisture in the system',
            isCorrect: false),
      ],
      explanation:
          'The alcohol evaporator adds alcohol to the air system of an air brake system to prevent the accumulation of ice and freezing in cold weather.',
    ),
    Question(
      questionText:
          'What should a driver do if the pushrod stroke of any brake exceeds the legal limit?',
      answers: [
        Answer(
            answerText: 'Continue driving and adjust at the next stop',
            isCorrect: false),
        Answer(
            answerText: 'Have it repaired before continuing', isCorrect: true),
        Answer(answerText: 'Reduce the load of the vehicle', isCorrect: false),
        Answer(
            answerText: 'Increase air pressure to compensate',
            isCorrect: false),
      ],
      explanation:
          'If the pushrod stroke of any brake exceeds the legal limit, the driver should have it repaired before continuing, as it affects brake effectiveness.',
    ),
    Question(
      questionText:
          'What are manual slack adjusters used for in an air brake system?',
      answers: [
        Answer(answerText: 'To adjust the mirrors', isCorrect: false),
        Answer(
            answerText:
                'To manually adjust the brakes for proper pushrod stroke',
            isCorrect: true),
        Answer(answerText: 'To change gears', isCorrect: false),
        Answer(answerText: 'To test the air pressure', isCorrect: false),
      ],
      explanation:
          'Manual slack adjusters in an air brake system are used to manually adjust the brakes to ensure the proper pushrod stroke length.',
    ),
    Question(
      questionText:
          'How can you test the parking brake in an air brake system?',
      answers: [
        Answer(
            answerText: 'By driving at low speed and applying the brake',
            isCorrect: true),
        Answer(
            answerText: 'By applying the brake pedal while the engine is off',
            isCorrect: false),
        Answer(
            answerText: 'By checking the brake fluid level', isCorrect: false),
        Answer(answerText: 'By listening for air leaks', isCorrect: false),
      ],
      explanation:
          'To test the parking brake in an air brake system, drive slowly and apply the brake to ensure it can hold the vehicle.',
    ),
    Question(
      questionText:
          'What should you do if the air pressure gauge shows a rapid air pressure loss?',
      answers: [
        Answer(
            answerText: 'Continue driving and monitor the gauge',
            isCorrect: false),
        Answer(
            answerText: 'Stop and safely park as soon as possible',
            isCorrect: true),
        Answer(answerText: 'Turn on the emergency flashers', isCorrect: false),
        Answer(answerText: 'Increase your driving speed', isCorrect: false),
      ],
      explanation:
          'If the air pressure gauge shows rapid air pressure loss, stop and safely park the vehicle as soon as possible to investigate the cause.',
    ),
    Question(
      questionText:
          'What is the purpose of the air pressure gauge in an air brake system?',
      answers: [
        Answer(answerText: 'To measure fuel levels', isCorrect: false),
        Answer(
            answerText: 'To display the temperature of the air',
            isCorrect: false),
        Answer(
            answerText: 'To show the amount of air pressure in the air tanks',
            isCorrect: true),
        Answer(
            answerText: 'To indicate the speed of the vehicle',
            isCorrect: false),
      ],
      explanation:
          'The air pressure gauge in an air brake system displays the amount of air pressure in the air tanks, essential for proper brake operation.',
    ),
    Question(
      questionText:
          'Why is it important to drain air tanks regularly in an air brake system?',
      answers: [
        Answer(answerText: 'To prevent air blockage', isCorrect: false),
        Answer(answerText: 'To remove oil and moisture', isCorrect: true),
        Answer(answerText: 'To refill with clean air', isCorrect: false),
        Answer(answerText: 'To maintain air temperature', isCorrect: false),
      ],
      explanation:
          'Draining air tanks regularly in an air brake system is important to remove oil and moisture that can accumulate and cause damage to the system.',
    ),
    Question(
      questionText: 'What is the "brake fade" phenomenon?',
      answers: [
        Answer(
            answerText: 'The brakes becoming more effective with use',
            isCorrect: false),
        Answer(
            answerText: 'The reduction in braking power due to overheating',
            isCorrect: true),
        Answer(
            answerText: 'The brakes making a fading noise', isCorrect: false),
        Answer(
            answerText: 'The color of the brakes fading over time',
            isCorrect: false),
      ],
      explanation:
          'Brake fade is the reduction in braking power that occurs when the brakes overheat, often due to excessive use or improper adjustment.',
    ),
    Question(
      questionText:
          'What should you do when the air compressor governor cut-out pressure is reached?',
      answers: [
        Answer(
            answerText: 'Apply the brakes to reduce pressure',
            isCorrect: false),
        Answer(answerText: 'Continue driving normally', isCorrect: true),
        Answer(
            answerText: 'Stop the vehicle and check for leaks',
            isCorrect: false),
        Answer(
            answerText: 'Turn off the engine to cool down', isCorrect: false),
      ],
      explanation:
          'When the air compressor governor cut-out pressure is reached, continue driving normally as the air system has reached its optimal pressure level.',
    ),
    Question(
      questionText:
          'What is the main reason for using a "dual circuit" air brake system?',
      answers: [
        Answer(answerText: 'To double the braking power', isCorrect: false),
        Answer(answerText: 'For redundancy and safety', isCorrect: true),
        Answer(answerText: 'To reduce air consumption', isCorrect: false),
        Answer(answerText: 'To make braking smoother', isCorrect: false),
      ],
      explanation:
          'The main reason for using a "dual circuit" air brake system is for redundancy and safety, ensuring that if one circuit fails, the other can still operate the brakes.',
    ),
    Question(
      questionText:
          'How do you check the automatic slack adjusters on drum brakes?',
      answers: [
        Answer(answerText: 'By manually adjusting them', isCorrect: false),
        Answer(
            answerText:
                'By measuring pushrod travel during a brake application',
            isCorrect: true),
        Answer(answerText: 'By listening for unusual sounds', isCorrect: false),
        Answer(
            answerText: 'By checking the air pressure gauge', isCorrect: false),
      ],
      explanation:
          'Checking automatic slack adjusters on drum brakes involves measuring pushrod travel during a brake application to ensure they are maintaining proper adjustment.',
    ),
    Question(
      questionText:
          'What is the purpose of the "supply pressure gauge" in an air brake system?',
      answers: [
        Answer(
            answerText: 'To indicate the level of brake fluid',
            isCorrect: false),
        Answer(
            answerText: 'To show the amount of air pressure in the tanks',
            isCorrect: true),
        Answer(
            answerText: 'To measure the temperature of the air',
            isCorrect: false),
        Answer(
            answerText: 'To display the speed of the vehicle',
            isCorrect: false),
      ],
      explanation:
          'The supply pressure gauge in an air brake system shows the amount of air pressure in the air tanks, indicating the available air for braking.',
    ),
    Question(
        questionText:
            'Why should air brake system inspections be part of regular vehicle maintenance?',
        answers: [
          Answer(answerText: 'To maintain fuel efficiency', isCorrect: false),
          Answer(
              answerText:
                  'To ensure the system operates safely and effectively',
              isCorrect: true),
          Answer(
              answerText: 'To comply with environmental regulations',
              isCorrect: false),
          Answer(
              answerText: 'To reduce noise from the brakes', isCorrect: false),
        ],
        explanation:
            'Regular inspections of the air brake system are crucial to ensure its safe and effective operation, especially given the critical role of brakes in vehicle safety.'),
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
