import 'package:flutter/material.dart';
import 'general_knowledge.dart';
import 'airbrakes.dart';
import 'combinations.dart';
import 'double_triples.dart';
import 'hazmat.dart';
import 'practice.dart';
import 'school_bus.dart';
import 'tanks.dart';

class QuickLearningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Learning'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GeneralKnowledgePage(),
                  ),
                );
              },
              child: buildSection('Section 1: General Knowledge', context),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AirbrakesPage(),
                  ),
                );
              },
              child: buildSection('Section 2: Airbrakes', context),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CombinationsPage(),
                  ),
                );
              },
              child: buildSection('Section 3: Combinations', context),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoubleTriplesPage(),
                  ),
                );
              },
              child: buildSection('Section 4: Double and Triples', context),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HazmatPage(),
                  ),
                );
              },
              child: buildSection('Section 5: Hazmat', context),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PracticePage(),
                  ),
                );
              },
              child: buildSection('Section 6: Practice', context),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SchoolBusPage(),
                  ),
                );
              },
              child: buildSection('Section 7: School Bus', context),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TanksPage(),
                  ),
                );
              },
              child: buildSection('Section 8: Tanks', context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
