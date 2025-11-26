import 'package:dating_app/core/constant/Theme/dating_colors.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> user;

  const DetailsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
        slivers: [
          // 🔥 TOP IMAGE AREA
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.55,
            backgroundColor: Colors.black,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // IMAGE
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(user['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // DARK GRADIENT BOTTOM
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.9),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),

                  // NAME + AGE OVER IMAGE
                  Positioned(
                    left: 20,
                    bottom: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${user['name']}, ${user['age']}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white70,
                              size: 20,
                            ),
                            SizedBox(width: 6),
                            Text(
                              "2 km away",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔥 MAIN CONTENT
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ABOUT SECTION
                  Text(
                    "About",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    user['bio'] ??
                        "I love meeting new people, exploring new cafés, "
                            "and enjoying peaceful nights with music. "
                            "Looking for someone who enjoys deep conversations "
                            "and spontaneous adventures.💕",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: 25),

                  // HOBBIES
                  Text(
                    "Hobbies",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: user['hobby']
                        .toString()
                        .split(',')
                        .map(
                          (h) => Chip(
                            label: Text(h.trim()),
                            backgroundColor: Colors.pink.shade50,
                          ),
                        )
                        .toList(),
                  ),

                  SizedBox(height: 25),

                  // FAVORITES
                  Text(
                    "Favorites",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: user['favorite']
                        .toString()
                        .split(',')
                        .map(
                          (f) => Chip(
                            label: Text(f.trim()),
                            backgroundColor: Colors.orange.shade50,
                          ),
                        )
                        .toList(),
                  ),

                  SizedBox(height: 40),

                  // MESSAGE BUTTON
                  Center(
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: DatingColors.coral,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Send Message",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
