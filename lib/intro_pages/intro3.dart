import 'package:flutter/material.dart';

class intro3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "المتفقدون",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 20),
          Image.asset(
            'lib/images/inspector.png', // Replace with your image URL
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            "يضمن المتفقدون، وهم الأوصياء اليقظون للتميز التعليمي، أن تتماشى كل التفاصيل مع السعي لتحقيق الجودة، مما يضمن بيئة آمنة ومثرية لكل من الطلاب والمعلمين.",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
