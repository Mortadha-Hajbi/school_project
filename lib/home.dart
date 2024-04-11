import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 40, 40),
        title: Text('School Introduction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildIntroSection(
              'MEow',
              'maw maw maw maw ',
              'lib/images/cat.jpeg',
            ),
            SizedBox(height: 16.0),
            _buildIntroSection(
              'meeaww',
              'meow mewowwwwwwawaaw waa',
              'lib/images/cat.jpeg',
            ),
            SizedBox(height: 16.0),
            _buildIntroSection(
              'maw law ',
              'maw mawmwa ',
              'lib/images/cat.jpeg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroSection(
      String title, String description, String imagePath) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(description),
            ],
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
