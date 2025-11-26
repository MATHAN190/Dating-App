import 'package:dating_app/core/constant/Theme/dating_colors.dart';
import 'package:flutter/material.dart';

class ChatScreenPage extends StatelessWidget {
  final Map<String, dynamic> favUser;
  const ChatScreenPage({required this.favUser, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              decoration: BoxDecoration(color: DatingColors.primaryclr),
              child: Row(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 15.0),
                      CircleAvatar(
                        minRadius: 27,
                        backgroundImage: NetworkImage('${favUser['image']}'),
                      ),
                      SizedBox(width: 15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' ${favUser['name']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),

                          // online
                          Text(
                            ' Online',
                            style: TextStyle(
                              color: Colors.grey.shade200,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // keela ulla content
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: DatingColors.lavendar,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hi , how are you',
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(height: 4.0),
                        Text('9.15 Am', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  //type
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
