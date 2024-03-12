import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentit/screens/summary_details.dart';
import '../helpers.dart';

class PhotoCaptureStepPage extends StatefulWidget {
  const PhotoCaptureStepPage({super.key});

  @override
  _PhotoCaptureStepPageState createState() => _PhotoCaptureStepPageState();
}

class _PhotoCaptureStepPageState extends State<PhotoCaptureStepPage> {
  late List<CameraDescription> cameras;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final Map<int, File?> _capturedImages = {};
  int? _selectedContainerIndex;

  @override
  void initState() {
    super.initState();
    _selectedContainerIndex = null;
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );
    return _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? allDetails = Get.arguments as Map<String, dynamic>?;

    if (allDetails != null) {
      Map<String, dynamic>? personalDetails = allDetails['personalDetails'];
      if (personalDetails != null) {
        // Print personal details
        print('Entered Full Name: ${personalDetails['fullName']}');
        print('Entered Date of Birth: ${personalDetails['dateOfBirth']}');
        print('Entered Phone Number: ${personalDetails['phoneNumber']}');
        print('Entered Email Address: ${personalDetails['emailAddress']}');
        print('Entered Next of Kin Name: ${personalDetails['guarantorName']}');
        print('Entered Next of Kin Phone: ${personalDetails['guarantorPhone']}');
        print('Entered Next of Kin Relation: ${personalDetails['relation']}');
      }

      Map<String, dynamic>? financialDetails = allDetails['financialDetails'];
      if (financialDetails != null) {
        // Print financial details
        print('Received Monthly Income: ${financialDetails['income']}');
        print('Received Credit Score: ${financialDetails['creditScore']}');
        print('Received Account Number: ${financialDetails['accountNumber']}');
        print('Received Bank Name: ${financialDetails['bankName']}');
      }

      Map<String, dynamic>? loanPurposeDetails = allDetails['loanPurposeDetails'];
      if (loanPurposeDetails != null) {
        // Print loan purpose details
        print('Loan Amount Requested: ${loanPurposeDetails['loanAmount']}');
        print('Purpose of Loan: ${loanPurposeDetails['loanPurpose']}');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Identification Card Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedContainerIndex = 0;
                });
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: _selectedContainerIndex == 0 ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 250.0,
                    width: Helpers.screenWidth(),
                    child: _selectedContainerIndex == 0
                        ? CameraPreview(_controller)
                        : _capturedImages[0] != null
                        ? Image.file(
                      _capturedImages[0]!,
                      height: 250.0,
                      width: Helpers.screenWidth(),
                      fit: BoxFit.cover,
                    )
                        : const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, color: Colors.white),
                          SizedBox(height: 8.0),
                          Text("Front of ID", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedContainerIndex = 1;
                });
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: _selectedContainerIndex == 1 ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 250.0,
                    width: Helpers.screenWidth(),
                    child: _selectedContainerIndex == 1
                        ? CameraPreview(_controller)
                        : _capturedImages[1] != null
                        ? Image.file(
                      _capturedImages[1]!,
                      height: 250.0,
                      width: Helpers.screenWidth(),
                      fit: BoxFit.cover,
                    )
                        : const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, color: Colors.white),
                          SizedBox(height: 8.0),
                          Text("Back of ID", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: OutlinedButton.icon(
                onPressed: () async {
                  await _initializeControllerFuture;

                  final XFile photo = await _controller.takePicture();

                  setState(() {
                    if (_selectedContainerIndex != null) {
                      _capturedImages[_selectedContainerIndex!] = File(photo.path);
                    }
                    _selectedContainerIndex = null;
                  });
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text("Capture Photo"),
                style: ButtonStyle(
                  side: MaterialStateProperty.resolveWith((states) {
                    return const BorderSide(color: Colors.blue);
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0), // Adjust the radius as needed
                    ),
                  ),
                ),// Add this line for the outline
              ),
            ),


            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Pass details and captured images to the summary page
                  Get.to(() => const LoanSummaryScreen(), arguments: {
                    'details': allDetails,
                    'capturedImages': _capturedImages,
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Adjust padding as needed
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), // Adjust radius as needed
                  ),
                ),
                child: const Text("Finish Application"),
              ),

            ),

            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
