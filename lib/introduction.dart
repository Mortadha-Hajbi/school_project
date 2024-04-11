import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school/intro_pages/intro1.dart';
import 'package:school/intro_pages/intro2.dart';
import 'package:school/intro_pages/intro3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onlastpage = false;
  bool onfirstpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 40, 40),
        title: Center(
            child: Text(
          'دائرة اللغة العربية بئر الحفي سيدي بوزيد',
          style: GoogleFonts.poppins(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        )),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onlastpage = (index == 2);
                onfirstpage = (index == 0);
              });
            },
            children: [
              intro1(),
              intro2(),
              intro3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                onfirstpage
                    ? GestureDetector(
                        onTap: (() {
                          _controller.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        }),
                        child: Text(''))
                    : GestureDetector(
                        onTap: (() {
                          _controller.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        }),
                        child: Text('السابق')),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),
                onlastpage
                    ? GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text(''))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text('التالي')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
