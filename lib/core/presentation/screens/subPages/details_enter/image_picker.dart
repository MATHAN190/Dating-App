import 'dart:io';
import 'package:dating_app/core/constant/Theme/dating_colors.dart';
import 'package:dating_app/core/presentation/screens/mainPages/bottom_pages/main_screen.dart';
import 'package:dating_app/core/presentation/screens/mainPages/lobby_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class ProfileImagePage extends StatefulWidget {
  const ProfileImagePage({super.key});

  @override
  State<ProfileImagePage> createState() => _ProfileImagePageState();
}

class _ProfileImagePageState extends State<ProfileImagePage> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    loadSavedImage();
  }

  // ------------------------------
  // PICK IMAGE FROM GALLERY
  // ------------------------------
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked == null) return;

    File tempImage = File(picked.path);

    String savedPath = await saveImageToAppDir(tempImage);
    await savePathToPrefs(savedPath);

    setState(() {
      _imageFile = File(savedPath);
    });
  }

  // ------------------------------
  // SAVE IMAGE TO APP FOLDER
  // ------------------------------
  Future<String> saveImageToAppDir(File image) async {
    final dir = await getApplicationDocumentsDirectory();
    final newPath = '${dir.path}/profile_image.jpg';

    final newImage = await image.copy(newPath);
    return newImage.path;
  }

  // ------------------------------
  // SAVE PATH IN SHAREDPREFS
  // ------------------------------
  Future<void> savePathToPrefs(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', path);
  }

  // ------------------------------
  // LOAD SAVED IMAGE IF EXISTS
  // ------------------------------
  Future<void> loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('profile_image');

    if (path != null) {
      setState(() {
        _imageFile = File(path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Store screen width for cleaner code
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        // The outer margin and padding remain the same
        margin: EdgeInsets.symmetric(vertical: screenHeight * 0.07),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

        // Use Column for vertical layout
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back_ios_new, size: 26),
            SizedBox(height: 20.0),
            Text(
              'Upload your current',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: DatingColors.primaryclr,
              ),
            ),
            Text(
              'Image ?',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30.0),

            // --------------------------
            // CIRCLE PROFILE IMAGE VIEW
            // --------------------------
            Center(
              child: GestureDetector(
                onTap: () {
                  pickImage();
                },
                // The main image container (now showing the picked image or placeholder)
                child: Container(
                  width: screenWidth / 2,
                  height: screenHeight / 4,
                  decoration: BoxDecoration(
                    color: DatingColors.lavendar,
                    borderRadius: BorderRadius.circular(12),
                    // Display the image if it's available
                    image: _imageFile != null
                        ? DecorationImage(
                            image: FileImage(_imageFile!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: _imageFile == null
                      ? Center(child: Icon(Icons.add_a_photo_rounded, size: 28))
                      : null, // Only show icon if no image is loaded
                ),
              ),
            ),

            // --------------------------
            // SPACER to push the next widget (button) to the bottom
            // --------------------------
            const Spacer(),

            // --------------------------
            // PICK BUTTON (Container moved out of the old Column/Positioned)
            // --------------------------
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context)=> const LobbyPage()),
                  (route) => false,
                );
              },
              child: Container(
                // Use screenWidth to match the padding of the main Container
                width:
                    screenWidth - 40.0, // screenWidth - (2*horizontal padding)
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  color: DatingColors.coral,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Finish', // Changed to "Continue" for a button action
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ), // Optional: Add a small space at the bottom if needed
          ],
        ),
      ),
    );
  }
}
