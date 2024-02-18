import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:country_picker/country_picker.dart';

class EarningViewPage extends StatefulWidget {
  @override
  _EarningViewPageState createState() => _EarningViewPageState();
}

class _EarningViewPageState extends State<EarningViewPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  late ImagePicker _picker;
  XFile? _image;

  // Declare a camera controller variable
  late CameraController _cameraController;
  String selectedRadio = ''; // Default value
  String selectedRadio2='';
  String selectedRadio3='';
  String selectedCountry = ''; // Track selected country

  // Initialize the camera controller in the initState method
  @override
  void initState() {
    super.initState();
    _picker = ImagePicker(); // Initialize the image picker
    _initializeCamera();
  }

  // Initialize the camera controller
  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(
      frontCamera, // Use the front camera
      ResolutionPreset.high, // Set the resolution preset
    );
    await _cameraController.initialize(); // Initialize the camera controller
  }

  // Open the front camera when the container is tapped
  void _openFrontCamera() async {
    await _initializeCamera();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CameraScreen(cameraController: _cameraController)),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is removed from the tree
    nameController.dispose();
    mobileController.dispose();
    countryController.dispose();
    addressController.dispose();
    emailController.dispose();
    idController.dispose();
    _cameraController.dispose();

    super.dispose();
  }

  Future<void> _getImage() async {
    if (_picker == null) {
      // Wait for _picker to be initialized
      await Future.delayed(Duration(milliseconds: 100));
      // Check again if _picker is still null
      if (_picker == null) {
        // Handle the situation where _picker is still null
        return;
      }
    }

    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Apply To Be An Official Talent",
          style: TextStyle(fontSize: 16), // Reduce the text size of the app bar title
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoundedTextField(controller: nameController, hintText: 'Email Your Real Name'),
              SizedBox(height: 20),
              RoundedTextField(controller: mobileController, hintText: 'Enter Your Mobile Number'),
              SizedBox(height: 20),
              _buildCountryPickerDropdown(context),

                         SizedBox(height: 20),
              RoundedTextField(controller: addressController, hintText: 'Enter Your Address (Optional)'),
              SizedBox(height: 20),
              RoundedTextField(controller: emailController, hintText: 'Enter Your Email Address'),
              SizedBox(height: 20),
              RoundedTextField(controller: idController, hintText: 'Enter Your National ID Number'),
              SizedBox(height: 20),
              Text(
                'Application will be rejected if you upload Invalid ID#',
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 10),
              Text(
                'National ID Image Simple*',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildImageUploadContainer("Upload Photo", "(Front)", Icons.camera_alt_rounded),
                  _buildImageUploadContainer("Upload Photo", "(Back)", Icons.camera_alt_rounded),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Upload a Photo of Yourself Holding Your ID Card',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _getImage,
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.4,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.blue,
                        size: 40,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Upload Image',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Upload Self-Taken Photo',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _openFrontCamera,
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.4,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.blue,
                        size: 40,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Upload Image',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Choose How You Want To Be Paid',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'Select Payment Recent Type',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Radio(
                    value: 'Self',
                    groupValue: selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = value.toString();
                      });
                    },
                  ),
                  Text(
                    'Self',
                    style: TextStyle(color: Colors.white,fontSize: 11),
                  ),
                  Radio(
                    value: 'Via Agency',
                    groupValue: selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = value.toString();
                      });
                    },
                  ),
                  Text(
                    'Via Agency',
                    style: TextStyle(color: Colors.white,fontSize: 11),
                  ),
                  Radio(
                    value: 'Trusted 3rd',
                    groupValue: selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = value.toString();
                      });
                    },
                  ),
                  Text(
                    'Trust 3rd Party',
                    style: TextStyle(color: Colors.white,fontSize: 11),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Select Payment Recent Type',
                style: TextStyle(color: Colors.white),
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Radio(
                    value: 'Cash',
                    groupValue: selectedRadio2,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio2 = value.toString();
                      });
                    },
                  ),
                  Text(
                    'Cash',
                    style: TextStyle(color: Colors.white,fontSize: 12),
                  ),
                  Radio(
                    value: 'Bank',
                    groupValue: selectedRadio2,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio2 = value.toString();
                      });
                    },
                  ),
                  Text(
                    'Bank',
                    style: TextStyle(color: Colors.white,fontSize: 12),
                  ),
                  Radio(
                    value: 'Paypal',
                    groupValue: selectedRadio2,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio2 = value.toString();
                      });
                    },
                  ),
                  Text(
                    'Paypal',
                    style: TextStyle(color: Colors.white,fontSize: 12),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Radio(
                    value: 'I Want to Join a BanoLive Agency',
                    groupValue: selectedRadio3,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio3 = value.toString();
                      });
                    },
                  ),
                  Text(
                    'I Want to Join a BanoLive Agency',
                    style: TextStyle(color: Colors.white),
                  ),


                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Agency ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement your logic here when Apply button is pressed
                },
                child: Text('Apply'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountryPickerDropdown(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          showPhoneCode: false,
          onSelect: (Country country) {
            setState(() {
              selectedCountry = country.name;
            });
            countryController.text = country.name;
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey), // Add border decoration
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: countryController,
                enabled: false,
                decoration: InputDecoration(
                  hintText: 'Select Your Country',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  hintStyle: TextStyle(
                    color: selectedCountry.isNotEmpty ? Colors.white70 : Colors.white70,
                  ),
                ),
                style: TextStyle(
                  color: selectedCountry.isNotEmpty ? Colors.white70 : Colors.white,
                ),
              ),
            ),
            IconButton(
              onPressed: null, // Disabled IconButton
              icon: Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildImageUploadContainer(String text, String subText, IconData icon) {
    return GestureDetector(
      onTap: _getImage,
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.4, // Adjust the height based on the screen width
        width: MediaQuery.of(context).size.width * 0.4, // Adjust the width based on the screen width
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 40,
              ),
              SizedBox(height: 10),
              Text(
                text,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                subText,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const RoundedTextField({Key? key, required this.hintText, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Assign the controller to the TextFormField
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  final CameraController cameraController;

  const CameraScreen({Key? key, required this.cameraController}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    widget.cameraController.startImageStream((image) {
      // Handle the image stream here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(widget.cameraController),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.camera),
                  onPressed: () async {
                    try {
                      final XFile? image = await widget.cameraController.takePicture();
                      setState(() {
                        _imageFile = image;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                if (_imageFile != null) // Check if _imageFile is not null
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      // Upload the image
                      // Implement your image upload logic here
                      Navigator.pop(context);
                    },
                  ),
              ],
            ),
          ),
          if (_imageFile != null) // Display the captured image if available
            Center(
              child: Image.file(
                File(_imageFile!.path),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.cameraController.dispose();
    super.dispose();
  }
}
