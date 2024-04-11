import 'package:flutter/material.dart';

class intro1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "المدارس",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'lib/images/school.png', // Replace with your image URL
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              "اكثر من 5 مدارس، ولكل منها مهمة فريدة، هدفنا المشترك هو رعاية ورفع مهارات كل طفل، وتعزيز مستقبل أكثر إشراقًا للجميع",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
