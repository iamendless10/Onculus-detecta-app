import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'backendapi.dart';
import 'dart:convert';



class information extends StatefulWidget {
  final Map<String, dynamic> resp;
  const information({Key? key, required this.resp}) : super(key: key);
  @override
  _informationState createState() => _informationState();
}

class _informationState extends State<information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFe2c9e8),
        automaticallyImplyLeading: false,
        leading: CircleAvatar(
            backgroundColor: Color(0xFFe2c9e8),
            child: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),color: Color(0xFF222222), onPressed: (){Navigator.pop(context);},)),
        title: Text('                  Details',textAlign: TextAlign.center,style: GoogleFonts.rowdies(color: Color(0xFF222222),fontSize: 18,),),
        actions: [
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     IconButton(
          //       icon: Icon(Icons.search),
          //       onPressed: () {
          //         // Do something when the search icon is pressed
          //       },
          //     ),
          //   ],
          // ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFFe2c9e8),
                child: IconButton(
                  icon: Icon(Icons.thumb_up_off_alt_sharp,color: Color(0xFF222222),),
                  onPressed: () {
                    // Do something when the settings icon is pressed
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 1300,
                width: 360,
                color: Color(0xFFe2c9e8),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 10,
                      color: Color(0xFFe2c9e8),
                    ),
                    Container(
                      height: 300,
                      width: 320,
                      decoration:
                      BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.resp['display_img']),
                          // image: NetworkImage(widget.resp['display_img']),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFFe2c9e8),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 10,
                      color: Color(0xFFe2c9e8),
                    ),
                    Container(
                      height: 80,
                      width: 350,
                      color: Color(0xFFe2c9e8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.resp['name'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 28,),),
                          Text(widget.resp['cancer'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF5C5C5C),fontSize: 20,),),
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 10,
                      color: Color(0xFFe2c9e8),
                    ),
                    // Container(
                    //   height: 500,
                    //   width: 350,
                    //   color: Color(0xFFe2c9e8),
                    //   // color: Colors.red,
                    //   child: Column(
                    //     children: <Widget>[
                    //       Text('Pests',textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                    //       Text(widget.resp['pests'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 17,),),
                    //       Container(
                    //         height: 50,
                    //         width: 10,
                    //         color: Color(0xFFe2c9e8),
                    //       ),
                    //       Container(
                    //         height: 220,
                    //         width: 380,
                    //         color: Color(0xFFe2c9e8),
                    //         child: ListView(
                    //           physics: const BouncingScrollPhysics(),
                    //           scrollDirection: Axis.horizontal,
                    //           children: [
                    //             Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Container(
                    //                 width: 180,
                    //                 height: 120,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(30),
                    //                   color: Color(0xffcfa5d9),
                    //                 ),
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   crossAxisAlignment: CrossAxisAlignment.center,
                    //                   children: [
                    //                     Container(
                    //                       height: 30,
                    //                       width: 180,
                    //                       color: Colors.transparent,
                    //                       child: Column(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         crossAxisAlignment: CrossAxisAlignment.center,
                    //                         children: [
                    //                           Text(widget.resp['pest_1'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF2b2b2b),fontSize: 20,),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       height: 150,
                    //                       width: 150,
                    //                       decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.circular(30),
                    //                         image: DecorationImage(
                    //                           image: NetworkImage("https://s3.tebi.io/floraximages1/display/hibiscus.png"),
                    //                           fit: BoxFit.fill,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Container(
                    //                 width: 180,
                    //                 height: 120,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(30),
                    //                   color: Color(0xffcfa5d9),
                    //                 ),
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   crossAxisAlignment: CrossAxisAlignment.center,
                    //                   children: [
                    //                     Container(
                    //                       height: 30,
                    //                       width: 180,
                    //                       color: Colors.transparent,
                    //                       child: Column(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         crossAxisAlignment: CrossAxisAlignment.center,
                    //                         children: [
                    //                           Text(widget.resp['pest_2'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       height: 150,
                    //                       width: 150,
                    //                       decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.circular(30),
                    //                         image: DecorationImage(
                    //                           image: NetworkImage("https://s3.tebi.io/floraximages1/display/hibiscus.png"),
                    //                           fit: BoxFit.fill,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Container(
                    //                 width: 180,
                    //                 height: 120,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(30),
                    //                   color: Color(0xffcfa5d9),
                    //                 ),
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   crossAxisAlignment: CrossAxisAlignment.center,
                    //                   children: [
                    //                     Container(
                    //                       height: 30,
                    //                       width: 180,
                    //                       color: Colors.transparent,
                    //                       child: Column(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         crossAxisAlignment: CrossAxisAlignment.center,
                    //                         children: [
                    //                           Text(widget.resp['pest_3'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       height: 150,
                    //                       width: 150,
                    //                       decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.circular(30),
                    //                         image: DecorationImage(
                    //                           image: NetworkImage("https://s3.tebi.io/floraximages1/display/hibiscus.png"),
                    //                           fit: BoxFit.fill,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Container(
                    //                 width: 180,
                    //                 height: 120,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(30),
                    //                   color: Color(0xffcfa5d9),
                    //                 ),
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   crossAxisAlignment: CrossAxisAlignment.center,
                    //                   children: [
                    //                     Container(
                    //                       height: 30,
                    //                       width: 180,
                    //                       color: Colors.transparent,
                    //                       child: Column(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         crossAxisAlignment: CrossAxisAlignment.center,
                    //                         children: [
                    //                           Text(widget.resp['pest_4'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       height: 150,
                    //                       width: 150,
                    //                       decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.circular(30),
                    //                         image: DecorationImage(
                    //                           image: NetworkImage("https://s3.tebi.io/floraximages1/display/hibiscus.png"),
                    //                           fit: BoxFit.fill,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             )
                    //
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      height: 200,
                      width: 350,
                      color: Color(0xFFe2c9e8),
                      // color: Colors.red,
                      child: Column(
                        children: <Widget>[
                          Text('Overview',textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                          Text(widget.resp['info'] ?? 'Unknown',textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 17,),),
                        ],
                      ),
                    ),
                    Container(
                      height: 165,
                      width: 350,
                      color: Color(0xFFe2c9e8),
                      // color: Colors.red,
                      child: Column(
                        children: <Widget>[
                          Text('Preventive Measures',textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                          Text(widget.resp['preventive_measure'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 17,),),
                        ],
                      ),
                    ),
                    Container(
                      height: 185,
                      width: 350,
                      color: Color(0xFFe2c9e8),
                      // color: Colors.red,
                      child: Column(
                        children: <Widget>[
                          Text('Risk Factors',textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                          Text(widget.resp['risk_factor'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 17,),),
                        ],
                      ),
                    ),
                    Container(
                      height: 205,
                      width: 350,
                      color: Color(0xFFe2c9e8),
                      // color: Colors.red,
                      child: Column(
                        children: <Widget>[
                          Text('Symptoms',textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                          Text(widget.resp['symptoms'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 17,),),
                        ],
                      ),
                    ),
                    // Container(
                    //   height: 500,
                    //   width: 350,
                    //   color: Color(0xFFe2c9e8),
                    //   // color: Colors.red,
                    //   child: Column(
                    //     children: <Widget>[
                    //       Text('Culinary Uses',textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                    //       Text(widget.resp['culinary_uses'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 17,),),
                    //       Container(
                    //         height: 50,
                    //         width: 10,
                    //         color: Color(0xFFe2c9e8),
                    //       ),
                    //       Container(
                    //         height: 220,
                    //         width: 380,
                    //         color: Color(0xFFe2c9e8),
                    //         child: ListView(
                    //           physics: const BouncingScrollPhysics(),
                    //           scrollDirection: Axis.horizontal,
                    //           children: [
                    //             Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Container(
                    //                 width: 180,
                    //                 height: 120,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(30),
                    //                   color: Color(0xffcfa5d9),
                    //                 ),
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   crossAxisAlignment: CrossAxisAlignment.center,
                    //                   children: [
                    //                     Container(
                    //                       height: 30,
                    //                       width: 180,
                    //                       color: Colors.transparent,
                    //                       child: Column(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         crossAxisAlignment: CrossAxisAlignment.center,
                    //                         children: [
                    //                           Text(widget.resp['culinary_1'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       height: 150,
                    //                       width: 150,
                    //                       decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.circular(30),
                    //                         image: DecorationImage(
                    //                           image: NetworkImage("https://s3.tebi.io/floraximages1/display/hibiscus.png"),
                    //                           fit: BoxFit.fill,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Container(
                    //                 width: 180,
                    //                 height: 120,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(30),
                    //                   color: Color(0xffcfa5d9),
                    //                 ),
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   crossAxisAlignment: CrossAxisAlignment.center,
                    //                   children: [
                    //                     Container(
                    //                       height: 30,
                    //                       width: 180,
                    //                       color: Colors.transparent,
                    //                       child: Column(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         crossAxisAlignment: CrossAxisAlignment.center,
                    //                         children: [
                    //                           Text(widget.resp['culinary_2'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       height: 150,
                    //                       width: 150,
                    //                       decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.circular(30),
                    //                         image: DecorationImage(
                    //                           image: NetworkImage("https://s3.tebi.io/floraximages1/display/hibiscus.png"),
                    //                           fit: BoxFit.fill,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Container(
                    //                 width: 180,
                    //                 height: 120,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(30),
                    //                   color: Color(0xffcfa5d9),
                    //                 ),
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   crossAxisAlignment: CrossAxisAlignment.center,
                    //                   children: [
                    //                     Container(
                    //                       height: 30,
                    //                       width: 180,
                    //                       color: Colors.transparent,
                    //                       child: Column(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         crossAxisAlignment: CrossAxisAlignment.center,
                    //                         children: [
                    //                           Text(widget.resp['culinary_3'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       height: 150,
                    //                       width: 150,
                    //                       decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.circular(30),
                    //                         image: DecorationImage(
                    //                           image: NetworkImage("https://s3.tebi.io/floraximages1/display/hibiscus.png"),
                    //                           fit: BoxFit.fill,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   height: 500,
                    //   width: 350,
                    //   color: Color(0xFFe2c9e8),
                    //   // color: Colors.red,
                    //   child: Column(
                    //     children: <Widget>[
                    //       Text('Common diseases',textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                    //       Text(widget.resp['common_diseases'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 17,),),
                    //       Container(
                    //         height: 50,
                    //         width: 10,
                    //         color: Color(0xFFe2c9e8),
                    //       ),
                    //       Container(
                    //         height: 220,
                    //         width: 380,
                    //         color: Color(0xFFe2c9e8),
                    //         child: ListView(
                    //           physics: const BouncingScrollPhysics(),
                    //           scrollDirection: Axis.horizontal,
                    //           children: [
                    //             Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Container(
                    //                 width: 180,
                    //                 height: 120,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(30),
                    //                   color: Color(0xffcfa5d9),
                    //                 ),
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   crossAxisAlignment: CrossAxisAlignment.center,
                    //                   children: [
                    //                     Container(
                    //                       height: 30,
                    //                       width: 180,
                    //                       color: Colors.transparent,
                    //                       child: Column(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         crossAxisAlignment: CrossAxisAlignment.center,
                    //                         children: [
                    //                           Text(widget.resp['disease_1'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       height: 150,
                    //                       width: 150,
                    //                       decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.circular(30),
                    //                         image: DecorationImage(
                    //                           image: NetworkImage("https://s3.tebi.io/floraximages1/display/hibiscus.png"),
                    //                           fit: BoxFit.fill,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Container(
                    //                 width: 180,
                    //                 height: 120,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(30),
                    //                   color: Color(0xffcfa5d9),
                    //                 ),
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   crossAxisAlignment: CrossAxisAlignment.center,
                    //                   children: [
                    //                     Container(
                    //                       height: 30,
                    //                       width: 180,
                    //                       color: Colors.transparent,
                    //                       child: Column(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         crossAxisAlignment: CrossAxisAlignment.center,
                    //                         children: [
                    //                           Text(widget.resp['disease_2'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       height: 150,
                    //                       width: 150,
                    //                       decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.circular(30),
                    //                         image: DecorationImage(
                    //                           image: NetworkImage("https://s3.tebi.io/floraximages1/display/hibiscus.png"),
                    //                           fit: BoxFit.fill,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Container(
                    //                 width: 180,
                    //                 height: 120,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(30),
                    //                   color: Color(0xffcfa5d9),
                    //                 ),
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   crossAxisAlignment: CrossAxisAlignment.center,
                    //                   children: [
                    //                     Container(
                    //                       height: 30,
                    //                       width: 180,
                    //                       color: Colors.transparent,
                    //                       child: Column(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         crossAxisAlignment: CrossAxisAlignment.center,
                    //                         children: [
                    //                           Text(widget.resp['disease_3'] ?? "Unknown",textAlign: TextAlign.center,style: GoogleFonts.kanit(color: Color(0xFF284927),fontSize: 20,),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       height: 150,
                    //                       width: 150,
                    //                       decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.circular(30),
                    //                         image: DecorationImage(
                    //                           image: NetworkImage("https://s3.tebi.io/floraximages1/display/hibiscus.png"),
                    //                           fit: BoxFit.fill,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //
                    //     ],
                    //   ),
                    // ),

                  ],
                ),
              ),
              Container(
                height: 110,
                width: 360,
                color: Color(0xFFe2c9e8),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 110,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                            )
                        ),
                        child: Row(
                          children: <Widget>[
                            Text('      '),
                            Icon(Icons.bar_chart,color: Colors.black,),
                            Text('   Statistics',textAlign: TextAlign.center,style: GoogleFonts.rowdies(color: Colors.black,fontSize: 18,),),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        height: 110,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Color(0xff6f357e),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                            )
                        ),
                        child: Row(
                          children: <Widget>[
                            Text('      '),
                            Icon(Icons.info_rounded,color: Color(0xFFFFFFFF),),
                            Text('   Information',textAlign: TextAlign.center,style: GoogleFonts.rowdies(color: Color(0xFFFFFFFF),fontSize: 18,),),
                          ],
                        ),
                      ),
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
