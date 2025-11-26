import 'package:dating_app/core/presentation/screens/mainPages/lobby_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "";
  String dob = "";
  String gender = "";
  String imageUrl = "";

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name") ?? "User";
      dob = prefs.getString("dob") ?? "Not set";
      gender = prefs.getString("gender") ?? "Male";
      imageUrl =
          prefs.getString("imageUrl") ??
          "https://i.postimg.cc/sg5FC24h/user.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Container(
         margin: EdgeInsets.symmetric(vertical: 30.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [

             SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LobbyPage(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Icon(Icons.arrow_back_ios_new),
                    ),

                    SizedBox(width: 10),
                    Text(
                      'Chat',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.settings),
                ),
              ],
            ),

            SizedBox(height: 20),
            CircleAvatar(radius: 70, backgroundImage: NetworkImage(imageUrl)),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(gender, style: TextStyle(fontSize: 18, color: Colors.grey[600])),
            SizedBox(height: 8),
            Text(
              "DOB: $dob",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  buildTile("Name", name),
                  buildTile("Gender", gender),
                  buildTile("Date of Birth", dob),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTile(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(value, style: TextStyle(fontSize: 17, color: Colors.black87)),
        ],
      ),
    );
  }
}
