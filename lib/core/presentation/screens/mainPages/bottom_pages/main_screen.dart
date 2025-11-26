import 'package:dating_app/core/constant/Theme/dating_colors.dart';
import 'package:dating_app/core/presentation/screens/mainPages/bottom_pages/details_page/details_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tcard/tcard.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TCardController cardController = TCardController();
  bool showHeart = false;
  bool showReject = false;
  final List<Map<String, dynamic>> userProfiles = [
    {
      'name': 'Lavanya',
      'age': 25,
      'gender': 'Female',
      'hobby': 'Dancing, Yoga',
      'favorite': 'Tea Addict',
      'image':
          'https://res.cloudinary.com/di0gnp9ei/image/upload/v1764000850/photo-1622782262171-7eacb25db001_co5qjr.jpg',
    },
    {
      'name': 'Shruti Hasan',
      'age': 25,
      'gender': 'Female',
      'hobby': 'Singing, Movies',
      'favorite': 'Foodie',
      'image':
          'https://res.cloudinary.com/di0gnp9ei/image/upload/v1764000887/photo-1706943262117-b35de4ba50b4_rsw2hg.jpg',
    },
    {
      'name': 'Nisha Reddy',
      'age': 28,
      'gender': 'Female',
      'hobby': 'Gym, Cooking',
      'favorite': 'Dog Lover',
      'image':
          'https://res.cloudinary.com/di0gnp9ei/image/upload/v1764000927/photo-1624610261655-777af2f586d7_ezsz9i.jpg',
    },
    {
      'name': 'Kavya Suresh',
      'age': 25,
      'gender': 'Female',
      'hobby': 'Photography',
      'favorite': 'Beach Lover',
      'image':
          'https://res.cloudinary.com/di0gnp9ei/image/upload/v1764000971/photo-1618559850638-2aed8a8e8cdc_yzuhhr.jpg',
    },
    {
      'name': 'Divya Shah',
      'age': 30,
      'gender': 'Female',
      'hobby': 'Travel, Books',
      'favorite': 'Art Fan',
      'image':
          'https://res.cloudinary.com/di0gnp9ei/image/upload/v1764001013/premium_photo-1661964122297-48da1eeac9a6_d4glwm.jpg',
    },
    {
      'name': 'Rithika Mohan',
      'age': 27,
      'gender': 'Female',
      'hobby': 'Fitness, Long Drive',
      'favorite': 'Cat Lover',
      'image':
          'https://res.cloudinary.com/di0gnp9ei/image/upload/v1764001055/photo-1551854716-8b811be39e7e_xd5il1.jpg',
    },
    {
      'name': 'Sana Irfan',
      'age': 23,
      'gender': 'Female',
      'hobby': 'Makeup, Blogging',
      'favorite': 'Fashion Lover',
      'image':
          'https://res.cloudinary.com/di0gnp9ei/image/upload/v1764001099/premium_photo-1661964243697-734d7bd664ff_xqnamw.jpg',
    },
    {
      'name': 'Madhumita',
      'age': 34,
      'gender': 'Female',
      'hobby': 'Classical Music',
      'favorite': 'Calm Vibes',
      'image':
          'https://res.cloudinary.com/di0gnp9ei/image/upload/v1764001134/photo-1622049605334-72e1e4432346_abt5kv.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 40),

          /// Logo Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/date.png',
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Text('Sparkle', style: TextStyle(color: DatingColors.primaryclr)),
            ],
          ),

          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                /// Swipe Cards
                TCard(
                  controller: cardController,
                  size: Size(
                    MediaQuery.of(context).size.width * 0.9,
                    MediaQuery.of(context).size.height * 0.7,
                  ),
                  cards: userProfiles.map((user) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              user['image'],
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsPage(user: user),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${user['name']}, ${user['age']}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    user['hobby'],
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onForward: (index, info) {
                    /// Restart cards smoothly
                    if (index == userProfiles.length - 1) {
                      Future.delayed(
                        const Duration(milliseconds: 300),
                        () => cardController.reset(),
                      );
                    }

                    /// Like Animation
                    if (info.direction == SwipDirection.Right) {
                      setState(() => showHeart = true);

                      Future.delayed(
                        const Duration(milliseconds: 500),
                        () => setState(() => showHeart = false),
                      );
                    }

                    if (info.direction == SwipDirection.Left) {
                      setState(() => showReject = true);

                      Future.delayed(
                        const Duration(milliseconds: 500),
                        () => setState(() => showReject = false),
                      );
                    }
                  },
                ),

                /// Center Heart Animation
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: showHeart ? 1 : 0,
                  child: Lottie.asset(
                    'assets/images/like.json',
                    width: 180,
                    height: 180,
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: showReject ? 1 : 0,
                  child: Lottie.asset(
                    'assets/images/reject.json',
                    width: 180,
                    height: 180,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: Image.asset('assets/images/bottom.png', fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
