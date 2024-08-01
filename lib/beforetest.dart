  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:lri_rbb/plantdetails.dart';
  import 'package:lottie/lottie.dart';
  import 'package:google_fonts/google_fonts.dart';
  import 'package:http/http.dart' as http;
  import 'backendapi.dart';
  import 'dart:convert';

  class beforetest extends StatefulWidget {
    final String plant;
    const beforetest({Key? key, required this.plant}) : super(key: key);

    @override
    State<beforetest> createState() => _beforetestState();
  }

  class _beforetestState extends State<beforetest> {
    Map<String, dynamic> resp = {};
    @override
    void initState(){
      super.initState();
      // getPlantInfo();
      // Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => PlantDetails(resp: resp,)),
      //       );
      getPlantInfo().then((result) {
          Future.delayed(Duration(seconds: 3), ()
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlantDetails(resp: resp)),
          );
        });
      });
          }

    // Future getPlantInfo() async{
    //   String apiResponse = '';
    //   http.Response response;
    //   response= await http.post(Uri.parse("http://127.0.0.1:5000/lesion"),
    //     headers:  {'Content-Type': 'application/json'},
    //     body: json.encode({'codename' :'bcc'}),);
    //   if(response.statusCode == 200)
    //   {
    //     setState(() {
    //       apiResponse = response.body;
    //       resp = json.decode(apiResponse);
    //     });
    //   }
    // }

    Future<void> getPlantInfo() async {
      try {
        String apiResponse = '';
        http.Response response;

        print('Making request...');

        response = await http.put(
          Uri.parse(cancerApiUrl + "/lesion"),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'codename': widget.plant}),
        );

        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {
          setState(() {
            apiResponse = response.body;
            resp = json.decode(apiResponse);
          });
        } else {
          // Handle the error according to your application's logic
          print('Error: ${response.statusCode}');
        }
      } catch (e) {
        // Handle the error according to your application's logic
        print('Error: $e');
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/leaf_image11.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 260,
                width: double.infinity,
                color: Colors.transparent,
              ),
              Center(
                child: Container(
                  color: Colors.transparent,
                  height: 180,
                  width: 200,
                  child: Lottie.asset('lottie/ribbon.json',),
                ),
              ),
              SizedBox(height: 22,),
               Container(
                height: 66,
                width: double.infinity,
                color: Colors.transparent,
                 child: Column(
                   children: [
                     // Text('    உங்கள் தாவரத் தகவலை நாங்கள்உங்கள்',textAlign: TextAlign.left,style: GoogleFonts.notoSansTamil(color: Color(0xFF2B2B2B),fontSize: 15,),),
                     // Text('    தாவரத் தகவலை நாங்கள்',textAlign: TextAlign.left,style: GoogleFonts.notoSansTamil(color: Color(0xFF2B2B2B),fontSize: 15,),),
                     // Text('    சேகரிக்கும் வரை காத்திருங்கள்',textAlign: TextAlign.left,style: GoogleFonts.notoSansTamil(color: Color(0xFF2B2B2B),fontSize: 15,),),
                     Text('    Hold on while we gather your',textAlign: TextAlign.left,style: GoogleFonts.dosis(color: Color(0xFF2B2B2B),fontSize: 23,),),
                     Text('    information...',textAlign: TextAlign.left,style: GoogleFonts.dosis(color: Color(0xFF2B2B2B),fontSize: 23,),),
                   ],
                 ),
              ),
            ],
          ),
        ),
      );
    }
  }

