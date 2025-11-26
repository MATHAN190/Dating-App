import 'package:dating_app/core/constant/Theme/dating_colors.dart';
import 'package:dating_app/core/presentation/screens/subPages/details_enter/dob_enter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterName extends StatefulWidget {
  const EnterName({super.key});

  @override
  State<EnterName> createState() => _EnterNameState();
}

class _EnterNameState extends State<EnterName> {
  TextEditingController nameController = TextEditingController();
  bool isEmpty = false;
  final snackBar = SnackBar(
    content: const Text('This is a message!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some action to undo the previous operation
      },
    ),
    duration: const Duration(seconds: 3), // Optional: how long it stays visible
  );

  Future<void> saveAndNext() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', nameController.text);
    String? userName = prefs.getString('name');
    print(userName);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.07,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back_ios_new, size: 26),
                SizedBox(height: 20.0),
                Text(
                  'What is your first',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: DatingColors.primaryclr,
                  ),
                ),
                Text(
                  'Name ?',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20.0),

                TextField(
                  onChanged: (value) {
                    setState(() {
                      isEmpty = value.trim().isNotEmpty;
                    });
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'This is how it will appear on your profile',
                  style: TextStyle(fontSize: 15.0, color: DatingColors.grey),
                ),
                Text(
                  'Can not change later!',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ],
            ),

            GestureDetector(
              onTap: isEmpty
                  ? () {
                      saveAndNext();
                      nameController.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DobEnter(),
                        ),
                      );
                    }
                  : null,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: isEmpty
                      ? DatingColors.primaryclr
                      : Colors.grey.shade300,
                ),
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isEmpty ? Colors.white : Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
