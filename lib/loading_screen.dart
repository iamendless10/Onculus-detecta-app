import 'package:flutter/material.dart';
import 'package:lri_rbb/main.dart';


class loading_screen extends StatelessWidget {
  const loading_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => ),
      //   );
      // },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffE6FFFD),
                Color(0xffB0DAFF),
                //comment

              ]
            )
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
                      height: 150,
                      width: 180,
                      child: Image.asset('icons/law.png',fit: BoxFit.contain,),
                    ),
                    SizedBox(width: 60,),
                    Container(
                      height: 150,
                      width: 110,
                      color: Colors.transparent,
                      child: Image.asset('icons/india.png',fit: BoxFit.contain,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 170,),

              Container(
                height: 150,
                width: double.infinity,
                color: Colors.transparent,
                child: Image.asset('icons/logo_main.png',fit: BoxFit.contain,),
              ),

              SizedBox(height: 187,),


              Container(
                height: 120,
                width: double.infinity,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(width: 30,),
                    Container(
                      height: 70,
                      width: 140,
                      color: Colors.transparent,
                      child: Container(child: Image.asset('icons/digital_india.png')),
                    ),

                    SizedBox(height: 20,),

                    Container(
                      height: 70,
                      width: 140,
                      color: Colors.transparent,
                      child: Image.asset('icons/data.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
