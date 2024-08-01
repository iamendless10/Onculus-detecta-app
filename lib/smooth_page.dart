// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:lri_rbb/page1.dart';
// import 'package:lri_rbb/page2.dart';
// import 'package:lri_rbb/page3.dart';
// import 'package:lri_rbb/page4.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class smooth_page extends StatelessWidget {
//   smooth_page({Key? key}) : super(key: key);
//
//   final _controller= PageController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           SizedBox(
//             height: 550,
//             child: PageView(
//               controller: _controller,
//               children: [
//                 page1(),
//                 page2(),
//                 page3(),
//                 page4(),
//               ],
//             ),
//           ),
//           SizedBox(height: 20,),
//           SmoothPageIndicator(
//             controller: _controller,
//             count: 4,
//             effect: ExpandingDotsEffect(
//               activeDotColor: Colors.black,
//               dotColor: Colors.pink,
//               dotHeight: 10,
//               dotWidth: 10,
//             ),
//           ),
//           SizedBox(height: 20,),
//           Container(
//             height: 188,
//             width: double.infinity,
//             color: Colors.red,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   child: Text('PLANT WITH US!',textAlign: TextAlign.center,style: GoogleFonts.balsamiqSans(color: Colors.white,fontSize:16),),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       )
//     );
//   }
// }
