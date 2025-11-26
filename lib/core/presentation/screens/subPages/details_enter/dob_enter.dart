import 'package:dating_app/core/constant/Theme/dating_colors.dart';
import 'package:dating_app/core/presentation/screens/subPages/details_enter/gender_get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DobEnter extends StatefulWidget {
  const DobEnter({super.key});

  @override
  State<DobEnter> createState() => _DobEnterState();
}

class _DobEnterState extends State<DobEnter> {
  TextEditingController dobController = TextEditingController();
  bool isEmpty = false;

  Future<void> saveAndNext() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dob', dobController.text);
    String? userName = prefs.getString('dob');
    print(userName);
  }

  @override
  void dispose() {
    dobController.dispose();
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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new, size: 26),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Your b-day ?',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 20.0),

                TextField(
                  onChanged: (value) {
                    setState(() {
                      isEmpty = value.trim().isNotEmpty;
                    });
                  },
                  keyboardType: TextInputType.datetime,
                  controller: dobController,
                  decoration: InputDecoration(
                    hintText: 'D D / M M / Y Y Y Y',
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
                      dobController.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GenderGet(),
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
