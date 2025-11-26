import 'package:dating_app/core/constant/Theme/dating_colors.dart';
import 'package:dating_app/core/presentation/screens/mainPages/bottom_pages/chatpages/chat_screen_page.dart';
import 'package:dating_app/core/presentation/screens/mainPages/lobby_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> favUser = {
      'name': 'Lavanya',
      'age': 25,
      'gender': 'Female',
      'hobby': 'Dancing, Yoga',
      'favorite': 'Tea Addict',
      'image':
          'https://res.cloudinary.com/di0gnp9ei/image/upload/v1764000850/photo-1622782262171-7eacb25db001_co5qjr.jpg',
    };

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: Icon(Icons.more_vert),
                ),
              ],
            ),

            SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreenPage(favUser: favUser)),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: DatingColors.lavendar,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 35,
                      backgroundImage: NetworkImage(favUser['image']),
                    ),
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${favUser['name']}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' Hi , how are you',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
