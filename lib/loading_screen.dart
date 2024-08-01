import 'package:flutter/material.dart';
import 'package:lri_rbb/homepage.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
          
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => homescreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffffffff),
              Color(0xffffffff),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.transparent,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Container(
                    color: Colors.transparent,
                    height: 70,
                    width: 180,
                    child: Image.asset('images/Ministry_of_Health_India.svg.png', fit: BoxFit.fill,),
                  ),
                  SizedBox(width: 60,),
                  Container(
                    height: 150,
                    width: 110,
                    color: Colors.transparent,
                    child: Image.asset('icons/india.png', fit: BoxFit.contain,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 170,),
            Container(
              height: 190,
              width: double.infinity,
              color: Colors.transparent,
              child: Image.asset('images/Frame 19.png', fit: BoxFit.contain,),
            ),
            SizedBox(height: 187,),
            // Container(
            //   height: 70,
            //   width: double.infinity,
            //   color: Colors.transparent,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: <Widget>[
            //       SizedBox(width: 30,),
            //       Container(
            //         height: 70,
            //         width: 140,
            //         color: Colors.transparent,
            //         child: Container(child: Image.asset('icons/digital_india.png')),
            //       ),
            //       SizedBox(height: 20,),
            //       Container(
            //         height: 50,
            //         width: 190,
            //         color: Colors.transparent,
            //         child: Image.asset('images/nih.png',fit: BoxFit.fill,),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

