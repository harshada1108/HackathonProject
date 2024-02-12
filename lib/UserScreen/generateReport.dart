import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackathonproject/UserScreen/GeneratedReport.dart';
import 'package:image_picker/image_picker.dart';
import '../globals/Globals.dart';
import 'GenerateReportScreen.dart';
import 'Globals.dart';
import 'GenerateReportScreen.dart';
class generateReport extends StatefulWidget {
  const generateReport({Key? key}) : super(key: key);

  @override
  State<generateReport> createState() => _generateReport();
}

class _generateReport extends State<generateReport> {
  Uint8List? _image;
  File? selectedIMage;
  late List<Uint8List?> _images;
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventDateController = TextEditingController();
  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController venueController = TextEditingController();
  final TextEditingController attendeesController = TextEditingController();

  void initState() {
    super.initState();
    // Initialize _images list with null values
    _images = List<Uint8List?>.generate(3, (_) => null);
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        width: width * 0.7,
        backgroundColor: Colors.black,
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(30),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/EventEase (1).png'),
                radius: 70,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Vaidehi Kharde',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),


          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Center(
            child: Text(
              'Generate an Event Report',
              style: TextStyle(fontSize: 15, color: Color(0xff009697)),
            )),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            color: Colors.white,
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.002),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.02),
                        child: TextField(
                          controller: eventNameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Event Name',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.02),
                        child: TextField(
                          controller: eventDateController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Event Date',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.02),
                        child: TextField(
                          controller: totalAmountController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Total Amount Granted',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.02),
                        child: TextField(
                          controller: venueController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Venue',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.02),
                        child: TextField(
                          controller: attendeesController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Number of Attendees',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Add images", style: TextStyle(color: Colors.white),),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white),
                                    image: _image != null
                                        ? DecorationImage(
                                      image: MemoryImage(_image!),
                                      fit: BoxFit.cover,
                                    )
                                        : const DecorationImage(
                                      image: AssetImage(
                                          'images/EventEase (1).png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -10,
                                  left: 140,
                                  child: IconButton(
                                    onPressed: () {
                                      showImagePickerOption(context);
                                    },
                                    icon: const Icon(Icons.add_a_photo),
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.only(top: height * 0.02),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(
                                    0xff009697)), // Set your desired background color here
                          ),
                          onPressed: () {
                            // Add entered values to the global list
                            String base64Image = base64.encode(_image!);

                            eventReportData.addAll([
                              eventNameController.text,
                              eventDateController.text,
                              totalAmountController.text,
                              venueController.text,
                              attendeesController.text,

                            ]);

                            // Navigate to the next screen and pass the global list and selected image
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                   GenerateReportScreen(eventReportData: eventReportData, image: _image!)
                              ),
                            );
                          },
                          // onPressed: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(builder: (context) =>
                          //           GenerateReportScreen(
                          //               eventName: eventNameController.text,
                          //               eventDate: eventDateController.text,
                          //               totalAmount: totalAmountController.text,
                          //               venue: venueController.text,
                          //               attendees: attendeesController.text)));
                          // },
                          child: const Text('Generate Budget Report',
                            style: TextStyle(
                                fontSize: 20, color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }


//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

}
