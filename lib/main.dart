import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();

  List? _result;
  String? _confidence = "";
  String? _name = "";
  String? numbers = "";

  pickImageFromCamera() async {
    _pickedFile = await _picker.getImage(
      source: ImageSource.camera,
    );

    if (_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile!.path);
      });
    }
  }

  pickImageFromGalleryOrGDrive() async {
    _pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
    );

    if (_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile!.path);
      });
    }
  }

  loadMyModel() async {
    var resultant = await Tflite.loadModel(
        labels: "assets/labels.txt", model: "assets/bird_classifier.tflite");
    print("Result after loading the model: $resultant");
  }

  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 400,
        threshold: 0.3,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _result = res;
      String? str = _result?[0]["label"];
      _name = str?.substring(str.length - (str.length - 3));
      _confidence = _result != null
          ? (_result?[0]["confidence"] * 100.0).toString().substring(0, 2) + "%"
          : "";
      print("Name: $_name\nConfidence: $_confidence");
    });
  }

  @override
  void initState() {
    super.initState();
    loadMyModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "Bird Classifier",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),
            _pickedFile != null
                ? Center(
                    child: Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(File(_pickedFile!.path)),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    height: 350,
                    width: 350,
                    color: Colors.grey[600],
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 50, 0),
                        child: Text(
                          "Select an image",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Name: ",
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                Text(
                  "$_name",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Accuracy: ",
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                Text(
                  "$_confidence",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                applyModelOnImage(File(_pickedFile!.path));
              },
              child: Text(
                "Predict",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(225, 45),
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.blue[400],
        spacing: 5,
        spaceBetweenChildren: 5,
        closeManually: false,
        children: [
          SpeedDialChild(
            child: Icon(Icons.camera),
            onTap: () => pickImageFromCamera(),
          ),
          SpeedDialChild(
            child: Icon(Icons.photo_album),
            onTap: () => pickImageFromGalleryOrGDrive(),
          ),
        ],
      ),
    );
  }
}
