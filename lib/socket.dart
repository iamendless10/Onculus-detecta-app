// import 'dart:async';
// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'websocket.dart';
//
// class VideoStream extends StatefulWidget {
//   const VideoStream({Key? key}) : super(key: key);
//
//   @override
//   State<VideoStream> createState() => _VideoStreamState();
// }
//
// class _VideoStreamState extends State<VideoStream> {
//   final WebSocket _socket = WebSocket("ws://192.168.208.56:5000");
//   bool _isConnected = false;
//   Uint8List? _capturedFrame; // Variable to store the captured frame
//   final StreamController<dynamic> _dataStreamController =
//   StreamController<dynamic>.broadcast();
//
//   void connect(BuildContext context) async {
//     _socket.connect();
//     _socket.stream.listen((data) {
//       _dataStreamController.add(data);
//     });
//
//     setState(() {
//       _isConnected = true;
//     });
//   }
//
//   void disconnect() {
//     _socket.disconnect();
//     setState(() {
//       _isConnected = false;
//     });
//   }
//
//   void performDetect() {
//     // Add functionality for the "Detect" button here
//     // For example, you can send a request to a server for object detection.
//     print("Object detection logic goes here.");
//   }
//
//   void captureFrame() {
//     // Capture the current frame
//     if (_dataStreamController.hasListener) {
//       _dataStreamController.stream.first.then((data) {
//         setState(() {
//           _capturedFrame = Uint8List.fromList(
//             base64Decode(
//               data.toString(),
//             ),
//           );
//         });
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Color(0xfff4eef6),
//         color: Color(0xffcaabd3),
//         items: [
//           Icon(Icons.home_rounded),
//           GestureDetector(
//             child: Icon(Icons.qr_code_scanner_rounded),
//             onTap: (){
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => VideoStream()),
//               );
//             },
//           ),
//           Icon(Icons.person_outline_rounded),
//         ],
//       ),
//       appBar: AppBar(
//         title: const Text("OnCulo Scope"),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(1.0),
//           child: Center(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () => connect(context),
//                       child: const Text("Connect"),
//                     ),
//                     ElevatedButton(
//                       onPressed: disconnect,
//                       child: const Text("Disconnect"),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 50.0,
//                 ),
//                 _isConnected
//                     ? StreamBuilder(
//                   stream: _dataStreamController.stream,
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return const CircularProgressIndicator();
//                     }
//
//                     if (snapshot.connectionState == ConnectionState.done) {
//                       return const Center(
//                         child: Text("Connection Closed !"),
//                       );
//                     }
//
//                     return Image.memory(
//                       Uint8List.fromList(
//                         base64Decode(
//                           snapshot.data.toString(),
//                         ),
//                       ),
//                       gaplessPlayback: true,
//                       excludeFromSemantics: true,
//                     );
//                   },
//                 )
//                     : const Text("Initiate Connection"),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Add functionality for the "Take Photo" button here
//                     captureFrame();
//                   },
//                   child: const Text("Take Photo"),
//                 ),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 _capturedFrame != null
//                     ? Image.memory(
//                   _capturedFrame!,
//                   gaplessPlayback: true,
//                   excludeFromSemantics: true,
//                 )
//                     : const Text("No Captured Frame"),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 GestureDetector(
//                   child: ElevatedButton(
//                     onPressed: performDetect,
//                     child: const Text("Detect"),
//                     // onTap: (){
//                     //   Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(builder: (context) => ),
//                     //   );
//                     // },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _dataStreamController.close();
//     super.dispose();
//   }
// }