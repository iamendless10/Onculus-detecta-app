import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lri_rbb/beforetest.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';
import 'websocket.dart';
import 'backendapi.dart';

class VideoStream extends StatefulWidget {
  const VideoStream({Key? key}) : super(key: key);

  @override
  State<VideoStream> createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  final WebSocket _socket = WebSocket("ws://" + vidStreamUrl);
  bool _isConnected = false;
  Uint8List? _capturedFrame;
  final StreamController<dynamic> _dataStreamController =
  StreamController<dynamic>.broadcast();

  String detectedClass = "";
  String detectedLesion = "";
  double confidence = 0.0;
  String result = "";

  void connect(BuildContext context) async {
    _socket.connect();
    _socket.stream.listen((data) {
      _dataStreamController.add(data);
    });

    setState(() {
      _isConnected = true;
    });
  }

  void disconnect() {
    _socket.disconnect();
    setState(() {
      _isConnected = false;
    });
  }

  Future<void> performDetect() async {
    if (_capturedFrame == null) {
      print("No captured frame to detect.");
      return;
    }

    String base64Image = base64Encode(_capturedFrame!);

    final String apiUrl = cancerApiUrl+'/dermatology';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: base64Image,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        setState(() {
          detectedClass = jsonResponse['class'];
          detectedLesion = jsonResponse['lesion'];
          confidence = jsonResponse['confidence'];
          result = jsonResponse['codename'];
        });


        print("Detected Class: $detectedClass");
        print("Detected Lesion: $detectedLesion");
        print("Confidence: $confidence");
        print("Result: $result");

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => beforetest(plant: result)),
        );
      } else {
        print("Error: ${response.statusCode}");
        print("API Response: ${response.body}");
      }
    } catch (e) {
      print("Error sending request: $e");
    }
  }

  void captureFrame() {
    if (_dataStreamController.hasListener) {
      _dataStreamController.stream.first.then((data) {
        setState(() {
          _capturedFrame = Uint8List.fromList(
            base64Decode(
              data.toString(),
            ),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isScanQRSelected=false;
    return Scaffold(
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
                color: isScanQRSelected ? Colors.blue : null, // Change color based on selection
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
        title: const Text("OnCulo Scope"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => connect(context),
                      child: const Text("Connect"),
                    ),
                    ElevatedButton(
                      onPressed: disconnect,
                      child: const Text("Disconnect"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                _isConnected
                    ? StreamBuilder(
                  stream: _dataStreamController.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return const Center(
                        child: Text("Connection Closed !"),
                      );
                    }

                    return Image.memory(
                      Uint8List.fromList(
                        base64Decode(
                          snapshot.data.toString(),
                        ),
                      ),
                      gaplessPlayback: true,
                      excludeFromSemantics: true,
                    );
                  },
                )
                    : const Text("Initiate Connection"),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    captureFrame();
                  },
                  child: const Text("Take Photo"),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                _capturedFrame != null
                    ? Image.memory(
                  _capturedFrame!,
                  gaplessPlayback: true,
                  excludeFromSemantics: true,
                )
                    : const Text("No Captured Frame"),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  child: ElevatedButton(
                    onPressed: performDetect,
                    child: const Text("Detect"),
                  ),
                ),
                // Display detection results in the UI
                Column(
                  children: [
                    Text("Detected Class: $detectedClass"),
                    Text("Detected Lesion: $detectedLesion"),
                    Text("Confidence: $confidence"),
                    Text("Result: $result"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }
}
