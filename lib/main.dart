import 'package:flutter/material.dart';
import 'package:lri_rbb/loading_screen.dart';

void main(){
  runApp(MaterialApp(home: start(),));
}

class start extends StatelessWidget {
  const start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          loading_screen(),
          //comment
        ],
      ),
    );
  }
}
