import 'package:dating_app/core/constant/Theme/dating_colors.dart';
import 'package:dating_app/core/presentation/screens/subPages/details_enter/image_picker.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GenderGet extends StatefulWidget {
  const GenderGet({super.key});

  @override
  State<GenderGet> createState() => _GenderGetState();
}

class _GenderGetState extends State<GenderGet> {
  TextEditingController genderController = TextEditingController();
  bool isEmpty = false;

  bool men = false;
  bool women = false;
  bool others = false;
  bool isSelect = false;

  Future<void> saveAndNext() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('men', men);
    prefs.setBool('women', women);
    prefs.setBool('other', others);
  }

  @override
  void dispose() {
    genderController.dispose();
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
                  'Your Gender ?',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 20.0),

                GestureDetector(
                  onTap: () {
                   
                    setState(() {
                       men = true;
                    women = false;
                    others = false;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    decoration: BoxDecoration(
                      border: BoxBorder.all(
                        color: men
                            ? DatingColors.primaryclr
                            : DatingColors.lavendar,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Men',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: DatingColors.primaryclr,
                        ),
                      ),
                    ),
                  ),
                ),

                //women
               SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                GestureDetector(
                  onTap: () {
                    men = false;
                    women = true;
                    others = false;
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    decoration: BoxDecoration(
                      border: BoxBorder.all(
                        color: women
                            ? DatingColors.primaryclr
                            : DatingColors.lavendar,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Women',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: DatingColors.primaryclr,
                        ),
                      ),
                    ),
                  ),
                ),

              // others
               SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                GestureDetector(
                  onTap: () {
                    men = false;
                    women = false;
                    others = true;
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    decoration: BoxDecoration(
                      border: BoxBorder.all(
                        color: others
                            ? DatingColors.primaryclr
                            : DatingColors.lavendar,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Others',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: DatingColors.primaryclr,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),

            GestureDetector(
              onTap: 
                   () {
                      saveAndNext();                     
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileImagePage(),
                        ),
                      );
                    }
                  ,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: 
                       DatingColors.primaryclr
                    
                ),
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
