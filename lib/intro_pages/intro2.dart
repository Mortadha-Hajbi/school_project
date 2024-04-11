import 'package:flutter/material.dart';

class intro2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "المعلمون",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 20),
          Image.asset(
            'lib/images/teacher.png', // Replace with your image URL
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            " أكثر من 60 معلم، يكرسون أنفسهم بلا كلل لتشكيل عقول الشباب، وتحويل الفصول الدراسية إلى مساحات نابضة بالحياة حيث تزدهر المعرفة وتنطلق الأحلام",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
