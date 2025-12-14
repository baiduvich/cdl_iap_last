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

class HazmatTest2024 extends StatefulWidget {
  const HazmatTest2024({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _HazmatTest2024State createState() => _HazmatTest2024State();
}

class _HazmatTest2024State extends State<HazmatTest2024> {
  int currentQuestionIndex = 0;
  bool showNextButton = false;

  final List<Question> questions = [
    Question(
      questionText:
          'What is the primary reason for using placards when transporting hazardous materials?',
      answers: [
        Answer(answerText: 'To identify the type of hazard', isCorrect: true),
        Answer(answerText: 'To improve fuel efficiency', isCorrect: false),
        Answer(answerText: 'To reduce shipping costs', isCorrect: false),
        Answer(answerText: 'To increase vehicle visibility', isCorrect: false),
      ],
      explanation:
          'Placards are used to identify the type of hazard of the materials being transported, aiding in proper handling and emergency response.',
    ),
    Question(
      questionText:
          'Which document must always accompany the transportation of hazardous materials?',
      answers: [
        Answer(answerText: 'Bill of Lading', isCorrect: true),
        Answer(answerText: 'Commercial Driver\'s License', isCorrect: false),
        Answer(answerText: 'Vehicle Registration', isCorrect: false),
        Answer(answerText: 'Fuel Receipt', isCorrect: false),
      ],
      explanation:
          'The Bill of Lading is the essential document that must accompany the transportation of hazardous materials, detailing the nature and quantity of the cargo.',
    ),
    Question(
      questionText:
          'What should a driver do first if they discover their vehicle is transporting hazardous materials without proper placards?',
      answers: [
        Answer(answerText: 'Continue to the destination', isCorrect: false),
        Answer(
            answerText: 'Immediately notify the proper authorities',
            isCorrect: true),
        Answer(
            answerText: 'Park the vehicle and evacuate the area',
            isCorrect: false),
        Answer(
            answerText: 'Remove the hazardous materials from the vehicle',
            isCorrect: false),
      ],
      explanation:
          'If hazardous materials are discovered without proper placards, the driver must immediately notify the proper authorities to rectify the situation.',
    ),
    Question(
      questionText:
          'Which of the following is not a required piece of information on shipping papers for hazardous materials?',
      answers: [
        Answer(answerText: 'Emergency contact number', isCorrect: false),
        Answer(answerText: 'Weight of the vehicle', isCorrect: true),
        Answer(
            answerText: 'The hazard class of the materials', isCorrect: false),
        Answer(
            answerText: 'The proper shipping name of the materials',
            isCorrect: false),
      ],
      explanation:
          'Shipping papers for hazardous materials must include the hazard class, proper shipping name, and emergency contact number, but not the weight of the vehicle.',
    ),
    Question(
      questionText:
          'What type of fire extinguisher must be in the vehicle when transporting hazardous materials?',
      answers: [
        Answer(answerText: 'A water-based extinguisher', isCorrect: false),
        Answer(answerText: 'An ABC type extinguisher', isCorrect: true),
        Answer(answerText: 'A CO2 extinguisher', isCorrect: false),
        Answer(answerText: 'Any portable extinguisher', isCorrect: false),
      ],
      explanation:
          'An ABC type fire extinguisher is required in the vehicle when transporting hazardous materials to cover a range of potential fire types.',
    ),
    Question(
      questionText:
          'What is the minimum distance a driver must park from a bridge, tunnel, or building when transporting hazardous materials?',
      answers: [
        Answer(answerText: '100 feet', isCorrect: false),
        Answer(answerText: '300 feet', isCorrect: true),
        Answer(answerText: '50 feet', isCorrect: false),
        Answer(answerText: '500 feet', isCorrect: false),
      ],
      explanation:
          'When transporting hazardous materials, the minimum distance for parking from a bridge, tunnel, or building is 300 feet for safety reasons.',
    ),
    Question(
      questionText:
          'What is the purpose of an Emergency Response Guidebook (ERG) in the context of hazardous materials?',
      answers: [
        Answer(
            answerText: 'To guide the driver through vehicle maintenance',
            isCorrect: false),
        Answer(
            answerText:
                'To provide emergency response information in case of an incident',
            isCorrect: true),
        Answer(
            answerText: 'To offer directions to the nearest hospital',
            isCorrect: false),
        Answer(
            answerText: 'To instruct on how to load and unload materials',
            isCorrect: false),
      ],
      explanation:
          'The ERG provides essential information for emergency response in case of incidents involving hazardous materials.',
    ),
    Question(
      questionText: 'What should be done with leaking hazardous materials?',
      answers: [
        Answer(answerText: 'Cover the leak with a cloth', isCorrect: false),
        Answer(
            answerText: 'Try to repair the leak immediately', isCorrect: false),
        Answer(
            answerText: 'Report the leak and follow the appropriate procedures',
            isCorrect: true),
        Answer(
            answerText: 'Continue driving to reach the destination sooner',
            isCorrect: false),
      ],
      explanation:
          'In case of a leak, the driver should report it and follow the appropriate emergency and safety procedures outlined for the specific material.',
    ),
    Question(
      questionText:
          'In hazardous materials transportation, what is the main purpose of segregation?',
      answers: [
        Answer(
            answerText:
                'To separate different classes of materials to prevent reactions',
            isCorrect: true),
        Answer(
            answerText: 'To organize materials for easy unloading',
            isCorrect: false),
        Answer(
            answerText: 'To distribute the weight evenly in the vehicle',
            isCorrect: false),
        Answer(answerText: 'To make inventory checks easier', isCorrect: false),
      ],
      explanation:
          'Segregation in hazardous materials transportation is crucial to prevent dangerous reactions between different classes of materials.',
    ),
    Question(
      questionText:
          'When transporting hazardous materials, who is responsible for ensuring the materials are properly marked, labeled, and placarded?',
      answers: [
        Answer(answerText: 'The driver', isCorrect: true),
        Answer(answerText: 'The shipper', isCorrect: false),
        Answer(answerText: 'The receiver of the goods', isCorrect: false),
        Answer(answerText: 'The vehicle owner', isCorrect: false),
      ],
      explanation:
          'While shippers are responsible for providing the necessary markings, labels, and placards, it is ultimately the driver\'s responsibility to ensure that their vehicle is properly marked, labeled, and placarded before transport.',
    ),
    Question(
      questionText: 'What does the term "hazmat" refer to?',
      answers: [
        Answer(
            answerText:
                'Any material posing a risk to public safety or the environment',
            isCorrect: true),
        Answer(
            answerText: 'Materials used exclusively in medical settings',
            isCorrect: false),
        Answer(answerText: 'Non-flammable materials', isCorrect: false),
        Answer(
            answerText: 'Packaging materials for transportation',
            isCorrect: false),
      ],
      explanation:
          'Hazmat refers to hazardous materials that pose risks to public safety or the environment during transportation or handling.',
    ),
    Question(
      questionText:
          'What is a Material Safety Data Sheet (MSDS) used for in transporting hazardous materials?',
      answers: [
        Answer(
            answerText:
                'To provide detailed information on the material\'s properties and handling precautions',
            isCorrect: true),
        Answer(answerText: 'To log the transportation route', isCorrect: false),
        Answer(
            answerText: 'To record the quantity of material transported',
            isCorrect: false),
        Answer(
            answerText: 'To track the vehicle\'s maintenance records',
            isCorrect: false),
      ],
      explanation:
          'MSDS provides detailed information on the chemical properties, health and safety hazards, and precautions for handling and storing hazardous materials.',
    ),
    Question(
      questionText:
          'What action should a driver take if they encounter a hazmat incident during transportation?',
      answers: [
        Answer(
            answerText:
                'Continue to the destination and then report the incident',
            isCorrect: false),
        Answer(
            answerText:
                'Secure the area and notify the appropriate authorities immediately',
            isCorrect: true),
        Answer(
            answerText: 'Attempt to handle the incident without external help',
            isCorrect: false),
        Answer(
            answerText: 'Park the vehicle and wait for help to arrive',
            isCorrect: false),
      ],
      explanation:
          'In the event of a hazmat incident, the driver should secure the area to prevent further harm and immediately notify the appropriate authorities for emergency response.',
    ),
    Question(
      questionText:
          'Why is it important for hazardous materials to be properly secured during transportation?',
      answers: [
        Answer(answerText: 'To prevent theft', isCorrect: false),
        Answer(
            answerText: 'To maintain the balance of the vehicle',
            isCorrect: false),
        Answer(
            answerText: 'To prevent accidental release or spillage',
            isCorrect: true),
        Answer(
            answerText: 'To comply with speed regulations', isCorrect: false),
      ],
      explanation:
          'Properly securing hazardous materials is crucial to prevent accidental release or spillage, which could lead to dangerous incidents.',
    ),
    Question(
      questionText:
          'Which of the following is a common hazard associated with transporting flammable liquids?',
      answers: [
        Answer(answerText: 'Radioactivity', isCorrect: false),
        Answer(answerText: 'Corrosiveness', isCorrect: false),
        Answer(answerText: 'Explosion risk', isCorrect: true),
        Answer(answerText: 'Freezing', isCorrect: false),
      ],
      explanation:
          'Flammable liquids pose an explosion risk, making it essential to handle and transport them following strict safety guidelines.',
    ),
    Question(
      questionText:
          'When transporting chlorine, what additional equipment must be carried in the vehicle?',
      answers: [
        Answer(answerText: 'A portable fire extinguisher', isCorrect: false),
        Answer(answerText: 'An emergency escape mask', isCorrect: true),
        Answer(answerText: 'Extra fuel', isCorrect: false),
        Answer(answerText: 'A first aid kit', isCorrect: false),
      ],
      explanation:
          'When transporting chlorine, drivers must carry an emergency escape mask specifically designed for chlorine exposure, due to its highly toxic nature.',
    ),
    Question(
      questionText:
          'What are "UN numbers" used for in the transportation of hazardous materials?',
      answers: [
        Answer(
            answerText: 'To identify the weight of the material',
            isCorrect: false),
        Answer(answerText: 'To classify the type of hazard', isCorrect: true),
        Answer(
            answerText: 'To indicate the destination country',
            isCorrect: false),
        Answer(
            answerText: 'To specify the packaging requirements',
            isCorrect: false),
      ],
      explanation:
          'UN numbers are used to classify hazardous materials, identifying the specific type of hazard and ensuring appropriate handling and emergency response.',
    ),
    Question(
      questionText:
          'What must a driver do before transporting a hazardous material listed in the Hazardous Materials Table?',
      answers: [
        Answer(
            answerText: 'Obtain a special endorsement on their CDL',
            isCorrect: true),
        Answer(
            answerText: 'Complete a basic vehicle inspection',
            isCorrect: false),
        Answer(answerText: 'Check weather conditions', isCorrect: false),
        Answer(
            answerText: 'Ensure the vehicle has a GPS system',
            isCorrect: false),
      ],
      explanation:
          'Drivers must obtain a special endorsement on their CDL to transport hazardous materials listed in the Hazardous Materials Table, indicating they have the required training and knowledge.',
    ),
    Question(
      questionText:
          'How should incompatible hazardous materials be transported?',
      answers: [
        Answer(answerText: 'In the same compartment', isCorrect: false),
        Answer(answerText: 'Without placards', isCorrect: false),
        Answer(
            answerText: 'Segregated according to compatibility guidelines',
            isCorrect: true),
        Answer(answerText: 'Only during daylight hours', isCorrect: false),
      ],
      explanation:
          'Incompatible hazardous materials must be segregated according to compatibility guidelines to prevent dangerous reactions during transportation.',
    ),
    Question(
      questionText:
          'What is the purpose of a hazardous materials endorsement (HME) on a CDL?',
      answers: [
        Answer(
            answerText: 'To allow the driver to carry passengers',
            isCorrect: false),
        Answer(
            answerText:
                'To certify that the driver can transport hazardous materials safely',
            isCorrect: true),
        Answer(
            answerText: 'To increase the driver\'s salary', isCorrect: false),
        Answer(answerText: 'To reduce insurance premiums', isCorrect: false),
      ],
      explanation:
          'An HME on a CDL certifies that the driver has received specialized training and can safely transport hazardous materials.',
    ),
    Question(
      questionText:
          'What is the first action a driver should take after discovering a hazardous material leak?',
      answers: [
        Answer(
            answerText: 'Continue driving to reach a service station',
            isCorrect: false),
        Answer(
            answerText: 'Try to repair the leak while wearing gloves',
            isCorrect: false),
        Answer(
            answerText: 'Park the vehicle and secure the area',
            isCorrect: true),
        Answer(answerText: 'Call the company manager', isCorrect: false),
      ],
      explanation:
          'The first step after discovering a hazardous material leak is to safely park the vehicle and secure the area to prevent any accidents or further spread of the material.',
    ),
    Question(
      questionText:
          'How often should a driver inspect the cargo when transporting hazardous materials?',
      answers: [
        Answer(answerText: 'Every 3 hours or 150 miles', isCorrect: true),
        Answer(
            answerText: 'Only at the beginning and end of the trip',
            isCorrect: false),
        Answer(answerText: 'Once a day', isCorrect: false),
        Answer(answerText: 'Every 500 miles', isCorrect: false),
      ],
      explanation:
          'Drivers should inspect their cargo every 3 hours or 150 miles, whichever comes first, to ensure the safety and security of hazardous materials.',
    ),
    Question(
      questionText: 'What color placard is used for flammable liquids?',
      answers: [
        Answer(answerText: 'Red', isCorrect: true),
        Answer(answerText: 'Blue', isCorrect: false),
        Answer(answerText: 'Yellow', isCorrect: false),
        Answer(answerText: 'Orange', isCorrect: false),
      ],
      explanation:
          'A red placard is used for flammable liquids, indicating the nature of the hazard during transportation.',
    ),
    Question(
      questionText:
          'What should drivers do before loading or unloading hazardous materials?',
      answers: [
        Answer(answerText: 'Check the weather forecast', isCorrect: false),
        Answer(answerText: 'Ensure the engine is running', isCorrect: false),
        Answer(answerText: 'Turn off the engine', isCorrect: true),
        Answer(answerText: 'Increase the tire pressure', isCorrect: false),
      ],
      explanation:
          'Before loading or unloading hazardous materials, drivers should turn off the engine to minimize the risk of ignition or accidents.',
    ),
    Question(
      questionText:
          'What is the main purpose of having an Emergency Response Plan when transporting hazardous materials?',
      answers: [
        Answer(answerText: 'To guide in navigation', isCorrect: false),
        Answer(
            answerText: 'To provide steps for responding to emergencies',
            isCorrect: true),
        Answer(
            answerText: 'To communicate with the headquarters',
            isCorrect: false),
        Answer(answerText: 'To schedule rest stops', isCorrect: false),
      ],
      explanation:
          'An Emergency Response Plan provides detailed steps for drivers to follow in case of an emergency involving hazardous materials, ensuring a quick and safe response.',
    ),
    Question(
      questionText:
          'How should a driver respond if approached by someone seeking information about the hazardous material being transported?',
      answers: [
        Answer(answerText: 'Share all requested details', isCorrect: false),
        Answer(
            answerText: 'Direct them to the shipping papers', isCorrect: false),
        Answer(
            answerText:
                'Refuse to disclose information unless they are authorized personnel',
            isCorrect: true),
        Answer(
            answerText: 'Ask them to contact the company directly',
            isCorrect: false),
      ],
      explanation:
          'Drivers should only disclose information about the hazardous materials being transported to authorized personnel to maintain security and safety.',
    ),
    Question(
      questionText:
          'What does the term "inhalation hazard" indicate on a placard?',
      answers: [
        Answer(answerText: 'The material is safe to breathe', isCorrect: false),
        Answer(
            answerText: 'The material can be toxic if inhaled',
            isCorrect: true),
        Answer(answerText: 'The material is odorless', isCorrect: false),
        Answer(
            answerText: 'The material should be kept at low temperatures',
            isCorrect: false),
      ],
      explanation:
          'A placard indicating "inhalation hazard" means that the material can be harmful or fatal if inhaled, requiring extra precautions during transport.',
    ),
    Question(
      questionText:
          'What is required when transporting a material that is classified as both poisonous and flammable?',
      answers: [
        Answer(answerText: 'Two separate sets of placards', isCorrect: false),
        Answer(answerText: 'No placards are required', isCorrect: false),
        Answer(answerText: 'Only a flammable placard', isCorrect: false),
        Answer(answerText: 'Placards indicating both hazards', isCorrect: true),
      ],
      explanation:
          'When transporting materials classified as both poisonous and flammable, placards indicating both hazards must be displayed.',
    ),
    Question(
      questionText:
          'Which of the following is not a responsibility of the driver when transporting hazardous materials?',
      answers: [
        Answer(
            answerText: 'Ensuring the materials are properly classified',
            isCorrect: false),
        Answer(
            answerText: 'Placarding the vehicle appropriately',
            isCorrect: false),
        Answer(
            answerText: 'Manufacturing the hazardous materials',
            isCorrect: true),
        Answer(
            answerText: 'Keeping the shipping papers accessible',
            isCorrect: false),
      ],
      explanation:
          'Manufacturing hazardous materials is not the responsibility of the driver. The driver responsibilities include proper classification, placarding, and handling of the materials.',
    ),
    Question(
      questionText:
          'What type of hazard does a placard with a skull and crossbones represent?',
      answers: [
        Answer(answerText: 'Flammability', isCorrect: false),
        Answer(answerText: 'Radioactivity', isCorrect: false),
        Answer(answerText: 'Toxicity', isCorrect: true),
        Answer(answerText: 'Corrosiveness', isCorrect: false),
      ],
      explanation:
          'A placard with a skull and crossbones represents toxicity, indicating that the material can be poisonous if inhaled, ingested, or absorbed through the skin.',
    ),
    Question(
      questionText: 'When is it necessary to use a "Dangerous" placard?',
      answers: [
        Answer(
            answerText: 'When transporting any hazardous material',
            isCorrect: false),
        Answer(
            answerText:
                'When transporting multiple classes of hazardous materials in one vehicle',
            isCorrect: true),
        Answer(
            answerText: 'Only when transporting explosives', isCorrect: false),
        Answer(
            answerText:
                'When the total weight of hazardous materials is under a certain limit',
            isCorrect: false),
      ],
      explanation:
          'A "Dangerous" placard is used when transporting multiple classes of hazardous materials in one vehicle, indicating a variety of risks.',
    ),
    Question(
      questionText:
          'Which agency regulates the transportation of hazardous materials in the United States?',
      answers: [
        Answer(
            answerText: 'Federal Motor Carrier Safety Administration (FMCSA)',
            isCorrect: false),
        Answer(
            answerText: 'Department of Transportation (DOT)', isCorrect: true),
        Answer(
            answerText: 'Environmental Protection Agency (EPA)',
            isCorrect: false),
        Answer(
            answerText: 'Occupational Safety and Health Administration (OSHA)',
            isCorrect: false),
      ],
      explanation:
          'The Department of Transportation (DOT) regulates the transportation of hazardous materials in the United States, setting standards for safety and handling.',
    ),
    Question(
      questionText:
          'Which item is essential for a driver to have when transporting hazardous materials?',
      answers: [
        Answer(answerText: 'A detailed map of the route', isCorrect: false),
        Answer(
            answerText: 'An Emergency Response Guidebook (ERG)',
            isCorrect: true),
        Answer(answerText: 'A list of local radio stations', isCorrect: false),
        Answer(answerText: 'A company credit card for fuel', isCorrect: false),
      ],
      explanation:
          'An Emergency Response Guidebook (ERG) is essential for drivers transporting hazardous materials, as it provides critical information for emergency response and handling procedures.',
    ),
    Question(
      questionText:
          'What is the main purpose of the Hazardous Materials Regulations (HMR)?',
      answers: [
        Answer(answerText: 'To increase shipping efficiency', isCorrect: false),
        Answer(
            answerText: 'To ensure safe transportation of hazardous materials',
            isCorrect: true),
        Answer(answerText: 'To reduce transportation costs', isCorrect: false),
        Answer(answerText: 'To expedite customs clearance', isCorrect: false),
      ],
      explanation:
          'The main purpose of the Hazardous Materials Regulations (HMR) is to ensure the safe and secure transportation of hazardous materials, minimizing risks to public health and safety.',
    ),
    Question(
      questionText: 'What does a placard with the number 3 indicate?',
      answers: [
        Answer(answerText: 'Corrosive material', isCorrect: false),
        Answer(answerText: 'Flammable liquid', isCorrect: true),
        Answer(answerText: 'Radioactive material', isCorrect: false),
        Answer(answerText: 'Explosive material', isCorrect: false),
      ],
      explanation:
          'A placard with the number 3 indicates flammable liquid, a classification used in the Hazardous Materials Identification System (HMIS).',
    ),
    Question(
      questionText:
          'Which type of fire extinguisher should not be used on electrical fires when transporting hazardous materials?',
      answers: [
        Answer(
            answerText: 'Carbon dioxide (CO2) extinguisher', isCorrect: false),
        Answer(answerText: 'Dry chemical extinguisher', isCorrect: false),
        Answer(answerText: 'Water extinguisher', isCorrect: true),
        Answer(answerText: 'Foam extinguisher', isCorrect: false),
      ],
      explanation:
          'Water extinguishers should not be used on electrical fires due to the risk of electrocution and spreading the fire, especially when transporting hazardous materials.',
    ),
    Question(
      questionText:
          'What is the minimum training requirement for a driver transporting hazardous materials?',
      answers: [
        Answer(answerText: 'Annual safety training', isCorrect: false),
        Answer(
            answerText: 'Initial and recurrent training every three years',
            isCorrect: true),
        Answer(answerText: 'One-time specialized training', isCorrect: false),
        Answer(answerText: 'Training every five years', isCorrect: false),
      ],
      explanation:
          'Drivers transporting hazardous materials must complete initial training and recurrent training every three years to stay updated on safety procedures and regulations.',
    ),
    Question(
      questionText:
          'What is the primary hazard associated with Class 1 materials?',
      answers: [
        Answer(answerText: 'Explosiveness', isCorrect: true),
        Answer(answerText: 'Radioactivity', isCorrect: false),
        Answer(answerText: 'Toxicity', isCorrect: false),
        Answer(answerText: 'Flammability', isCorrect: false),
      ],
      explanation:
          'Class 1 materials are primarily associated with explosiveness, requiring special handling and precautions during transportation.',
    ),
    Question(
      questionText:
          'What is the main purpose of the automatic slack adjuster in an air brake system?',
      answers: [
        Answer(answerText: 'To adjust the radio volume', isCorrect: false),
        Answer(
            answerText:
                'To maintain the correct distance between brake shoes and drums',
            isCorrect: true),
        Answer(answerText: 'To regulate air pressure', isCorrect: false),
        Answer(
            answerText: 'To control the speed of the vehicle',
            isCorrect: false),
      ],
      explanation:
          'The automatic slack adjuster is designed to maintain the correct distance between the brake shoes and the drum, ensuring effective braking action.',
    ),
    Question(
      questionText:
          'What does the air compressor governor control in an air brake system?',
      answers: [
        Answer(answerText: 'The speed of the vehicle', isCorrect: false),
        Answer(
            answerText:
                'When the air compressor pumps air into the air storage tanks',
            isCorrect: true),
        Answer(answerText: 'The temperature of the air', isCorrect: false),
        Answer(answerText: 'The pressure in the brake lines', isCorrect: false),
      ],
      explanation:
          'The air compressor governor in an air brake system controls when the air compressor pumps air into the air storage tanks.',
    ),
    Question(
      questionText:
          'What can cause the air compressor to overheat in an air brake system?',
      answers: [
        Answer(answerText: 'Excessive use of the horn', isCorrect: false),
        Answer(answerText: 'Low air pressure in the tanks', isCorrect: false),
        Answer(
            answerText: 'Leaving the engine idle for too long',
            isCorrect: false),
        Answer(
            answerText: 'Lack of adequate air flow to the compressor',
            isCorrect: true),
      ],
      explanation:
          'Lack of adequate air flow to the air compressor can cause it to overheat, potentially leading to system failure.',
    ),
    Question(
      questionText:
          'What is the function of the air pressure relief valve in an air brake system?',
      answers: [
        Answer(
            answerText: 'To release air if the pressure becomes too high',
            isCorrect: true),
        Answer(
            answerText: 'To add air to the system when pressure is low',
            isCorrect: false),
        Answer(
            answerText: 'To sound an alarm when air pressure drops',
            isCorrect: false),
        Answer(
            answerText: 'To control the direction of air flow',
            isCorrect: false),
      ],
      explanation:
          'The air pressure relief valve in an air brake system releases air if the pressure becomes too high, preventing damage to the system.',
    ),
    Question(
      questionText:
          'What is a common symptom of a malfunctioning air dryer in an air brake system?',
      answers: [
        Answer(answerText: 'Increased stopping distances', isCorrect: false),
        Answer(answerText: 'Unusual noises during braking', isCorrect: false),
        Answer(
            answerText: 'Excessive moisture in the air tanks', isCorrect: true),
        Answer(
            answerText: 'Frequent need for brake adjustments',
            isCorrect: false),
      ],
      explanation:
          'A malfunctioning air dryer in an air brake system can lead to excessive moisture in the air tanks, potentially causing brake failure.',
    ),
    Question(
      questionText:
          'What is the recommended method for testing the air leakage rate in an air brake system?',
      answers: [
        Answer(answerText: 'Pumping the brake pedal rapidly', isCorrect: false),
        Answer(
            answerText: 'Applying the service brakes at maximum pressure',
            isCorrect: true),
        Answer(answerText: 'Driving at highway speeds', isCorrect: false),
        Answer(
            answerText: 'Releasing all the air from the system',
            isCorrect: false),
      ],
      explanation:
          'Testing the air leakage rate is best done by applying the service brakes at maximum pressure and observing the air pressure gauge for any rapid drop.',
    ),
    Question(
      questionText:
          'In an air brake system, what is the main role of the supply pressure gauge?',
      answers: [
        Answer(answerText: 'To measure the vehicle speed', isCorrect: false),
        Answer(
            answerText: 'To display the air pressure in the tanks',
            isCorrect: true),
        Answer(answerText: 'To indicate the correct gear', isCorrect: false),
        Answer(answerText: 'To warn of low fuel levels', isCorrect: false),
      ],
      explanation:
          'The supply pressure gauge in an air brake system displays the air pressure available in the tanks, crucial for safe operation of the brakes.',
    ),
    Question(
      questionText: 'How does moisture affect an air brake system?',
      answers: [
        Answer(answerText: 'It improves braking efficiency', isCorrect: false),
        Answer(
            answerText: 'It can freeze in cold weather, causing brake failure',
            isCorrect: true),
        Answer(answerText: 'It cleans the air lines', isCorrect: false),
        Answer(answerText: 'It increases air pressure', isCorrect: false),
      ],
      explanation:
          'Moisture in an air brake system can freeze in cold weather, leading to blocked air lines and potential brake failure.',
    ),
    Question(
      questionText: 'Why should a driver drain the air tanks regularly?',
      answers: [
        Answer(
            answerText: 'To maintain the correct air pressure',
            isCorrect: false),
        Answer(
            answerText: 'To remove moisture and oil buildup', isCorrect: true),
        Answer(answerText: 'To check for air leaks', isCorrect: false),
        Answer(answerText: 'To refill with fresh air', isCorrect: false),
      ],
      explanation:
          'Regularly draining the air tanks is necessary to remove moisture and oil buildup, which can negatively impact the performance of the air brake system.',
    ),
    Question(
      questionText:
          'What is the purpose of a "low air pressure" warning signal in an air brake system?',
      answers: [
        Answer(
            answerText: 'To indicate when to refuel the vehicle',
            isCorrect: false),
        Answer(
            answerText:
                'To alert the driver when air pressure is dangerously low',
            isCorrect: true),
        Answer(
            answerText: 'To signal when the brakes are fully applied',
            isCorrect: false),
        Answer(
            answerText: 'To indicate when the air tanks are full',
            isCorrect: false),
      ],
      explanation:
          'The "low air pressure" warning signal alerts the driver when the air pressure in the system falls below a safe level, indicating potential brake failure.',
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
