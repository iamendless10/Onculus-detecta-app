import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarScreen extends StatelessWidget {
  const SearchBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        leading: GestureDetector(
          child: Image.asset('icons/namelogo.png'),
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
                height: 20,
                width: 33,
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
                'icons/user2.png',
                height: 20,
                width: 27,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
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

              SizedBox(height: 30,),

              Container(
                height: 180,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.red,
                  borderRadius: BorderRadius.circular(7)
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 170,
                      width: 150,
                      color: Colors.transparent,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 140,
                            width: 150,
                            color: Colors.transparent,
                            child: Image.asset('images/person1.png'),
                          ),

                          Container(
                            height: 30,
                            width: 150,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Narasiman R H',textAlign: TextAlign.center,style: GoogleFonts.viga(color: Colors.black,fontSize:20),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5,),

                    Container(
                      height: 170,
                      width: 190,
                      color: Colors.green,
                      child: Column(
                        children: <Widget>[
                          Container(),
                        ],
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
