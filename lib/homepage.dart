import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lri_rbb/page3.dart';
import 'package:lri_rbb/searchbar.dart';
import 'package:lri_rbb/socket.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/rendering.dart';
import 'videostream.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';

class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int mycurrentindex = 0; // Initialize with the desired initial value

  List<Widget> myitems = [
    Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page3()),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30), // Adjust the radius as needed
            child: Image.asset('images/Mask group-1.png'),
          ),
        );
      },
    ),
    Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page3()),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30), // Adjust the radius as needed
            child: Image.asset('images/Mask group.png'),
          ),
        );
      },
    ),
    Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchBarScreen()),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30), // Adjust the radius as needed
            child: Image.asset('images/WhatsApp Image 2023-11-24 at 09.43.03_2dcfe759.jpg'),
          ),
        );
      },
    ),
    // Add more images as needed
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    bool isScanQRSelected=false;
    return Scaffold(
      // floatingActionButton: Container(
      //
      //   width: 180,
      //   height: 60,
      //   child: FloatingActionButton(
      //     elevation: 10,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(30.0),
      //     ),
      //     onPressed: () {
      //       // Add your action here
      //     },
      //     child: Stack(
      //       children: [
      //         Positioned(
      //           top: 5,
      //           left: 20,
      //           child: Image.asset(
      //             'icons/woman.png', // Replace with the correct asset path
      //             width: 50, // Adjust the width as needed
      //             height: 50, // Adjust the height as needed
      //           ),
      //         ),
      //         Positioned(
      //           top: 10,
      //           left: 65,
      //           // right: 20, // Adjust the right position as needed
      //           child: Column(
      //             children: [
      //               Text(' Chat with',textAlign: TextAlign.center,style: GoogleFonts.rowdies(color: Colors.white,fontSize:15),),
      //               Text(' NyayMitra',textAlign: TextAlign.center,style: GoogleFonts.rowdies(color: Colors.white,fontSize:18),),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,



      backgroundColor: Color(0xfff4eef6),
    bottomNavigationBar: SweetNavBar(
    currentIndex: 0,
      items: [
        SweetNavBarItem(
          sweetLabel: 'Home',
          sweetIcon: Icon(Icons.home_rounded),
        ),
        SweetNavBarItem(
          sweetLabel: 'Scan QR',
          sweetIcon: GestureDetector(
            onTap: () {
              setState(() {
                isScanQRSelected = true; // Set the selection state to true
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoStream()),
              ).then((_) {
                setState(() {
                  isScanQRSelected = false; // Reset the selection state after returning from VideoStream page
                });
              });
            },
            child: Icon(
              Icons.qr_code_scanner_rounded,
            ),
          ),
        ),
        SweetNavBarItem(
          sweetLabel: 'Profile',
          sweetIcon: Icon(Icons.person_outline_rounded),
        ),
      ],
      onTap: (index) {
        // Handle onTap for navigation bar
      },
    ),


    appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfff4eef6),
        toolbarHeight: 50,
        leading: GestureDetector(
          child: Image.asset('images/this-also-logo-bro-removebg-preview.png'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoStream()),
            );
          },
        ),
        leadingWidth: 70,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                // Handle the image tap here
              },
              child: Image.asset(
                'icons/hindi.png',
                height: 28,
                width: 35,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                // Handle the image tap here
              },
              child: Image.asset(
                'images/user.png',
                height: 25,
                width: 29,
              ),
            ),
          ),
        ],
      ),


      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xfff4eef6),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                width: 340,
                color: Colors.transparent,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xfff0f0f0),
                    hintText: 'Search Services',
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none
                    ),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        // Clear the search text
                      },
                    ),
                  ),
                  onChanged: (value) {
                    // Handle search query changes here
                    // 'value' contains the current search query text
                  },
                ),
              ),
              CarouselSlider(
                items: myitems,
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  autoPlayInterval: const Duration(seconds: 4),
                  enlargeCenterPage: true,
                  aspectRatio: 5.0,
                  height: 200,
                  scrollPhysics: BouncingScrollPhysics(),
                  onPageChanged: (index, reason) {
                    setState(() {
                      mycurrentindex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 2), // Add some spacing
              AnimatedSmoothIndicator(
                activeIndex: mycurrentindex,
                count: myitems.length,
                effect: WormEffect(
                    activeDotColor: Colors.black54,
                    dotWidth: 4,
                    dotHeight: 4,
                    dotColor: Color(0xff4e5052)
                ),
              ),
              Container(
                height: 370,             ////////IMPORTANT LINE
                width: double.infinity,
                color: Color(0xfff4eef6),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 130,
                      width: 340,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xffcaabd3),
                                Color(0xffcaabd3),
                                // Color(0xffB0DAFF),

                              ]
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(

                                height: 30,
                                width: double.infinity,
                                color: Colors.transparent,
                                child: Text('   Welcome to OnCulus Detecta!',textAlign: TextAlign.start,style: GoogleFonts.anton(color: Colors.black,fontSize:18),),
                              ),
                              Container(
                                height: 30,
                                width: double.infinity,
                                color: Colors.transparent,
                                child: Text('      Login to use all the features & services of OnCulus',textAlign: TextAlign.start,style: GoogleFonts.viga(color: Colors.black,fontSize:12),),
                              ),

                              SizedBox(height: 10,),

                              Row(
                                children: [
                                  SizedBox(width: 18,),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Color(0xffec5b82),
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Register/Login',textAlign: TextAlign.center,style: GoogleFonts.viga(color: Colors.white,fontSize:12),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: 31,
                      width: 350,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(' Recommended Oncologists',textAlign: TextAlign.center,style: GoogleFonts.rowdies(color: Colors.black,fontSize:18),),
                        ],
                      ),
                    ),


                    Container(
                      height: 150,
                      width: 380,
                      color: Color(0xfff4eef6),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/file_2023-11-24_04.28.28.png'), // Replace with your image asset path
                                  fit: BoxFit.fitWidth, // You can adjust the fit based on your requirements
                                ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              width: 290,
                              height: 150,
                              // child: Column(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: <Widget>[
                              //     SizedBox(height: 5,),
                              //     Container(
                              //       height: 20,
                              //       width: 240,
                              //       color: Colors.transparent,
                              //       child: Text('Ministry of Law & Justice :',textAlign: TextAlign.start,style: GoogleFonts.alexandria(color: Colors.white,fontSize:17),),
                              //     ),
                              //
                              //     SizedBox(height: 9,),
                              //
                              //     Container(
                              //       height: 100,
                              //       width: 240,
                              //       color: Colors.transparent,
                              //       child: Text('Nyaya Vikas - Monitoring of Centrally Sponsored Scheme for Development of Infrastructure for Judiciary',textAlign: TextAlign.start,style: GoogleFonts.encodeSans(color: Colors.white,fontSize:15),),
                              //     ),
                              //
                              //
                              //   ],
                              // ),
                            ),

                          ),




                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/file_2023-11-24_04.31.17.png'), // Replace with your image asset path
                                  fit: BoxFit.fitWidth, // You can adjust the fit based on your requirements
                                ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              width: 290,
                              height: 150,
                              // child: Column(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: <Widget>[
                              //     SizedBox(height: 5,),
                              //     Container(
                              //       height: 20,
                              //       width: 240,
                              //       color: Colors.transparent,
                              //       child: Text('Government of India :',textAlign: TextAlign.start,style: GoogleFonts.alexandria(color: Colors.white,fontSize:17),),
                              //     ),
                              //
                              //     SizedBox(height: 9,),
                              //
                              //     Container(
                              //       height: 100,
                              //       width: 240,
                              //       color: Colors.transparent,
                              //       child: Text('NALSA - National Legal Services Authority of India (NALSA)',textAlign: TextAlign.start,style: GoogleFonts.encodeSans(color: Colors.white,fontSize:15),),
                              //     ),
                              //
                              //
                              //   ],
                              // ),
                            ),

                          ),





                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/file_2023-11-24_04.31.48.png'), // Replace with your image asset path
                                  fit: BoxFit.fitWidth, // You can adjust the fit based on your requirements
                                ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              width: 290,
                              height: 150,
                              // child: Column(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: <Widget>[
                              //     SizedBox(height: 5,),
                              //     Container(
                              //       height: 20,
                              //       width: 240,
                              //       color: Colors.transparent,
                              //       child: Text('Department of Justice :',textAlign: TextAlign.start,style: GoogleFonts.alexandria(color: Colors.white,fontSize:17),),
                              //     ),
                              //
                              //     SizedBox(height: 9,),
                              //
                              //     Container(
                              //       height: 100,
                              //       width: 240,
                              //       color: Colors.transparent,
                              //       child: Text('Nyaya Bandhu - (Pro Bono Legal Services) aims to create a pan India framework for dispensation of pro bono legal services.',textAlign: TextAlign.start,style: GoogleFonts.encodeSans(color: Colors.white,fontSize:15),),
                              //     ),
                              //
                              //
                              //   ],
                              // ),
                            ),

                          ),




                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //         image: AssetImage('images/banner5.jpg'), // Replace with your image asset path
                          //         fit: BoxFit.cover, // You can adjust the fit based on your requirements
                          //       ),
                          //       color: Colors.black,
                          //       borderRadius: BorderRadius.circular(6),
                          //     ),
                          //     width: 290,
                          //     height: 150,
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       crossAxisAlignment: CrossAxisAlignment.center,
                          //       children: <Widget>[
                          //         SizedBox(height: 5,),
                          //         Container(
                          //           height: 20,
                          //           width: 240,
                          //           color: Colors.transparent,
                          //           child: Text('Department of Justice :',textAlign: TextAlign.start,style: GoogleFonts.alexandria(color: Colors.white,fontSize:17),),
                          //         ),
                          //
                          //         SizedBox(height: 9,),
                          //
                          //         Container(
                          //           height: 100,
                          //           width: 240,
                          //           color: Colors.transparent,
                          //           child: Text('TeleLaw - Reaching the Unreached An e-interface platform that aims to empower people through pre-litigation',textAlign: TextAlign.start,style: GoogleFonts.encodeSans(color: Colors.white,fontSize:15),),
                          //         ),
                          //
                          //
                          //       ],
                          //     ),
                          //   ),
                          //
                          // ),




                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //         image: AssetImage('images/banner6.jpg'), // Replace with your image asset path
                          //         fit: BoxFit.cover, // You can adjust the fit based on your requirements
                          //       ),
                          //       color: Colors.black,
                          //       borderRadius: BorderRadius.circular(6),
                          //     ),
                          //     width: 290,
                          //     height: 150,
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       crossAxisAlignment: CrossAxisAlignment.center,
                          //       children: <Widget>[
                          //         SizedBox(height: 5,),
                          //         Container(
                          //           height: 20,
                          //           width: 240,
                          //           color: Colors.transparent,
                          //           child: Text('Department of Financial Services :',textAlign: TextAlign.start,style: GoogleFonts.alexandria(color: Colors.white,fontSize:17),),
                          //         ),
                          //
                          //         SizedBox(height: 9,),
                          //
                          //         Container(
                          //           height: 100,
                          //           width: 240,
                          //           color: Colors.transparent,
                          //           child: Text('Pradhan Mantri Jan Dhan Yojana - National Mission on Financial Inclusion in his Independence Day, to ensure financial inclusion of all the household',textAlign: TextAlign.start,style: GoogleFonts.encodeSans(color: Colors.white,fontSize:15),),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),




                    // Container(
                    //   height: 460,
                    //   width: double.infinity,
                    //   color: Colors.white,
                    //   child: Column(
                    //     children: <Widget>[
                    //       SizedBox(height: 10,),
                    //       Container(
                    //         height: 30,
                    //         width: double.infinity,
                    //         color: Colors.transparent,
                    //         child: Text('  Features & Categories',textAlign: TextAlign.start,style: GoogleFonts.rowdies(color: Colors.black,fontSize:18),),
                    //       ),
                    //
                    //
                    //
                    //       Container(
                    //         height: 400,
                    //         width: 345,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(8),
                    //         ),
                    //
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           children: <Widget>[
                    //             Container(
                    //               height: 100,
                    //               width: double.infinity,
                    //               decoration:  BoxDecoration(
                    //                 color: Colors.transparent,
                    //                 borderRadius: BorderRadius.circular(8),
                    //               ),
                    //
                    //               child: Row(
                    //                 children: <Widget>[
                    //                   Container(
                    //                     height: 100,
                    //                     width: 115,
                    //                     decoration: BoxDecoration(
                    //                       color: Color(0xffe6eff6),
                    //                       borderRadius: BorderRadius.only(
                    //                         topLeft: Radius.circular(8),
                    //                         bottomLeft: Radius.circular(8),
                    //                         // topRight: Radius.circular(8),
                    //                         // bottomRight: Radius.circular(8)
                    //                       ),
                    //                       border: Border.all(
                    //                         color: Colors.grey, // Border color
                    //                         width: 0.3,           // Border width
                    //                       ),
                    //                     ),
                    //                     child: Column(
                    //                       children: <Widget>[
                    //                         Container(
                    //                           height: 70,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Image.asset('icons/expert.png', fit: BoxFit.contain),
                    //                         ),
                    //                         SizedBox(height: 7,),
                    //                         Container(
                    //                           height: 20,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Text(
                    //                             ' Pro Bono Lawyers',
                    //                             textAlign: TextAlign.center,
                    //                             style: GoogleFonts.viga(color: Colors.black, fontSize: 13),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //
                    //
                    //
                    //                   Container(
                    //                     height: 100,
                    //                     width: 115,
                    //                     decoration: BoxDecoration(
                    //                       color: Color(0xffe6eff6),
                    //                       borderRadius: BorderRadius.only(
                    //                         // topLeft: Radius.circular(8),
                    //                         // bottomLeft: Radius.circular(8),
                    //                         // topRight: Radius.circular(8),
                    //                         // bottomRight: Radius.circular(8)
                    //                       ),
                    //                       border: Border.all(
                    //                         color: Colors.grey, // Border color
                    //                         width: 0.3,           // Border width
                    //                       ),
                    //                     ),
                    //                     child: Column(
                    //                       children: <Widget>[
                    //                         Container(
                    //                           height: 70,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Image.asset('icons/completed-task.png', fit: BoxFit.contain),
                    //                         ),
                    //                         SizedBox(height: 7,),
                    //                         Container(
                    //                           height: 20,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Text(
                    //                             ' Task',
                    //                             textAlign: TextAlign.center,
                    //                             style: GoogleFonts.viga(color: Colors.black, fontSize: 13),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //
                    //
                    //
                    //
                    //
                    //
                    //                   Container(
                    //                     height: 100,
                    //                     width: 115,
                    //                     decoration: BoxDecoration(
                    //                       color: Color(0xffe6eff6),
                    //                       borderRadius: BorderRadius.only(
                    //                         // topLeft: Radius.circular(8),
                    //                         // bottomLeft: Radius.circular(8),
                    //                           topRight: Radius.circular(8),
                    //                           bottomRight: Radius.circular(8)
                    //                       ),
                    //                       border: Border.all(
                    //                         color: Colors.grey, // Border color
                    //                         width: 0.3,           // Border width
                    //                       ),
                    //                     ),
                    //                     child: Column(
                    //                       children: <Widget>[
                    //                         Container(
                    //                           height: 70,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Image.asset('icons/checked.png', fit: BoxFit.contain),
                    //                         ),
                    //                         SizedBox(height: 7,),
                    //                         Container(
                    //                           height: 20,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Text(
                    //                             ' checked',
                    //                             textAlign: TextAlign.center,
                    //                             style: GoogleFonts.viga(color: Colors.black, fontSize: 13),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   )
                    //
                    //                 ],
                    //               ),
                    //
                    //             ),
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //             Container(
                    //               height: 100,
                    //               width: double.infinity,
                    //               decoration:  BoxDecoration(
                    //                 color: Colors.transparent,
                    //                 borderRadius: BorderRadius.circular(8),
                    //               ),
                    //
                    //               child: Row(
                    //                 children: <Widget>[
                    //                   Container(
                    //                     height: 100,
                    //                     width: 115,
                    //                     decoration: BoxDecoration(
                    //                       color: Color(0xffe6eff6),
                    //                       borderRadius: BorderRadius.only(
                    //                         topLeft: Radius.circular(8),
                    //                         bottomLeft: Radius.circular(8),
                    //                         // topRight: Radius.circular(8),
                    //                         // bottomRight: Radius.circular(8)
                    //                       ),
                    //                       border: Border.all(
                    //                         color: Colors.grey, // Border color
                    //                         width: 0.3,           // Border width
                    //                       ),
                    //                     ),
                    //                     child: Column(
                    //                       children: <Widget>[
                    //                         Container(
                    //                           height: 70,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Image.asset('icons/growth.png', fit: BoxFit.contain),
                    //                         ),
                    //                         SizedBox(height: 7,),
                    //                         Container(
                    //                           height: 20,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Text(
                    //                             ' Growth',
                    //                             textAlign: TextAlign.center,
                    //                             style: GoogleFonts.viga(color: Colors.black, fontSize: 13),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //
                    //
                    //
                    //                   Container(
                    //                     height: 100,
                    //                     width: 115,
                    //                     decoration: BoxDecoration(
                    //                       color: Color(0xffe6eff6),
                    //                       borderRadius: BorderRadius.only(
                    //                         // topLeft: Radius.circular(8),
                    //                         // bottomLeft: Radius.circular(8),
                    //                         // topRight: Radius.circular(8),
                    //                         // bottomRight: Radius.circular(8)
                    //                       ),
                    //                       border: Border.all(
                    //                         color: Colors.grey, // Border color
                    //                         width: 0.3,           // Border width
                    //                       ),
                    //                     ),
                    //                     child: Column(
                    //                       children: <Widget>[
                    //                         Container(
                    //                           height: 70,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Image.asset('icons/news.png', fit: BoxFit.contain),
                    //                         ),
                    //                         SizedBox(height: 7,),
                    //                         Container(
                    //                           height: 20,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Text(
                    //                             ' News',
                    //                             textAlign: TextAlign.center,
                    //                             style: GoogleFonts.viga(color: Colors.black, fontSize: 13),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //
                    //
                    //
                    //
                    //
                    //
                    //                   Container(
                    //                     height: 100,
                    //                     width: 115,
                    //                     decoration: BoxDecoration(
                    //                       color: Color(0xffe6eff6),
                    //                       borderRadius: BorderRadius.only(
                    //                         // topLeft: Radius.circular(8),
                    //                         // bottomLeft: Radius.circular(8),
                    //                           topRight: Radius.circular(8),
                    //                           bottomRight: Radius.circular(8)
                    //                       ),
                    //                       border: Border.all(
                    //                         color: Colors.grey, // Border color
                    //                         width: 0.3,           // Border width
                    //                       ),
                    //                     ),
                    //                     child: Column(
                    //                       children: <Widget>[
                    //                         Container(
                    //                           height: 70,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Image.asset('icons/finger.png', fit: BoxFit.contain),
                    //                         ),
                    //                         SizedBox(height: 7,),
                    //                         Container(
                    //                           height: 20,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Text(
                    //                             ' Finger',
                    //                             textAlign: TextAlign.center,
                    //                             style: GoogleFonts.viga(color: Colors.black, fontSize: 13),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   )
                    //
                    //                 ],
                    //               ),
                    //
                    //             ),
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //             Container(
                    //               height: 100,
                    //               width: double.infinity,
                    //               decoration:  BoxDecoration(
                    //                 color: Colors.transparent,
                    //                 borderRadius: BorderRadius.circular(8),
                    //               ),
                    //
                    //               child: Row(
                    //                 children: <Widget>[
                    //                   Container(
                    //                     height: 100,
                    //                     width: 115,
                    //                     decoration: BoxDecoration(
                    //                       color: Color(0xffe6eff6),
                    //                       borderRadius: BorderRadius.only(
                    //                         topLeft: Radius.circular(8),
                    //                         bottomLeft: Radius.circular(8),
                    //                         // topRight: Radius.circular(8),
                    //                         // bottomRight: Radius.circular(8)
                    //                       ),
                    //                       border: Border.all(
                    //                         color: Colors.grey, // Border color
                    //                         width: 0.3,           // Border width
                    //                       ),
                    //                     ),
                    //                     child: Column(
                    //                       children: <Widget>[
                    //                         Container(
                    //                           height: 70,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Image.asset('icons/timeline.png', fit: BoxFit.contain),
                    //                         ),
                    //                         SizedBox(height: 7,),
                    //                         Container(
                    //                           height: 20,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Text(
                    //                             ' Timeline',
                    //                             textAlign: TextAlign.center,
                    //                             style: GoogleFonts.viga(color: Colors.black, fontSize: 13),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //
                    //
                    //
                    //                   Container(
                    //                     height: 100,
                    //                     width: 115,
                    //                     decoration: BoxDecoration(
                    //                       color: Color(0xffe6eff6),
                    //                       borderRadius: BorderRadius.only(
                    //                         // topLeft: Radius.circular(8),
                    //                         // bottomLeft: Radius.circular(8),
                    //                         // topRight: Radius.circular(8),
                    //                         // bottomRight: Radius.circular(8)
                    //                       ),
                    //                       border: Border.all(
                    //                         color: Colors.grey, // Border color
                    //                         width: 0.3,           // Border width
                    //                       ),
                    //                     ),
                    //                     child: Column(
                    //                       children: <Widget>[
                    //                         Container(
                    //                           height: 70,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Image.asset('icons/puzzle.png', fit: BoxFit.contain),
                    //                         ),
                    //                         SizedBox(height: 7,),
                    //                         Container(
                    //                           height: 20,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Text(
                    //                             ' Puzzle',
                    //                             textAlign: TextAlign.center,
                    //                             style: GoogleFonts.viga(color: Colors.black, fontSize: 13),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //
                    //
                    //
                    //
                    //
                    //
                    //                   Container(
                    //                     height: 100,
                    //                     width: 115,
                    //                     decoration: BoxDecoration(
                    //                       color: Color(0xffe6eff6),
                    //                       borderRadius: BorderRadius.only(
                    //                         // topLeft: Radius.circular(8),
                    //                         // bottomLeft: Radius.circular(8),
                    //                           topRight: Radius.circular(8),
                    //                           bottomRight: Radius.circular(8)
                    //                       ),
                    //                       border: Border.all(
                    //                         color: Colors.grey, // Border color
                    //                         width: 0.3,           // Border width
                    //                       ),
                    //                     ),
                    //                     child: Column(
                    //                       children: <Widget>[
                    //                         Container(
                    //                           height: 70,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Image.asset('icons/in-progress.png', fit: BoxFit.contain),
                    //                         ),
                    //                         SizedBox(height: 7,),
                    //                         Container(
                    //                           height: 20,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Text(
                    //                             ' In-progress',
                    //                             textAlign: TextAlign.center,
                    //                             style: GoogleFonts.viga(color: Colors.black, fontSize: 13),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   )
                    //
                    //                 ],
                    //               ),
                    //
                    //             ),
                    //
                    //
                    //
                    //
                    //
                    //
                    //             Container(
                    //               height: 100,
                    //               width: double.infinity,
                    //               decoration:  BoxDecoration(
                    //                 color: Colors.transparent,
                    //                 borderRadius: BorderRadius.circular(8),
                    //               ),
                    //
                    //               child: Row(
                    //                 children: <Widget>[
                    //                   Container(
                    //                     height: 100,
                    //                     width: 115,
                    //                     decoration: BoxDecoration(
                    //                       color: Color(0xffe6eff6),
                    //                       borderRadius: BorderRadius.only(
                    //                         topLeft: Radius.circular(8),
                    //                         bottomLeft: Radius.circular(8),
                    //                         // topRight: Radius.circular(8),
                    //                         // bottomRight: Radius.circular(8)
                    //                       ),
                    //                       border: Border.all(
                    //                         color: Colors.grey, // Border color
                    //                         width: 0.3,           // Border width
                    //                       ),
                    //                     ),
                    //                     child: Column(
                    //                       children: <Widget>[
                    //                         Container(
                    //                           height: 70,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Image.asset('icons/completed-task (1).png', fit: BoxFit.contain),
                    //                         ),
                    //                         SizedBox(height: 7,),
                    //                         Container(
                    //                           height: 20,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Text(
                    //                             ' Completed-task',
                    //                             textAlign: TextAlign.center,
                    //                             style: GoogleFonts.viga(color: Colors.black, fontSize: 13),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //
                    //
                    //
                    //                   Container(
                    //                     height: 100,
                    //                     width: 115,
                    //                     decoration: BoxDecoration(
                    //                       color: Color(0xffe6eff6),
                    //                       borderRadius: BorderRadius.only(
                    //                         // topLeft: Radius.circular(8),
                    //                         // bottomLeft: Radius.circular(8),
                    //                         // topRight: Radius.circular(8),
                    //                         // bottomRight: Radius.circular(8)
                    //                       ),
                    //                       border: Border.all(
                    //                         color: Colors.grey, // Border color
                    //                         width: 0.3,           // Border width
                    //                       ),
                    //                     ),
                    //                     child: Column(
                    //                       children: <Widget>[
                    //                         Container(
                    //                           height: 70,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Image.asset('icons/success.png', fit: BoxFit.contain),
                    //                         ),
                    //                         SizedBox(height: 7,),
                    //                         Container(
                    //                           height: 20,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Text(
                    //                             ' Success',
                    //                             textAlign: TextAlign.center,
                    //                             style: GoogleFonts.viga(color: Colors.black, fontSize: 13),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //
                    //
                    //
                    //
                    //
                    //
                    //                   Container(
                    //                     height: 100,
                    //                     width: 115,
                    //                     decoration: BoxDecoration(
                    //                       color: Color(0xffe6eff6),
                    //                       borderRadius: BorderRadius.only(
                    //                         // topLeft: Radius.circular(8),
                    //                         // bottomLeft: Radius.circular(8),
                    //                           topRight: Radius.circular(8),
                    //                           bottomRight: Radius.circular(8)
                    //                       ),
                    //                       border: Border.all(
                    //                         color: Colors.grey, // Border color
                    //                         width: 0.3,           // Border width
                    //                       ),
                    //                     ),
                    //                     child: Column(
                    //                       children: <Widget>[
                    //                         Container(
                    //                           height: 70,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Image.asset('icons/growth (1).png', fit: BoxFit.contain),
                    //                         ),
                    //                         SizedBox(height: 7,),
                    //                         Container(
                    //                           height: 20,
                    //                           width: 113,
                    //                           color: Colors.transparent,
                    //                           child: Text(
                    //                             ' Growth',
                    //                             textAlign: TextAlign.center,
                    //                             style: GoogleFonts.viga(color: Colors.black, fontSize: 13),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   )
                    //
                    //                 ],
                    //               ),
                    //
                    //             ),
                    //           ],
                    //         ),
                    //
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    // Container(
                    //   height: 180,
                    //   width: 330,
                    //   decoration: BoxDecoration(
                    //     color: Color(0xfff2f3f3),
                    //     borderRadius: BorderRadius.circular(10)
                    //   ),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: <Widget>[
                    //       // Container(
                    //       //   height: 30,
                    //       //   width: 320,
                    //       //   decoration: BoxDecoration(
                    //       //       color: Colors.transparent,
                    //       //     borderRadius: BorderRadius.circular(10)
                    //       //   ),
                    //       //   // child: Column(
                    //       //   //   mainAxisAlignment: MainAxisAlignment.center,
                    //       //   //   children: [
                    //       //   //     Text('  Share ADHIKAAR app',textAlign: TextAlign.center,style: GoogleFonts.viga(color: Colors.black,fontSize:15),),
                    //       //   //   ],
                    //       //   // ),
                    //       // ),
                    //
                    //       Container(
                    //         height: 180,
                    //         width: 320,
                    //         decoration: BoxDecoration(
                    //             color: Colors.black,
                    //             borderRadius: BorderRadius.circular(10)
                    //         ),
                    //         child: Image.asset('images/file_2023-11-24_04.38.00.png',fit: BoxFit.cover,),
                    //       ),
                    //
                    //
                    //       // Container(
                    //       //   height: 20,
                    //       //   width: 320,
                    //       //   decoration: BoxDecoration(
                    //       //       color: Colors.transparent,
                    //       //       borderRadius: BorderRadius.circular(10)
                    //       //   ),
                    //       //   child: Column(
                    //       //     mainAxisAlignment: MainAxisAlignment.center,
                    //       //     children: [
                    //       //       Text('Tell your friends about the Adhikaar app',textAlign: TextAlign.center,style: GoogleFonts.viga(color: Colors.black,fontSize:15),),
                    //       //     ],
                    //       //   ),
                    //       // ),
                    //
                    //
                    //       // Container(
                    //       //   height: 30,
                    //       //   width: 320,
                    //       //   decoration: BoxDecoration(
                    //       //       color: Colors.transparent,
                    //       //       borderRadius: BorderRadius.circular(10)
                    //       //   ),
                    //       //   child: Column(
                    //       //     mainAxisAlignment: MainAxisAlignment.center,
                    //       //     children: [
                    //       //       Container(
                    //       //         height: 20,
                    //       //         width: 120,
                    //       //         decoration: BoxDecoration(
                    //       //             color: Color(0xfffdb827),
                    //       //           borderRadius: BorderRadius.circular(7)
                    //       //         ),
                    //       //         child: Column(
                    //       //           mainAxisAlignment: MainAxisAlignment.center,
                    //       //           children: [
                    //       //             Text('SHARE NOW',textAlign: TextAlign.center,style: GoogleFonts.viga(color: Colors.black,fontSize:15),),
                    //       //           ],
                    //       //         ),
                    //       //       ),
                    //       //     ],
                    //       //   ),
                    //       // ),
                    //
                    //
                    //
                    //
                    //
                    //     ],
                    //   ),
                    // ),






                    // Container(
                    //   height: 270,
                    //   width: double.infinity,
                    //   color: Colors.transparent,
                    //   child: Row(
                    //     children: <Widget>[
                    //       SizedBox(width: 5,),
                    //       Container(
                    //         height: 240,
                    //         width: 170,
                    //         decoration: BoxDecoration(
                    //             color: Color(0xffdeecff),
                    //           borderRadius: BorderRadius.circular(10)
                    //         ),
                    //
                    //         child: Column(
                    //           children: <Widget>[
                    //             Container(
                    //               height: 140,
                    //               width: 190,
                    //               decoration: BoxDecoration(
                    //                   color: Color(0xffdeecff),
                    //                 borderRadius: BorderRadius.circular(10)
                    //               ),
                    //               child: Image.asset('icons/help-desk.png'),
                    //             ),
                    //
                    //             Container(
                    //               height: 100,
                    //               width: 190,
                    //               decoration: BoxDecoration(
                    //                   color: Color(0xfff8fcff),
                    //                   borderRadius: BorderRadius.circular(10)
                    //               ),
                    //               child: Column(
                    //                 children: <Widget>[
                    //                   Container(
                    //                     height: 50,
                    //                     width: 150,
                    //                     color: Colors.transparent,
                    //                     child: Text('1431',textAlign: TextAlign.center,style: GoogleFonts.delaGothicOne(color: Colors.blue,fontSize:40),),
                    //                   ),
                    //
                    //                   Container(
                    //                     height: 40,
                    //                     width: 150,
                    //                     color: Colors.transparent,
                    //                     child: Text('Services',textAlign: TextAlign.center,style: GoogleFonts.viga(color: Colors.blue,fontSize:25),),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //
                    //
                    //       ),
                    //
                    //       SizedBox(width: 10,),
                    //
                    //
                    //
                    //       Container(
                    //         height: 240,
                    //         width: 170,
                    //         decoration: BoxDecoration(
                    //             color: Color(0xffdeecff),
                    //             borderRadius: BorderRadius.circular(10)
                    //         ),
                    //
                    //         child: Column(
                    //           children: <Widget>[
                    //             Container(
                    //               height: 140,
                    //               width: 190,
                    //               decoration: BoxDecoration(
                    //                   color: Color(0xffdeecff),
                    //                   borderRadius: BorderRadius.circular(10)
                    //               ),
                    //               child: Image.asset('icons/department.png'),
                    //             ),
                    //
                    //             Container(
                    //               height: 100,
                    //               width: 190,
                    //               decoration: BoxDecoration(
                    //                   color: Color(0xfff8fcff),
                    //                   borderRadius: BorderRadius.circular(10)
                    //               ),
                    //               child: Column(
                    //                 children: <Widget>[
                    //                   Container(
                    //                     height: 50,
                    //                     width: 150,
                    //                     color: Colors.transparent,
                    //                     child: Text('313',textAlign: TextAlign.center,style: GoogleFonts.delaGothicOne(color: Colors.blue,fontSize:40),),
                    //                   ),
                    //
                    //                   Container(
                    //                     height: 40,
                    //                     width: 150,
                    //                     color: Colors.transparent,
                    //                     child: Text('Departments',textAlign: TextAlign.center,style: GoogleFonts.viga(color: Colors.blue,fontSize:25),),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //
                    //
                    //       ),
                    //     ],
                    //   ),
                    // ),



                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
