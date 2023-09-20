import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lri_rbb/page1.dart';
import 'package:lri_rbb/page2.dart';
import 'package:lri_rbb/page3.dart';
import 'package:lri_rbb/page4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class smooth_page extends StatelessWidget {
  smooth_page({Key? key}) : super(key: key);

  final _controller= PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 550,
            child: PageView(
              controller: _controller,
              children: [
                page1(),
                page2(),
                page3(),
                page4(),
              ],
            ),
          ),
          SizedBox(height: 40,),
          SmoothPageIndicator(
            controller: _controller,
            count: 4,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.black,
              dotColor: Colors.pink,
              dotHeight: 10,
              dotWidth: 10,
            ),
          )
        ],
      )
    );
  }
}
